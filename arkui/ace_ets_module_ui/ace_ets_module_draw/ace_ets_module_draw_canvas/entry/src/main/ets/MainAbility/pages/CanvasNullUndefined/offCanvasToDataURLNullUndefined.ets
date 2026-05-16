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
struct offCanvasToDataURLNullUndefined {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offCanvas: OffscreenCanvas = new OffscreenCanvas(100, 100);
  @State dataURL: string = '';

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .enableAnalyzer(null)
          .onReady(() =>{
            let offContext = this.offCanvas.getContext('2d', null)
            offContext.fillRect(0,0,70,70)
            this.dataURL = offContext.toDataURL(null,null)
          })
          .id('offCanvasToDataURLNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .enableAnalyzer(false)
          .onReady(() =>{
            let offContext = this.offCanvas.getContext('2d', undefined)
            offContext.fillRect(0,0,70,70)
            this.dataURL = offContext.toDataURL(undefined,undefined)
          })
          .id('offCanvasToDataURLUndefined')
      }
      Row({space:2}){
        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .enableAnalyzer(undefined)
          .onReady(() =>{
            let offContext = this.offCanvas.getContext('2d', this.settings)
            offContext.fillRect(0,0,70,70)
            this.dataURL = offContext.toDataURL('',0.1)
          })
          .id('offCanvasToDataURLStringNull')

        Canvas(this.context)
          .width(80)
          .height(80)
          .backgroundColor('#0ffff0')
          .enableAnalyzer(true)
          .onReady(() =>{
            let offContext = this.offCanvas.getContext('2d', this.settings)
            offContext.fillRect(0,0,70,70)
            this.dataURL = offContext.toDataURL('',0.1)
          })
          .id('offCanvasToDataURLStringUndefined')
      }
    }
    .width('100%')
    .height('100%')
  }
}