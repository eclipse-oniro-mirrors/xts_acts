/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct OffScreenCanvas {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private settings_false: RenderingContextSettings = new RenderingContextSettings(false)
  private offscreenCanvas: OffscreenCanvas = new OffscreenCanvas(500, 500)

  build() {
    Scroll() {
      Column() {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .key('OffScreenCanvas_Canvas1')
          .onReady(() => {
            this.offscreenCanvas.getContext(null)
            this.offscreenCanvas.getContext(undefined)
            this.offscreenCanvas.getContext(undefined, { antialias: true })
            this.offscreenCanvas.getContext(null, { antialias: false })
            this.getContext_2d()
            this.getContext_2d_settings_false()
            this.getContext_2d_settings_true()
          })
      }
    }
  }

  getContext_2d() {
    let offCanvasContext = this.offscreenCanvas.getContext("2d")
    offCanvasContext.fillStyle = '#0000ff'
    offCanvasContext.fillRect(0, 0, 150, 100)
    let image = offCanvasContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image);
  }

  getContext_2d_settings_false() {
    let offCanvasContext = this.offscreenCanvas.getContext("2d", this.settings_false)
    offCanvasContext.fillStyle = '#00ff00'
    offCanvasContext.fillRect(0, 0, 150, 100)
    let image = offCanvasContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image);
  }

  getContext_2d_settings_true() {
    let offCanvasContext = this.offscreenCanvas.getContext("2d", this.settings)
    offCanvasContext.fillStyle = '#00ff00'
    offCanvasContext.fillRect(0, 0, 150, 100)
    let image = offCanvasContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image);
  }

}