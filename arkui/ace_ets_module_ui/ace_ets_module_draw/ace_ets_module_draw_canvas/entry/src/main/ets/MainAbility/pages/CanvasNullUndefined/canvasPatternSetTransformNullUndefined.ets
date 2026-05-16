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
struct canvasPatternSetTransformNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private pattern: CanvasPattern | null = null;

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .onReady(() =>{
            if (this.pattern) {
              this.context.fillStyle = this.pattern
              this.pattern.setTransform(null)
            }
            this.context.fillRect(0, 0, 60, 70)
          })
          .id('canvasPatternSetTransformNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .onReady(() =>{
            if (this.pattern) {
              this.context.fillStyle = this.pattern
              this.pattern.setTransform(undefined)
            }
            this.context.fillRect(0, 0, 60, 70)
          })
          .id('canvasPatternSetTransformUndefined')
      }

    }
    .width('100%')
    .height('100%')
  }
}