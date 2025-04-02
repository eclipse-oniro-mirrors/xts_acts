/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct CanvasColor {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap = new ImageBitmap('/pages/images/test1.jpg')

  build() {
    Scroll() {
      Column() {
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .onReady(() => {
            this.fillStyle_string()
            this.fillStyle_number()
            this.fillStyle_CanvasGradient()
            this.fillStyle_CanvasPattern()
            this.strokeStyle_string()
            this.strokeStyle_number()
            this.strokeStyle_CanvasGradient()
            this.strokeStyle_CanvasPattern()
          })
          .id('CanvasColor_Canvas1')
      }
    }
  }

  fillStyle_string() {
    this.context.fillStyle = 255
    this.context.fillRect(20, 160, 150, 100)
  }

  fillStyle_number() {
    this.context.fillStyle = 255
    this.context.fillRect(20, 160, 150, 100)
  }

  fillStyle_CanvasGradient() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  fillStyle_CanvasPattern() {
    let pattern = this.context.createPattern(this.img, 'repeat')
    this.context.fillStyle = pattern as CanvasPattern
    this.context.fillRect(0, 0, px2vp(276 * 2), px2vp(183))
  }

  strokeStyle_string() {
    this.context.strokeStyle = '#0000ff'
    this.context.strokeRect(20, 160, 150, 100)
  }

  strokeStyle_number() {
    this.context.strokeStyle = 255
    this.context.strokeRect(20, 160, 150, 100)
  }

  strokeStyle_CanvasGradient() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.strokeStyle = grad
    this.context.strokeRect(50, 50, 200, 200)
  }

  strokeStyle_CanvasPattern() {
    let pattern = this.context.createPattern(this.img, 'repeat')
    this.context.lineWidth = 5
    this.context.strokeStyle = pattern as CanvasPattern
    this.context.strokeRect(0, 0, px2vp(276 * 2), px2vp(183))
  }
}