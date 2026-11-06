# 🧱 HTML, CSS and JavaScript

A web app is a set of text files that the browser downloads and combines. Three languages divide
the work. HTML describes the content and its structure, CSS describes how it looks, and
JavaScript makes it respond to the reader. The starter app in the
[app template](https://github.com/espm-157/app-template) has one file for each: `index.html`,
`style.css` and `app.js`.

## HTML

HTML marks up the content of the page: headings, paragraphs, links, menus, sliders and an empty
space where a chart will go. Each element is written as a pair of tags.

```html
<label>
  Country
  <select id="country"></select>
</label>
<figure>
  <div id="chart"></div>
</figure>
```

The browser gives each element a default appearance and behavior, so this is already a working
menu. Choosing the element that matches the meaning, such as `<select>` for a menu or `<button>`
for a button, also makes the page usable with a keyboard and a screen reader.

## CSS

CSS sets the appearance and layout of the elements: colors, fonts, spacing, and where each element
sits on the screen. A rule names the elements it applies to and then the properties to set.

```css
main {
  max-width: 48rem;
  margin: 0 auto;
}

@media (prefers-color-scheme: dark) {
  :root { --background: #0d1117; }
}
```

A media query, such as the `@media` rule above, applies styles only under some condition, for
example a dark-mode setting or a narrow phone screen. This is how one page adapts to many devices.

## JavaScript

JavaScript is a programming language that runs in the browser. It reads data, computes, and
changes the page while the reader is using it. In the starter app, JavaScript loads DuckDB-WASM and
Observable Plot, reads the CO₂ file, and redraws the chart whenever a control changes.

```js
document.querySelector("#controls").addEventListener("input", update);
```

This line asks the browser to run the `update` function every time the reader changes any of the
controls. Most interactive apps follow the same pattern: wait for an event, update the state,
and redraw the parts of the page that depend on it.

## How the files fit together

The HTML file is the entry point. It links the stylesheet and the script:

```html
<link rel="stylesheet" href="style.css" />
<script type="module" src="app.js"></script>
```

The script in turn imports libraries such as Observable Plot from a content delivery network, at
fixed versions. GitHub Pages only sends these files to the reader's browser, and all of the
computing happens there. Libraries such as Bootstrap and MapLibre arrive in the same way: each
one adds CSS, JavaScript or both on top of the same three languages.

The browser's [developer tools](https://developer.mozilla.org/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools)
show all three at work. The elements panel shows the HTML and the CSS rules applied to any
element you select, and you can edit both live. The console shows errors from JavaScript.

## Further reading

The Mozilla Developer Network (MDN) is the standard reference for the web.

- [Your first website](https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Your_first_website)
  builds a small page in three steps:
  [content](https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Creating_the_content),
  [styling](https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Styling_the_content)
  and [interactivity](https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Adding_interactivity).
- MDN's longer modules cover [HTML](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Structuring_content),
  [CSS](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Styling_basics) and
  [JavaScript](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Scripting).
- The W3C [introduction to web accessibility](https://www.w3.org/WAI/fundamentals/accessibility-intro/)
  explains why structure and keyboard access matter.
