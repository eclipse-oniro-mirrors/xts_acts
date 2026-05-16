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
struct canvasPutImageDataNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('rgb(213,213,213)')
          .onReady(() => {
            let imageDataNum = this.context.createImageData(70, 70)
            let imageData = this.context.createImageData(imageDataNum)
            for (let i = 0; i < imageData.data.length; i += 4) {
              imageData.data[i + 0] = 112
              imageData.data[i + 1] = 112
              imageData.data[i + 2] = 112
              imageData.data[i + 3] = 255
            }
            this.context.putImageData(null, null, null)
          })
          .id('canvasPutImageDataNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('rgb(213,213,213)')
          .onReady(() => {
            let imageDataNum = this.context.createImageData(70, 70)
            let imageData = this.context.createImageData(imageDataNum)
            for (let i = 0; i < imageData.data.length; i += 4) {
              imageData.data[i + 0] = 112
              imageData.data[i + 1] = 112
              imageData.data[i + 2] = 112
              imageData.data[i + 3] = 255
            }
            this.context.putImageData(undefined, undefined, undefined)
          })
          .id('canvasPutImageDataUndefined')
      }
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('rgb(213,213,213)')
          .onReady(() => {
            let imageDataNum = this.context.createImageData(70, 70)
            let imageData = this.context.createImageData(imageDataNum)
            for (let i = 0; i < imageData.data.length; i += 4) {
              imageData.data[i + 0] = 112
              imageData.data[i + 1] = 112
              imageData.data[i + 2] = 112
              imageData.data[i + 3] = 255
            }
            this.context.putImageData(null, null, null, null, null, null, null)
          })
          .id('canvasPutImageDataNewNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('rgb(213,213,213)')
          .onReady(() => {
            let imageDataNum = this.context.createImageData(70, 70)
            let imageData = this.context.createImageData(imageDataNum)
            for (let i = 0; i < imageData.data.length; i += 4) {
              imageData.data[i + 0] = 112
              imageData.data[i + 1] = 112
              imageData.data[i + 2] = 112
              imageData.data[i + 3] = 255
            }
            this.context.putImageData(undefined, undefined, undefined, undefined, undefined, undefined, undefined)
          })
          .id('canvasPutImageDataNewUndefined')
      }
    }
    .width('100%')
    .height('100%')
  }
}
