import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class WCHeader extends LitElement {
    static styles = css`
        header {
            width: 100vw;
            padding: 0;
            margin: 0;
            border-bottom: solid 1px var(--border-color);
            z-index: 2;
            position: sticky;
        }
        nav {
            padding: 5px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 0px 15px #0007;
        }
        .logo {
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: var(--body-text-color);
        }
        .buttons {
            display: flex;
            align-items: center;
            gap: 15px;
        }
    `

    render() {
        return html`
            <header>
                <nav>
                    <a href="https://sirius-productions.fr" class="logo">Site Sirius Productions</a>
                    <div class="buttons">
                        <suggestion-button></suggestion-button>
                        <theme-button></theme-button>
                    </div>
                </nav>
            </header>
        `
    }

    get bodyColorScheme() {
        return document.querySelector("body").style.colorScheme
    }
}

customElements.define('wc-header', WCHeader)