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
struct CanvasGetLineDashTypeReturn {
  @State str: string = ''
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
      Column() {
        Text(this.str).height(20)
        Row(){
          Button('TypeNotNull')
            .id('getLineDashTypeNotNull')
            .margin({ top: 5 })
            .width(90)
            .height(20)
            .onClick(() => {
              this.context.setLineDash([10,20])
              let res:number[] = this.context.getLineDash();
              AppStorage.SetOrCreate('getLineDashTypeNotNull', res);
              this.str = JSON.stringify(res)
            })
          Button('TypeNull')
            .id('getLineDashTypeNull')
            .margin({ top: 5 })
            .width(70)
            .height(20)
            .onClick(() => {
              this.context.setLineDash([])
              let res:number[] = this.context.getLineDash();
              AppStorage.SetOrCreate('getLineDashTypeNull', res);
              this.str = JSON.stringify(res)
            })
        }
        Canvas(this.context)
          .width(100)
          .height(100)
          .backgroundColor('#ffff00')
          .onReady(() => {
            this.context.arc(100, 75, 50, 0, 6.28)
            this.context.stroke()
          })
      }
      .width('100%')
  }
}