import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class WCHeader extends LitElement {
    static styles = css`
        header {
            width: 100vw;
            padding: 0;
            margin: 0;
            border-bottom: solid 1px var(--border-color);
        }
        nav {
            padding: 5px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center
        }
        .logo {
            cursor: pointer;
        }
    `

    render() {
        return html`
            <header>
                <nav>
                    <a src="#" class="logo">Logo</a>
                    <theme-button></theme-button>
                </nav>
            </header>
        `
    }

    get bodyColorScheme() {
        return document.querySelector("body").style.colorScheme
    }
}

customElements.define('wc-header', WCHeader)