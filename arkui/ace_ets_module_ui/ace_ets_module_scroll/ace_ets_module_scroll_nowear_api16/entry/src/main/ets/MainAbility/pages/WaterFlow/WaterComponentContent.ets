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

import { ComponentContent } from '@kit.ArkUI';

class Params {
  public text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .id('footerContent1')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height('25%')
  }
}

@Entry
@Component
struct WaterComponentContent {
  @State message1: string = 'footer'
  @State setUndefinedIndex:number = 0
  context: UIContext = this.getUIContext()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  footer1: ComponentContent<Params> =
    new ComponentContent<Params>(this.context, wrapBuilder<[Params]>(buildText), new Params(this.message1));
  @State setUndefined: (ComponentContent<Params> | undefined | null)[] = [
    this.footer1, undefined, null
  ]

  build() {
    Column({ space: 2 }) {
      Button('set ComponentContent').margin(1)
        .onClick(() => {
          this.setUndefinedIndex = 0
        })
        .id('button1')
      Button('set Undefined').margin(1)
        .onClick(() => {
          this.setUndefinedIndex = 1
        })
        .id('button2')
      Button('set null').margin(1)
        .onClick(() => {
          this.setUndefinedIndex = 2
        })
        .id('button3')
      WaterFlow({
        footerContent: this.setUndefined[this.setUndefinedIndex]
      })
        .id('WaterFlow1')
        .layoutDirection(FlexDirection.Column)
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(5)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('100%')
        .onReachStart(() => {
          console.info('waterFlow reach start')
        })
        .onScrollStart(() => {
          console.info('waterFlow scroll start')
        })
        .onScrollStop(() => {
          console.info('waterFlow scroll stop')
        })
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
          return { offsetRemain: offset }
        })
    }
  }
}