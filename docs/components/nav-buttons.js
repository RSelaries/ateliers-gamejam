import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class NavButtons extends LitElement {
    static styles = css`
        .nav-btn-wrapper {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 30px;
            padding-bottom: 0px;
            > button {
                padding: 5px 20px;
                font-family: prompt;
                font-weight: 500;
                font-size: 18px;
                border-radius: 5px;
                border: solid 2px var(--highlight-color);
                background-color: var(--highlight-color);
                cursor: pointer;
            }
            > button:hover {
                border: solid 2px var(--highlight-color);
                background-color: transparent;
            }
        }
    `

    render() {
        return html`
            <div class="nav-btn-wrapper">
                <button onclick="console.log('Caca')">← Précédent</button>
                <button>Suivant →</button>
            </div>
        `
    }
}

customElements.define('nav-buttons', NavButtons)