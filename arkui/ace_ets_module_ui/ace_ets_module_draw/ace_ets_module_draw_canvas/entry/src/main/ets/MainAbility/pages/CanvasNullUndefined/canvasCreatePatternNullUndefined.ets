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
struct canvasCreatePatternNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Column({ space:2 }) {
      Column({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .onReady(() => {
            let pattern = this.context.createPattern(null, null)
            if (pattern) {
              this.context.fillStyle = pattern
            }
            this.context.fillRect(0, 0, 80, 80)
          })
          .id('canvasCreatePatternNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .onReady(() => {
            let pattern = this.context.createPattern(undefined, undefined)
            if (pattern) {
              this.context.fillStyle = pattern
            }
            this.context.fillRect(0, 0, 80, 80)
          })
          .id('canvasCreatePatternUndefined')
      }
    }
    .width('100%')
    .height('100%')
  }
}