/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'));
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State listData: number[] = [0, 0, 0, 0];

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ForEach(this.listData, (item: number, index) => {
        Column() {
          Row() {
            Image($r('app.media.app_icon')).width('10%').height('40%').margin({ right: 5 })
            Text(`Menu${index as number + 1}`).fontSize(20)
          }
          .id('close')
          .width('100%')
          .height('40%')
          .justifyContent(FlexAlign.Center)
          .align(Alignment.Center)
          .onClick(() => {
            console.info(`Menu${index as number + 1} Clicked!`);
          })

          if (index !== this.listData.length - 1) {
            Divider().height('30%').width('80%').color('#ccc')
          }
        }.padding('1%').height('5%')
      })
    }.width('20%')
  }

  build() {
    Column() {
      Text($r('sys.string.ohos_id_menu_has_filter'))
      .id('resource')
      Row(){
        Button('1')
          .id('button1')
          .bindMenu(this.MenuBuilder, { mask: true, showInSubWindow: false })
        Button('2')
          .id('button2')
          .bindMenu(this.MenuBuilder, { mask: false, showInSubWindow: false })
        Button('3')
          .id('button3')
          .bindMenu(this.MenuBuilder, { mask: undefined, showInSubWindow: false })
        Button('4')
          .id('button4')
          .bindMenu(this.MenuBuilder, { mask: null, showInSubWindow: false })
      }
    }.width('100%')
  }
}
