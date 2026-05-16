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
struct canvasTranslateNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .onReady(() =>{
            this.context.fillRect(10, 10, 50, 50)
            this.context.translate(null, null)
            this.context.fillRect(10, 10, 50, 50)
          })
          .id('canvasTranslateNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .onReady(() =>{
            this.context.fillRect(10, 10, 50, 50)
            this.context.translate(undefined, undefined)
            this.context.fillRect(10, 10, 50, 50)
          })
          .id('canvasTranslateUndefined')
      }

    }
    .width('100%')
    .height('100%')
  }
}