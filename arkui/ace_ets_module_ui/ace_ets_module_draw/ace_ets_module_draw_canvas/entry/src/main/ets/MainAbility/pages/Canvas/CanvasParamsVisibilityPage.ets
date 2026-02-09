/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct CanvasParamsVisibilityPage {
  private context: CanvasRenderingContext2D | undefined = undefined
  private drawingContext: DrawingRenderingContext = new DrawingRenderingContext()
  private img: ImageBitmap = new ImageBitmap('resources/base/media/img.webp')
  private img1: ImageBitmap = new ImageBitmap('resources/base/media/img1.jpeg')
  @State vis1: Visibility = Visibility.Visible
  @State vis2: Visibility = Visibility.Visible

  Draw(context: CanvasRenderingContext2D) {
    context.fillStyle = '#f00'
    context.fillRect(10, 10, 50, 50)
    context.fillStyle = Color.Pink
    context.fillRect(70, 10, 50, 50)
    let grad = context.createLinearGradient(50,0, 300,100)
    grad.addColorStop(0.0, 'rgb(39,135,217)')
    grad.addColorStop(0.5, 'rgb(255,238,240)')
    grad.addColorStop(1.0, 'rgb(23,169,141)')
    context.fillStyle = grad
    context.fillRect(130, 10, 50, 50)
    let grad1 = context.createRadialGradient(215, 35, 10, 215, 35, 30)
    grad1.addColorStop(0.0, 'rgb(39,135,217)')
    grad1.addColorStop(0.5, 'rgb(255,238,240)')
    grad1.addColorStop(1.0, 'rgb(112,112,112)')
    context.fillStyle = grad1
    context.fillRect(190, 10, 50, 50)
    let grad2 = context.createConicGradient(0, 285, 35)
    grad2.addColorStop(0.0, '#ff0000')
    grad2.addColorStop(0.5, '#ffffff')
    grad2.addColorStop(1.0, '#00ff00')
    context.fillStyle = grad2
    context.fillRect(250, 10, 50, 50)
    context.fillStyle = 0x00ffff
    context.fillRect(310, 10, 50, 50)

    context.lineWidth = 5
    context.strokeStyle = '#f00'
    context.strokeRect(10, 70, 50, 50)
    context.strokeStyle = Color.Pink
    context.strokeRect(70, 70, 50, 50)
    let grad3 = context.createLinearGradient(50,0, 300,100)
    grad3.addColorStop(0.0, 'rgb(39,135,217)')
    grad3.addColorStop(0.5, 'rgb(255,238,240)')
    grad3.addColorStop(1.0, 'rgb(23,169,141)')
    context.strokeStyle = grad3
    context.strokeRect(130, 70, 50, 50)
    let grad4 = context.createRadialGradient(215, 95, 10, 215, 95, 30)
    grad4.addColorStop(0.0, 'rgb(39,135,217)')
    grad4.addColorStop(0.5, 'rgb(255,238,240)')
    grad4.addColorStop(1.0, 'rgb(112,112,112)')
    context.strokeStyle = grad4
    context.strokeRect(190, 70, 50, 50)
    let grad5 = context.createConicGradient(0, 285, 95)
    grad5.addColorStop(0.0, '#ff0000')
    grad5.addColorStop(0.5, '#ffffff')
    grad5.addColorStop(1.0, '#00ff00')
    context.strokeStyle = grad5
    context.strokeRect(250, 70, 50, 50)
    context.strokeStyle = 0x00ffff
    context.strokeRect(310, 70, 50, 50)

    let pattern = context.createPattern(this.img, 'repeat')
    if (pattern) {
      context.fillStyle = pattern
    }
    context.fillRect(10, 130, 50, 50)

    context.fillStyle = 0x00ff00
    context.fillRect(70, 130, 50, 50)
    context.clearRect(70, 130, 25, 25)

    context.shadowBlur = 30
    context.shadowColor = 'rgb(123, 234, 0)'
    context.shadowOffsetX = 10
    context.shadowOffsetY = 10
    context.fillStyle = 0x00ff00
    context.fillRect(130, 130, 50, 50)

    context.shadowBlur = 0
    context.shadowOffsetX = 0
    context.shadowOffsetY = 0
    context.globalAlpha = 0.4
    context.fillStyle = 0x00ff00
    context.fillRect(190, 130, 50, 50)
    context.globalAlpha = 1

    context.imageSmoothingEnabled = true
    context.imageSmoothingQuality = 'high'
    context.drawImage(this.img1, 250, 130, 50, 50)

    context.filter = 'opacity(50%) contrast(200%) grayscale(50%)'
    context.drawImage(this.img1, 310, 130, 50, 50)
    context.filter = 'none'

    context.beginPath()
    context.moveTo(10, 190)
    context.bezierCurveTo(20, 210, 40, 170, 60, 230)
    context.stroke()

    context.beginPath()
    context.moveTo(70, 190)
    context.quadraticCurveTo(100, 240, 120, 190)
    context.stroke()

    context.beginPath()
    context.arc(155, 215, 25, 0, 6.28)
    context.stroke()

    context.beginPath()
    context.moveTo(190, 230)
    context.arcTo(300, 170, 110, 170, 25)
    context.stroke()

    context.beginPath()
    context.ellipse(280, 220, 25, 50, Math.PI * 0.25, Math.PI * 0.5, Math.PI * 2, false)
    context.stroke()

    context.strokeStyle = Color.Red
    context.lineCap = 'round'
    context.lineJoin = 'miter'
    context.miterLimit = 3
    context.beginPath()
    context.moveTo(310, 190)
    context.lineTo(350, 195)
    context.lineTo(310, 197)
    context.closePath()
    context.stroke()

    context.setLineDash([10,20])
    context.lineDashOffset = 10.0
    context.beginPath()
    context.rect(10, 250, 50, 50) // Create a 100*100 rectangle at (20, 20)
    context.stroke()

    context.font = '24vp'
    let res = context.getLineDash()
    let str = JSON.stringify(res)
    console.info(`CYC_lineDash ${str}`)
    context.fillText(str, 70, 280)
  }

  build() {
    Column() {
      // CanvasParams创建，visibility为true时不绘制
      Row() {
        Button('draw')
          .key('CanvasParamsVisibilityPage_btn_draw')
          .width('25%')
          .onClick(()=>{
            if (this.context) {
              this.Draw(this.context)
            }
          })
        Button('reset')
          .key('CanvasParamsVisibilityPage_btn_reset')
          .width('25%')
          .onClick(()=>{
            if (this.context) this.context.reset()
          })
        Button('visibility')
          .key('CanvasParamsVisibilityPage_btn_visibility')
          .width('25%')
          .onClick(() => {
            this.vis1 = (this.vis1 == Visibility.Visible) ? Visibility.Hidden : Visibility.Visible
          })
        Button('Error')
          .key('CanvasParamsVisibilityPage_btn_error')
          .width('25%')
          .onClick(() => {
            try {
              CanvasRenderingContext2D.getContext2DFromDrawingContext(this.drawingContext);
            } catch (err) {
              AppStorage.SetOrCreate('CanvasParamsVisibilityPage_errorcode', (err as BusinessError).code)
              console.error(`getContext2DFromDrawingContext fail: ${JSON.stringify(err)}`)
            }
          })
      }

      Canvas({} as CanvasParams)
        .borderWidth(1)
        .visibility(this.vis1)
        .onReady((drawingContext?: DrawingRenderingContext): void => {
          if (drawingContext != undefined) {
            this.context = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext);
          }
        })
    }
  }
}