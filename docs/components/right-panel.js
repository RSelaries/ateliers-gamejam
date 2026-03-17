import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class RightPanel extends LitElement {
    static properties = {
        hierarchy: {},
    }

    static styles = css`
        nav {
            /* min-width: 300px; */
            text-decoration: none;
            padding: 20px 0px;
            padding-right: 10px;
            /* height: 100%; */
        }
        .title-btn {
            cursor: pointer;
            color: var(--body-text-color-faded);
            font-weight: 300;
        }
        .title-btn:hover {
            color: var(--body-text-color);
        }
        *::marker {
            content: "";
        }
        *[open]::marker {
            content: "";
        }
        ol {
            padding-left: 15px;
            margin: 0px;
        }
    `

    constructor() {
        super()
        this.hierarchy = []
    }

    render() {
        const nodeElement = (node) => {
            return html`
                <li>
                    <div class="title-btn" @click=${() => this.goToTitle(node.id)}>${node.name}</div>
                    <ol>
                        ${node.children.map((node) => {
                            if (node.name) {
                                return nodeElement(node)
                            }
                        })}
                    </ol>
                </li>
            `
        }

        return html`
            <nav>
                ${this.hierarchy.map((node) => {
                    return nodeElement(node)
                })}
            </nav>
        `
    }

    goToTitle(titleId) {
        const currentHash = {
            category: window.location.hash.split("#")[1],
            title: window.location.hash.split("#")[2],
        }

        currentHash.title = titleId

        window.location.hash = `#${currentHash.category}#${currentHash.title}`
    }
}

customElements.define('right-panel', RightPanel)