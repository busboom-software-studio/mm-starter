#!/bin/bash


script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

data_dir="${script_dir}/../_data"

username="${GITHUB_USER}"
[ -z "$username" ] && { echo "Error: GITHUB_USER not found"; exit 1; }
[ -n "$GITHUB_TOKEN" ] && export GH_TOKEN="$GITHUB_TOKEN"

temp_dir=$(mktemp -d)
cd "$temp_dir"

echo "repositories:" > repos.yaml

gh repo list "$username" --json name,url,description,createdAt,updatedAt,visibility --limit 1000 | \
jq -r '.[] | "\(.name)\t\(.url)\t\(.description)\t\(.createdAt)\t\(.updatedAt)\t\(.visibility)"' | \
while IFS=$'\t' read -r name url description created updated visibility; do
    {
        echo "  - name: $name"
        echo "    url: $url"
        echo "    description: \"${description:-No description}\""
        echo "    created_at: $created"
        echo "    updated_at: $updated"
        #echo "    visibility: $visibility"
        
        echo ""
    } >> repos.yaml
done

mv repos.yaml "$data_dir/repositories.yaml"
rm -rf "$temp_dir"
echo "Generated $data_dir/repositories.yaml"

