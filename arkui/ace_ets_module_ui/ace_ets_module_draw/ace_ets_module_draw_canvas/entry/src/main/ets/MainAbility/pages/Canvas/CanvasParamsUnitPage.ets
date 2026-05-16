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

@Entry
@Component
struct CanvasParamsUnitPage {
  private get_rendering_context_1: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private get_rendering_context_2: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private get_rendering_context_3: CanvasRenderingContext2D = new CanvasRenderingContext2D();

  build() {
    Column() {
      // LengthMetricsUnit.DEFAULT
      Canvas({ unit: LengthMetricsUnit.DEFAULT } as CanvasParams)
        .height('30%')
        .key('CanvasParamsUnitPage_canvas_1')
        .onReady((drawingContext?: DrawingRenderingContext) => {
          if (!drawingContext) {
            return
          }
          // 使用CanvasRenderingContext2D进行绘制
          this.get_rendering_context_1 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext);
          this.get_rendering_context_1.fillStyle = 'rgb(255,0,0)'
          this.get_rendering_context_1.fillRect(50, 50, 100, 100)
        })

      // LengthMetricsUnit.PX
      Canvas({ unit: LengthMetricsUnit.PX } as CanvasParams)
        .height('30%')
        .key('CanvasParamsUnitPage_canvas_2')
        .onReady((drawingContext?: DrawingRenderingContext) => {
          if (!drawingContext) {
            return
          }
          // 使用CanvasRenderingContext2D进行绘制
          this.get_rendering_context_2 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext);
          this.get_rendering_context_2.fillStyle = 'rgb(0,255,0)'
          this.get_rendering_context_2.fillRect(50, 50, 100, 100)
        })

      // 不设置
      Canvas({} as CanvasParams)
        .height('30%')
        .key('CanvasParamsUnitPage_canvas_3')
        .onReady((drawingContext?: DrawingRenderingContext) => {
          if (!drawingContext) {
            return
          }
          // 使用CanvasRenderingContext2D进行绘制
          this.get_rendering_context_3 = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext);
          this.get_rendering_context_3.fillStyle = 'rgb(0,0,255)'
          this.get_rendering_context_3.fillRect(50, 50, 100, 100)
        })

    }
    .width('100%')
    .height('100%')
  }
}