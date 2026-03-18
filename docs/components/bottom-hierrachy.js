import { LitElement, html, css } from 'https://unpkg.com/lit?module'

const detailsArrow = new URL( "../medias/icons/details-arrow.svg", import.meta.url).href

class BottomHierarchy extends LitElement {
    static styles = css`
        .bottom-hierarchy {
            width: 100%;
            position: sticky;
            bottom: 0;

            background-color: #0007;
            backdrop-filter: blur(4px);
            display: flex;
        }

        .hierarchy {
            background-color: var(--background-color-2);
            padding: 0px 20px;
            overflow: auto;
            max-height: 60vh;
        }

        details {
            width: 100%;
        }

        ::marker {
            content: "";
        }

        summary {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            padding: 5px;
            cursor: pointer;

            h3 {
                margin: 0px;
            }
        }

        details[open] .details-arrow {
            transform: rotate(180deg);
        }

        .details-arrow {
            height: 24px;
            aspect-ratio: 1;
            background-color: var(--body-text-color);
            mask-size: 100%;
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            mask-position: center;
        }
    `

    render() {
        return html`
            <div class="bottom-hierarchy">
                <details>
                    <summary>
                        <div style="mask-image: url(${detailsArrow})" class="details-arrow"></div>
                        <h3>Table des Matières</h3>
                        <div style="mask-image: url(${detailsArrow})" class="details-arrow"></div>
                    </summary>
                    <div class="hierarchy">
                        <right-panel></right-panel>
                    </div>
                </details>
            </div>
        `
    }
}

customElements.define('bottom-hierarchy', BottomHierarchy)