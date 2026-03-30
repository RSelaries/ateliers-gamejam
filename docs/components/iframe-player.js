import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class IframePlayer extends LitElement {
    static properties = {
        src: {},
        title: {},
        launchFullscreen: {},
        _visible: {},
        _isFullscreen: {}
    }

    static styles = css`
        iframe, .iframe-placeholder {
            width: 100%;
            height: 100%;
            border: solid 1px var(--border-color);
            display: block;
        }

        .wrapper {
            height: 100%;
        }

        .iframe-placeholder {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

            button {
                font-family: prompt;
                color: var(--redirection-color);
                font-weight: 700;
                font-size: 1em;
                padding: 2px 30px;
                border-radius: 100000px;
                border: solid 2px var(--redirection-color);
                background-color: transparent
            }
            button:hover {
                cursor: pointer;
                color: var(--background-color-1);
                background-color: var(--redirection-color);
                transform: scale(1.1);
            }
        }

        .iframe-wrapper {
            position: relative;
            height: 100%;

            button {
                position: absolute;
                bottom: 0;
                right: 0;
                margin: 1em;
                width: 40px;
                height: 40px;
                background-color: var(--body-text-color);
                mask-image: url(./medias/icons/fullscreen.svg);
                mask-position: center center;
                mask-repeat: none;
                mask-size: contain;
            }

            button:hover {
                cursor: pointer;
            }
        }
    `
    
    constructor() {
        super()
        this._visible = false
        this._isFullscreen = document.fullscreenElement != null

        addEventListener("fullscreenchange", (event) => {
            this._isFullscreen = document.fullscreenElement != null
        })
    }

    render() {
        function iframe(element) {
            if (!element._visible) return html`
                <div class="iframe-placeholder">
                    <h1>${element.title ? element.title : "Preview du jeu"}</h1>
                    <button @click=${element.launchGame}>Jouer</button>
                </div>
            `
            else return html`
                <div class="iframe-wrapper">
                    <iframe src="${element.src}">Ce moteur de recherche ne supporte par l'iframe.</iframe>
                    <button @click=${element.toFullscreen}
                        style="mask-image: url(${element._isFullscreen ? "./medias/icons/exit-fullscreen.svg" : "./medias/icons/fullscreen.svg"})"
                    ></button>
                </div>
            `
        }

        return html`
            <div class="wrapper">
                ${iframe(this)}
            </div>
        `

        
    }

    launchGame() {
        this._visible = true
        if (this.launchFullscreen == true || this.launchFullscreen === "true") {
            this.toFullscreen()
            console.log("launch fullscreen")
        }
    }

    toFullscreen() {
        let element = this.renderRoot.querySelector(".wrapper")
        
        if (!this._isFullscreen)
            element.requestFullscreen()
        else document.exitFullscreen()
    }
}

customElements.define('iframe-player', IframePlayer)