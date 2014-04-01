jekyll-html-pipeline
====================

An [HTML::Pipeline](https://github.com/jch/html-pipeline), for Jekyll.


## Installation

In your *_config.yml* file, add this gem:

``` yaml
gems:
  - jekyll-html-pipeline
```

## Configuration

You'll need to be running a Jekyll version after 1.4.3, which is when custom
Markdown filters were introduced. In your *_config.yml* file, indicate that you
want to use `html_pipeline`:

``` yaml
markdown: HTMLPipeline
```

Next, create an `html_pipeline` key, and indicate which filters you want to include:

``` yaml
markdown: HTMLPipeline
html_pipeline:
  filters:
    - "markdownfilter"
    - "sanitizationfilter"
    - "emojifilter"
    - "mentionfilter"
```

Finally, some filters require a context object. You can define these next:

``` yaml
markdown: HTMLPipeline
html_pipeline:
  filters:
    - "markdownfilter"
    - "sanitizationfilter"
    - "emojifilter"
    - "mentionfilter"
  context:
    asset_root: "http://foo.com/icons"
    base_url:   "https://github.com/"
```

Keep in mind that [filter dependencies are not bundled](https://github.com/jch/html-pipeline#dependencies),
so you'll need to add these in yourself.
