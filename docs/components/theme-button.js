import { LitElement, html, css } from 'https://unpkg.com/lit?module'

// Medias urls
const dark = new URL( "../medias/icons/dark-theme.svg", import.meta.url).href
const light = new URL("../medias/icons/light-theme.svg", import.meta.url).href

class ThemeButton extends LitElement {
    static styles = css`
        .theme-button {
            > div {
                background-color: var(--body-text-color);
                aspect-ratio: 1;
                width: 24px;
                mask-size: 100%;
                -webkit-mask-repeat: no-repeat;
                mask-repeat: no-repeat;
                mask-position: center;
            }
            margin: 0;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #0000;
        }
        .theme-button:hover {
            background-color: var(--hover-background-color);
            > div {
                background-color: var(--highlight-color);
            }
        }
    `

    static properties = {
        currentTheme: {},
    }

    constructor() {
        super()
        this.currentTheme = document.querySelector("body").style.colorScheme
    }

    render() {
        return html`
        <button @click=${this.changeTheme} class="theme-button">
            <div style="mask-image: url(${this.icon})"></div>
        </button>
        `
    }

    get icon() {
        return this.currentTheme === "dark" ? dark : light
    }

    changeTheme() {
        let body = document.querySelector("body")
        let bodyColorScheme = body.style.colorScheme
        body.style.colorScheme = bodyColorScheme === "light" ? "dark" : "light"
        this.currentTheme = body.style.colorScheme
    }
}

customElements.define('theme-button', ThemeButton)