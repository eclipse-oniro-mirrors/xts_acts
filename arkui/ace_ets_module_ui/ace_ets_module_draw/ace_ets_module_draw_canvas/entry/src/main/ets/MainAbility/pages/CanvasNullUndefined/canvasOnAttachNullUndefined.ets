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
struct canvasOnAttachNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private node: FrameNode | null = null
  attachCallback = () => {
    console.info('CanvasRenderingContext2D attached to the canvas frame node.')
    this.node = this.context.canvas
  }
  detachCallback = () => {
    console.info('CanvasRenderingContext2D detach from the canvas frame node.')
    this.node = null
  }

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .onReady(() =>{
            try {
              this.context.on(null, this.attachCallback)
              this.context.off(null, this.attachCallback)
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              console.error(`Error code: ${e.code}, message: ${e.message}`);
            }
          })
          .id('canvasOnAttachNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .onReady(() =>{
            try {
              this.context.on(undefined, this.attachCallback)
              this.context.off(undefined, this.attachCallback)
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              console.error(`Error code: ${e.code}, message: ${e.message}`);
            }
          })
          .id('canvasOnAttachUndefined')
      }

    }
    .width('100%')
    .height('100%')
  }
}