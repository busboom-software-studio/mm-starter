---
permalink: /howto/
title: "How to use this Jekyll Service"
toc: true
---

## Initial Setup: Name and Links

Settings that affect your entire site can be changed in [Jekyll's configuration file](https://jekyllrb.com/docs/configuration/): `_config.yml`, found in the root of your project. If you don't have this file you'll need to copy or create one using the theme's [default `_config.yml`](https://github.com/mmistakes/minimal-mistakes/blob/master/_config.yml) as a base.

**Note:** for technical reasons, `_config.yml` is NOT reloaded automatically when used with `jekyll serve`. If you make any changes to this file, please restart the server process for them to be applied.
{: .notice--warning}

## Configure Navigation

The Navigation bar is the links in the upper left. THe link here can be edited from 
`_data/navigation.yaml` and looks like this: 

```markdown
  - title: "Posts"
    url: /posts/
  - title: "Categories"
    url: /categories/
  #- title: "Tags"
  #  url: /tags/
  - title: "About"
    url: /about/
  - title: "Repos"
    url: /repos/
  - title: "Projects"
    url: /portfolio/
```



[Navigation documentation](https://mmistakes.github.io/minimal-mistakes/docs/navigation/)

## Adding Pages

[Pages](https://mmistakes.github.io/minimal-mistakes/docs/pages/)

## Adding Posts

Post are blog posts, articles that you'd write for a specific day or time, and
aren't a permanent part of your website.

[Posts](https://mmistakes.github.io/minimal-mistakes/docs/posts/)

## Configure the Repo List


## Portfolio Projects

## Fancy Formatting

[https://mmistakes.github.io/minimal-mistakes/docs/utility-classes/](https://mmistakes.github.io/minimal-mistakes/docs/utility-classes/)


## Other Page Structures

### Plain Pages

### Splash Pages



Change your top menu from `_data/navigation.yml`, and most other links on the page
in `_config.yml`

See [https://mmistakes.github.io/minimal-mistakes/](https://mmistakes.github.io/minimal-mistakes/) for 
documentation on the MM Theme. 


Example of a [Splash Page](splash/)

