import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class SuggestionButton extends LitElement {
    static styles = css`
        a {
            font-family: prompt;
            font-weight: 600;
            border-radius: 1500px;
            padding: 5px 15px;
            border: solid 2px var(--highlight-color);
            cursor: pointer;
            text-transform: uppercase;
            color: var(--highlight-color);
            background-color: var(--background-color-2);
            text-decoration: none;
        }
        a:hover {
            background-color: var(--highlight-color);
            color: var(--body-text-color);
        }
    `

    render() {
        return html`
            <a href="https://github.com/RSelaries/ateliers-gamejam/issues/new">
                Suggérer un changement
            </a>
        `
    }
}

customElements.define('suggestion-button', SuggestionButton)