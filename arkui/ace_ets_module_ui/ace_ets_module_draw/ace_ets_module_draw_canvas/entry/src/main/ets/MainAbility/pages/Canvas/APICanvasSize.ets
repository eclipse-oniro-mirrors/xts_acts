/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct APICanvasSize {
  private context: DrawingRenderingContext = new DrawingRenderingContext()
  @State sizeWidth: number = -1
  @State sizeHeight: number = -1

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('80%')
        .height('50%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.canvas.drawCircle(50, 50, 50)
          this.context.invalidate()
        })

      Row() {
        Button('get width').key('APICanvasSizeButton1')
          .onClick((event: ClickEvent) => {
          this.sizeWidth = this.context.size.width
        })
        Button('get height').key('APICanvasSizeButton2')
          .onClick((event: ClickEvent) => {
          this.sizeHeight = this.context.size.height
        })
      }

      Row() {
        Text(this.sizeWidth + '').key('APICanvasSizeText1')
        Text(this.sizeHeight + '').key('APICanvasSizeText2') 
      }
    }
    .id('APICanvasSizeFlex')
    .width('100%')
    .height('100%')
  }
}