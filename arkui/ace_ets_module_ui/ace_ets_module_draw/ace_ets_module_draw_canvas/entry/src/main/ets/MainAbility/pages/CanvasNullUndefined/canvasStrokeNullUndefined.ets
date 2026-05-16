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
struct canvasStrokeNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private path2Da: Path2D = new Path2D()

  build() {
    Column({ space:2 }) {
      Column({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#ffff00')
          .onReady(() => {
            this.path2Da.moveTo(25, 25)
            this.path2Da.lineTo(25, 80)
            this.path2Da.lineTo(75, 80)
            this.path2Da.lineTo(75, 25)
            this.context.strokeStyle = 'rgb(0,0,255)'
            this.context.stroke(null)
          })
          .id('canvasStrokeNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#ffff00')
          .onReady(() => {
            this.path2Da.moveTo(25, 25)
            this.path2Da.lineTo(25, 80)
            this.path2Da.lineTo(75, 80)
            this.path2Da.lineTo(75, 25)
            this.context.strokeStyle = 'rgb(0,0,255)'
            this.context.stroke(undefined)
          })
          .id('canvasStrokeUndefined')
      }
    }
    .width('100%')
    .height('100%')
  }
}