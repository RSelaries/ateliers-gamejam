import { LitElement, html, css, unsafeCSS } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

const opened = new URL( "../medias/icons/folder-opened.svg", import.meta.url).href
const closed = new URL( "../medias/icons/folder-closed.svg", import.meta.url).href

class LeftPanel extends LitElement {
    static styles = css`
        .left-panel-nav {
            text-decoration: none;
            padding: 20px 10px;
            overflow-y: auto;
            max-height: calc(100vh - var(--header-size));
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

        .subpage-btn {
            color: var(--body-text-color);
            display: none;

            .subpage-icon {
                height: 16px;
                aspect-ratio: 1;
                background-color: var(--body-text-color);
                mask-size: 100%;
                -webkit-mask-repeat: no-repeat;
                mask-repeat: no-repeat;
                mask-position: center;
            }
        }

        .subpage-btn[open] {
            display: inline;
            color: var(--highlight-color);

            .subpage-icon {
                background-color: var(--highlight-color);
            }
        }

        .subpage-btn:hover {
            color: var(--highlight-color);
        }

        .subpage-list {
            padding-left: 2em;
        }

        .page-btn {
            cursor: pointer;
            justify-content: center;
            display: flex;
            flex-direction: column;
        }
        .page-btn:hover {
            color: var(--highlight-color);

            .page-icon {
                background-color: var(--highlight-color);
            }
        }
        .page-btn[open] {
            color: var(--highlight-color);

            .page-icon {
                background-color: var(--highlight-color);
            }

            .subpage-btn {
                display: inline;
            }
        }

        .page-btn .page-icon {
            height: 16px;
            aspect-ratio: 1;
            background-color: var(--body-text-color);
            mask-size: 100%;
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            mask-position: center;
        }

        details > summary {
            border-radius: 10px;
            gap: 5px;
            margin: 5px;
            padding: 5px;
            font-weight: 500;
            text-transform: uppercase;
            user-select: none;
            cursor: pointer;
            white-space: nowrap;
            display: flex;
        }
        details > summary:hover {
            background-color: var(--highlight-color-transparent);
        }

        .title-wrapper {
            display: flex;
            align-items: center;
            gap: 5px;
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
            min-width: 24px;
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
                return html`<li class="page-btn ${pageSlug}">
                    <div class="title-wrapper" @click=${() => this.changeToPage(page)}>
                        ${page.icon !== "" ? html`<div class="page-icon" style="mask-image: url(${page.icon})"></div>` : ""}
                        ${page.title}
                    </div>
                    ${page.subPages ? html`<ol class="subpage-list">${subPageLink(page.subPages)}</ol>` : ""}
                </li>`
            })
        }

        const subPageLink = (pages) => {
            return pages.map((subpage) => {
                const subpageSlug = subpage.link.split("/")[1].split(".")[0]
                return html`<li class="subpage-btn ${subpageSlug}">
                    <div class="title-wrapper" @click=${() => this.changeToPage(subpage)}>
                        ${subpage.icon !== "" ? html`<div class="subpage-icon" style="mask-image: url(${subpage.icon})"></div>` : ""}
                        ${subpage.title}
                    </div>
                </li>
                `
            })
        }

        return html`
        <nav class="left-panel-nav">
            <ol class="category-list">
                ${pages.map((category) => html`<li class="category ${category.slug}">
                    <details open="">
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
        document.querySelector("wc-header").shadowRoot.querySelector("left-panel-burger").closeMenu()
    }

    firstUpdated() {
        super.firstUpdated()
        this.openActivePage()
    }

    openActivePage() {
        const pageBtns = this.renderRoot.querySelectorAll(".page-btn")
        const subpageBtns = this.renderRoot.querySelectorAll(".subpage-btn")
        const allPagesBtns = [...pageBtns, ...subpageBtns]
        const caterogyToOpen = window.location.hash.replace("#", "").split("/")[0]
        const hash = window.location.hash.split("#")
        const pageToOpen = hash.length > 1 ? hash[1].replace(".html", "").replace(".md", "").split("/")[1] : null
        
        for(let i = 0; i< allPagesBtns.length; i++) {
            if (caterogyToOpen) {
                if (allPagesBtns[i].className.includes(pageToOpen)) {
                    allPagesBtns[i].setAttribute("open", true)
                } else {
                    allPagesBtns[i].removeAttribute("open")
                }
            } else {
                if (allPagesBtns[i].className.includes("introduction")) allPagesBtns[i].setAttribute("open", true)
                else allPagesBtns[i].removeAttribute("open")
            }
        }
    }
}

customElements.define('left-panel', LeftPanel)