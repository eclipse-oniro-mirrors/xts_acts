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
import { LengthMetricsUnit } from '@kit.ArkUI'
import { drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct CanvasParamsAntialiasPage {
  private get_rendering_context_1: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private get_rendering_context_2: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private get_rendering_context_3: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private get_rendering_context_4: CanvasRenderingContext2D = new CanvasRenderingContext2D();

  build() {
    Column() {
      Row() {
        // antialias: true
        Canvas({} as CanvasParams)
          .width('50%')
          .backgroundColor('#D5D5D5')
          .key('CanvasAntialias_canvas_1')
          .onReady((drawingContext?: DrawingRenderingContext) => {
            if (!drawingContext) {
              return
            }
            this.get_rendering_context_1 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext, { antialias: true });

            let region = new Path2D()
            region.moveTo(30, 90)
            region.lineTo(110, 20)
            region.lineTo(240, 130)
            region.lineTo(60, 130)
            region.lineTo(190, 20)
            region.lineTo(270, 90)
            region.closePath()
            this.get_rendering_context_1.clip(region,'evenodd')
            this.get_rendering_context_1.fillStyle = 'rgb(255,0,0)'
            this.get_rendering_context_1.fillRect(0, 0, this.get_rendering_context_1.width, this.get_rendering_context_1.height)
          })

        // antialias: false
        Canvas({} as CanvasParams)
          .width('50%')
          .backgroundColor('#D5D5D5')
          .key('CanvasAntialias_canvas_2')
          .onReady((drawingContext?: DrawingRenderingContext) => {
            if (!drawingContext) {
              return
            }
            this.get_rendering_context_2 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext, { antialias: false });

            let region = new Path2D()
            region.moveTo(30, 90)
            region.lineTo(110, 20)
            region.lineTo(240, 130)
            region.lineTo(60, 130)
            region.lineTo(190, 20)
            region.lineTo(270, 90)
            region.closePath()
            this.get_rendering_context_2.clip(region,'evenodd')
            this.get_rendering_context_2.fillStyle = 'rgb(255,0,0)'
            this.get_rendering_context_2.fillRect(0, 0, this.get_rendering_context_2.width, this.get_rendering_context_2.height)
          })
      }
      .height('50%')

      Row() {
        // 不设置
        Canvas({} as CanvasParams)
          .width('50%')
          .backgroundColor('#D5D5D5')
          .key('CanvasAntialias_canvas_3')
          .onReady((drawingContext?: DrawingRenderingContext) => {
            if (!drawingContext) {
              return
            }
            this.get_rendering_context_3 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext);

            let region = new Path2D()
            region.moveTo(30, 90)
            region.lineTo(110, 20)
            region.lineTo(240, 130)
            region.lineTo(60, 130)
            region.lineTo(190, 20)
            region.lineTo(270, 90)
            region.closePath()
            this.get_rendering_context_3.clip(region,'evenodd')
            this.get_rendering_context_3.fillStyle = 'rgb(255,0,0)'
            this.get_rendering_context_3.fillRect(0, 0, this.get_rendering_context_3.width, this.get_rendering_context_3.height)
          })

        // undefined
        Canvas({} as CanvasParams)
          .width('50%')
          .backgroundColor('#D5D5D5')
          .key('CanvasAntialias_canvas_4')
          .onReady((drawingContext?: DrawingRenderingContext) => {
            if (!drawingContext) {
              return
            }
            this.get_rendering_context_4 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext, { antialias: undefined });

            let region = new Path2D()
            region.moveTo(30, 90)
            region.lineTo(110, 20)
            region.lineTo(240, 130)
            region.lineTo(60, 130)
            region.lineTo(190, 20)
            region.lineTo(270, 90)
            region.closePath()
            this.get_rendering_context_4.clip(region,'evenodd')
            this.get_rendering_context_4.fillStyle = 'rgb(255,0,0)'
            this.get_rendering_context_4.fillRect(0, 0, this.get_rendering_context_4.width, this.get_rendering_context_4.height)
          })
      }
      .height('50%')
    }
    .width('100%')
    .height('100%')
  }
}