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

import { ComponentContent } from '@kit.ArkUI'

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
      .id('TabContent1')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }
}

@Entry
@Component
struct TabBarComponentContent {
  @State message1: string = 'tabBar1';
  @State setUndefinedIndex:number = 0;
  context: UIContext = this.getUIContext();
  private controller: TabsController = new TabsController();
  tabBar1: ComponentContent<Params> = new ComponentContent<Params>(this.context, wrapBuilder<[Params]>(buildText),
    new Params(this.message1));
  @State setUndefined: (ComponentContent<Params> | undefined | null)[] = [
    this.tabBar1, undefined, null
  ]

  build() {
    Row() {
      Column() {
        Button('set ComponentContent').margin(1)
          .onClick(() => {
            this.setUndefinedIndex = 0
          })
          .id('button1')
        Button('set undefined').margin(1)
          .onClick(() => {
            this.setUndefinedIndex = 1
          })
          .id('button2')
        Button('set null').margin(1)
          .onClick(() => {
            this.setUndefinedIndex = 2
          })
          .id('button3')
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue).borderRadius('12vp')
          }

          .tabBar(this.setUndefined[this.setUndefinedIndex])
        }
        .vertical(false)
        .barMode(BarMode.Fixed)
        .barWidth('auto')
        .barHeight('auto')
        .width(300)
        .height(300)
        .backgroundColor('#F1F3F5')
        .margin({ top: 20 })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}