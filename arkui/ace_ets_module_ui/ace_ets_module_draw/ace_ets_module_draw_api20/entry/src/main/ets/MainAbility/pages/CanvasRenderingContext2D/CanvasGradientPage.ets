/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ColorMetrics } from '@kit.ArkUI'

@Entry
@Component
struct CanvasGradientPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State p3Red: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1);
  @State p3Green: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1);
  @State p3Blue: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 0, 1, 1);
  @State canvasSize: number = 500
  @State pixel: PixelMap | null = null

  build() {
    Column() {
      Column({space: 5}) {
        Row({space: 5}) {
          Button('fillStyle').key('CanvasGradientPage_fillStyle')
            .onClick(()=>{
              this.context.reset()

              let linearGradSRGB = this.context.createLinearGradient(75,0, 150,100)
              linearGradSRGB.addColorStop(0, ColorMetrics.rgba(0, 255, 0))
              linearGradSRGB.addColorStop(0.5, ColorMetrics.numeric(0xffffff))
              linearGradSRGB.addColorStop(1.0, ColorMetrics.resourceColor($r('app.color.color_green')))
              this.context.fillStyle = linearGradSRGB
              this.context.fillRect(0, 0, 150, 150)

              let linearGradP3 = this.context.createLinearGradient(225,0, 300,100)
              linearGradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              linearGradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              linearGradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.fillStyle = linearGradP3
              this.context.fillRect(150, 0, 150, 150)

              let radialGradSRGB = this.context.createRadialGradient(75,235,25, 75,235,80)
              radialGradSRGB.addColorStop(0.0, '#ff0000')
              radialGradSRGB.addColorStop(0.5, '#ffffff')
              radialGradSRGB.addColorStop(1.0, '#00ff00')
              this.context.fillStyle = radialGradSRGB
              this.context.fillRect(0, 160, 150, 150)

              let radialGradP3 = this.context.createRadialGradient(225,235,25, 225,235,80)
              radialGradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              radialGradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              radialGradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.fillStyle = radialGradP3
              this.context.fillRect(150, 160, 150, 150)

              let conicGradSRGB = this.context.createConicGradient(0, 75, 395)
              conicGradSRGB.addColorStop(0.0, '#ff0000')
              conicGradSRGB.addColorStop(0.5, '#ffffff')
              conicGradSRGB.addColorStop(1.0, '#00ff00')
              this.context.fillStyle = conicGradSRGB
              this.context.fillRect(0, 320, 150, 150)

              let conicGradP3 = this.context.createConicGradient(0, 225, 395)
              conicGradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              conicGradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              conicGradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.fillStyle = conicGradP3
              this.context.fillRect(150, 320, 150, 150)
            })
          Button('strokeStyle').key('CanvasGradientPage_strokeStyle')
            .onClick(()=>{
              this.context.reset()
              this.context.lineWidth = 20

              let linearGradSRGB = this.context.createLinearGradient(85,10, 150,110)
              linearGradSRGB.addColorStop(0.0, '#ff0000')
              linearGradSRGB.addColorStop(0.5, '#ffffff')
              linearGradSRGB.addColorStop(1.0, '#00ff00')
              this.context.strokeStyle = linearGradSRGB
              this.context.strokeRect(10, 10, 150, 150)

              let linearGradP3 = this.context.createLinearGradient(255,10, 330,110)
              linearGradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              linearGradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              linearGradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.strokeStyle = linearGradP3
              this.context.strokeRect(180, 10, 150, 150)

              let radialGradSRGB = this.context.createRadialGradient(10,180,25, 10,180,80)
              radialGradSRGB.addColorStop(0.0, '#ff0000')
              radialGradSRGB.addColorStop(0.5, '#ffffff')
              radialGradSRGB.addColorStop(1.0, '#00ff00')
              this.context.strokeStyle = radialGradSRGB
              this.context.strokeRect(10, 180, 150, 150)

              let radialGradP3 = this.context.createRadialGradient(180,180,25, 180,180,80)
              radialGradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              radialGradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              radialGradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.strokeStyle = radialGradP3
              this.context.strokeRect(180, 180, 150, 150)

              let conicGradSRGB = this.context.createConicGradient(0, 75, 425)
              conicGradSRGB.addColorStop(0.0, '#ff0000')
              conicGradSRGB.addColorStop(0.5, '#ffffff')
              conicGradSRGB.addColorStop(1.0, '#00ff00')
              this.context.strokeStyle = conicGradSRGB
              this.context.strokeRect(10, 350, 150, 150)

              let conicGradP3 = this.context.createConicGradient(0, 225, 425)
              conicGradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              conicGradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              conicGradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.strokeStyle = conicGradP3
              this.context.strokeRect(180, 350, 150, 150)
            })
        }.height('10%')

        Row({space: 5}) {
          Text('color')
          Button('null').key('CanvasGradientPage_color_null')
            .onClick(() => {
              let grad = this.context.createLinearGradient(75, 0, 150, 100)
              grad.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              grad.addColorStop(0.5, null)
              grad.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.reset()
              this.context.fillStyle = grad
              this.context.fillRect(0, 0, 150, 150)
            })
          Button('undefined').key('CanvasGradientPage_color_undefined')
            .onClick(() => {
              let grad = this.context.createLinearGradient(75, 0, 150, 100)
              grad.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              grad.addColorStop(0.5, undefined)
              grad.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 0, 1, 1.0))
              this.context.reset()
              this.context.fillStyle = grad
              this.context.fillRect(0, 0, 150, 150)
            })
        }.height('10%')

        Row() {
          Text('offset')
          Button('null').key('CanvasGradientPage_offset_null')
            .onClick(() => {
              let grad = this.context.createLinearGradient(75, 0, 150, 100)
              grad.addColorStop(0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              grad.addColorStop(null, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              grad.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.reset()
              this.context.fillStyle = grad
              this.context.fillRect(0, 0, 150, 150)
            })
          Button('undefined').key('CanvasGradientPage_offset_undefined')
            .onClick(() => {
              let grad = this.context.createLinearGradient(75, 0, 150, 100)
              grad.addColorStop(0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              grad.addColorStop(undefined, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              grad.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 0, 1, 1.0))
              this.context.reset()
              this.context.fillStyle = grad
              this.context.fillRect(0, 0, 150, 150)
            })
        }.height('10%')

        Row({space: 5}) {
          Button('offset:15').key('CanvasGradientPage_offset_positive_15')
            .onClick(()=>{
              let grad = this.context.createLinearGradient(75,0, 150,100)
              grad.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              grad.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              grad.addColorStop(15, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.reset()
              this.context.fillStyle = grad
              this.context.fillRect(0, 0, 150, 150)
            })
          Button('offset:-1').key('CanvasGradientPage_offset_negativa_1')
            .onClick(()=>{
              let grad = this.context.createLinearGradient(75,0, 150,100)
              grad.addColorStop(-1, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1.0))
              grad.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 1, 1, 1.0))
              grad.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1.0))
              this.context.reset()
              this.context.fillStyle = grad
              this.context.fillRect(0, 0, 150, 150)
            })
        }.height('10%')

        Row() {
          Canvas(this.context)
            .width(this.canvasSize)
            .height('100%')
            .key('CanvasGradientPage_Canvas')
        }.height('60%')
      }
    }
    .width('100%')
    .height('100%')
  }
}