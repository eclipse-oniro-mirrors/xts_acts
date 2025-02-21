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
struct CanvasShader {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap = new ImageBitmap('/pages/images/test1.jpg')

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Canvas(this.context)
          .width('90%')
          .height('20%')
          .backgroundColor('#ff83835d')
          .margin({ top: 5 })
          .key('CanvasShader_Canvas1')
          .onReady(() => {
            this.createConicGradient1()
            this.createConicGradient2()
            this.createConicGradient3()
            this.createConicGradient4()
            this.createConicGradient5()
            this.createConicGradient6()
            this.createConicGradient7()
            this.createConicGradient8()
            this.createConicGradient9()
            this.createConicGradient10()
            this.createConicGradient11()
            this.createConicGradient12()
            this.createConicGradient13()
            this.createConicGradient14()
            this.createConicGradient15()
            this.createConicGradient16()
            this.createConicGradient17()
          })

        Canvas(this.context1)
          .width('90%')
          .height('20%')
          .backgroundColor('#ff83835d')
          .margin({ top: 5 })
          .key('CanvasShader_Canvas2')
          .onReady(() => {
            this.clamp1()
            this.clamp2()
            this.clamp3()
            this.clamp4()
            this.mirror1()
            this.mirror2()
            this.mirror3()
            this.mirror4()
          })

      }
      .width('100%')
      .backgroundColor('#eee')
    }
  }

  createConicGradient1() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient2() {
    let grad = this.context.createConicGradient(0, -10, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient3() {
    let grad = this.context.createConicGradient(0, 100, 100)
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient4() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient5() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient6() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient7() {
    let grad = this.context.createConicGradient(0, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient8() {
    let grad = this.context.createConicGradient(45 * Math.PI / 180, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient9() {
    let grad = this.context.createConicGradient(-45 * Math.PI / 180, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient10() {
    let grad = this.context.createConicGradient(450 * Math.PI / 180, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient11() {
    let grad = this.context.createConicGradient(0, null, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient12() {
    let grad = this.context.createConicGradient(0, undefined, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient13() {
    let grad = this.context.createConicGradient(0, 100, null)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient14() {
    let grad = this.context.createConicGradient(0, 100, undefined)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient15() {
    let grad = this.context.createConicGradient(null, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient16() {
    let grad = this.context.createConicGradient(undefined, 100, 100)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  createConicGradient17() {
    let grad = this.context.createConicGradient(null, null, null)
    grad.addColorStop(0.0, '#ff0000')
    grad.addColorStop(0.3, '#0000ff')
    grad.addColorStop(1.0, '#ff00ff')
    this.context.fillStyle = grad
    this.context.fillRect(0, 0, 200, 200)
  }

  clamp1() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'clamp')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(276 * 2), px2vp(183))
  }

  clamp2() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'clamp')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(276), px2vp(183 * 2))
  }

  clamp3() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'clamp')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(276 * 2), px2vp(183 * 2))
  }

  clamp4() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'clamp')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(276), px2vp(183))
  }

  mirror1() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'mirror')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(150 * 2), px2vp(150))
  }

  mirror2() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'mirror')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(150), px2vp(150 * 2))
  }

  mirror3() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'mirror')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(150 * 2), px2vp(150 * 2))
  }

  mirror4() {
    let pattern: CanvasPattern = this.context1.createPattern(this.img, 'mirror')
    this.context1.fillStyle = pattern
    this.context1.fillRect(0, 0, px2vp(150), px2vp(150))
  }
}