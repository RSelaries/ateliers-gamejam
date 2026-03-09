import { LitElement, html, css, unsafeCSS } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

const opened = new URL( "../medias/icons/folder-opened.svg", import.meta.url).href
const closed = new URL( "../medias/icons/folder-closed.svg", import.meta.url).href

class LeftPanel extends LitElement {
    static styles = css`
        .left-panel-nav {
            text-decoration: none;
            padding: 20px 10px;
            /* height: 100%; */
        }
        *::marker {
            content: "";
        }
        *[open]::marker {
            content: "";
        }

        .category-list {
            padding: 0px;
        }

        .page-btn {
            cursor: pointer;
        }
        .page-btn:hover {
            color: var(--highlight-color);
        }
        .page-btn[open] {
            color: var(--highlight-color);
        }

        details > summary {
            border-radius: 10px;
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 5px;
            margin: 5px;
            padding: 5px;
            font-weight: 500;
            text-transform: uppercase;
            user-select: none;
            cursor: pointer
        }
        details > summary:hover {
            background-color: var(--highlight-color-transparent);
        }

        details .folder-icon {
            /* background-color: light-dark(var(--highlight-color), var(--body-text-color)); */
            background-color: var(--body-text-color);
            mask-size: 100%;
            -webkit-mask-repeat: no-<repeat;
            mask-repeat: no-repeat;
            mask-position: center;
            mask-image: url(${unsafeCSS(closed)});
            width: 24px;
            aspect-ratio: 1;
            display: inline-block;
        }
        details[open] .folder-icon {
            mask-image: url(${unsafeCSS(opened)});
        }
    `

    constructor() {
        super()

        window.addEventListener("hashchange", () => {
            this.openActivePage()
        })
    }

    render() {
        const pageLink = (category) => {
            return category.pages.map((page) => {
                const pageSlug = page.link.split("/")[1].split(".")[0]
                return html`<li class="page-btn ${pageSlug}" @click=${() => this.changeToPage(page)}>
                    ${page.title}
                </li>`
            })
        }

        return html`
        <nav class="left-panel-nav">
            <ol class="category-list">
                ${pages.map((category) => html`<li class="category ${category.slug}">
                    <details>
                        <summary>
                            <div class="folder-icon"></div>
                            ${category.name}
                        </summary>
                        <ol>
                            ${pageLink(category)}
                        </ol>
                    </details>
                </li>`)}
            </ol>
        </nav>
        `
    }

    changeToPage(page) {
        window.location.hash = page.link
    }

    firstUpdated() {
        super.firstUpdated()
        this.openActivePage()
    }

    openActivePage() {
        const categories = this.renderRoot.querySelectorAll(".category")
        const pageBtns = this.renderRoot.querySelectorAll(".page-btn")
        const caterogyToOpen = window.location.hash.replace("#", "").split("/")[0]
        const pageToOpen = window.location.hash
            .split("#")[1].replace(".html", "")
            .replace(".md", "").split("/")[1]
        
        for(let i = 0; i < categories.length; i++) {
            if (caterogyToOpen) {
                categories[i].querySelector("details").open = categories[i].className.includes(caterogyToOpen)
            } else {
                categories[i].querySelector("details").open = categories[i].className.includes("introduction")
            }
        }

        for(let i = 0; i< pageBtns.length; i++) {
            if (pageBtns[i].className.includes(pageToOpen)) {
                pageBtns[i].setAttribute("open", true)
            } else {
                pageBtns[i].removeAttribute("open")
            }
        }
    }
}

customElements.define('left-panel', LeftPanel)