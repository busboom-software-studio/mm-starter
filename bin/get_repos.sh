#!/bin/bash

# Get GitHub username
username=$(git config user.name)

# Create temporary directory
temp_dir=$(mktemp -d)
cd "$temp_dir"

# Initialize YAML file
echo "repositories:" > repos.yaml

# Clone and analyze each repository
gh repo list "$username" --json name,url,description,createdAt,updatedAt,visibility --limit 1000 | \
while read -r repo; do
    name=$(echo "$repo" | jq -r '.name')
    url=$(echo "$repo" | jq -r '.url')
    description=$(echo "$repo" | jq -r '.description // "No description"')
    created=$(echo "$repo" | jq -r '.createdAt')
    updated=$(echo "$repo" | jq -r '.updatedAt')
    visibility=$(echo "$repo" | jq -r '.visibility')
    
    echo "  - name: $name" >> repos.yaml
    echo "    url: $url" >> repos.yaml
    echo "    description: \"$description\"" >> repos.yaml
    echo "    created_at: $created" >> repos.yaml
    echo "    updated_at: $updated" >> repos.yaml
    echo "    visibility: $visibility" >> repos.yaml
    
    # Clone repo to get additional details
    git clone "$url" "$name" 2>/dev/null
    if [ -d "$name" ]; then
        cd "$name"
        
        # Get primary language
        lang=$(git ls-files | grep -v "^\./" | xargs file --mime-type | grep "text/" | cut -d: -f1 | xargs cat | wc -l)
        echo "    primary_language: $lang" >> ../repos.yaml
        
        # Get commit count
        commits=$(git rev-list --count HEAD)
        echo "    total_commits: $commits" >> ../repos.yaml
        
        # Get branch count
        branches=$(git branch -r | wc -l)
        echo "    total_branches: $branches" >> ../repos.yaml
        
        cd ..
    fi
    echo "" >> repos.yaml
done

# Move YAML file to current directory
mv repos.yaml $PWD/repositories.yaml

# Cleanup
rm -rf "$temp_dir"

echo "Generated repositories.yaml in current directory"