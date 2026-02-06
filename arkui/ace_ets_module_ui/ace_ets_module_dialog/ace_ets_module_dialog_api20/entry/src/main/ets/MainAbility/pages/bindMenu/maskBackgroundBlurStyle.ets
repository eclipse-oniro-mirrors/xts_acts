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
          }.id('close')
          .width('100%')
          .height('40%')
          .justifyContent(FlexAlign.Center)
          .align(Alignment.Center)
          .onClick(() => {
            console.info(`Menu${index as number + 1} Clicked!`);
          })

          if (index != this.listData.length - 1) {
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
        Button('10')
          .id('button10')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.Thin }, 
            showInSubWindow: false })
        Button('11')
          .id('button11')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.Regular }, 
            showInSubWindow: false })
        Button('12')
          .id('button12')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.Thick }, 
            showInSubWindow: false})
        Button('13')
          .id('button13')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_THIN }, 
            showInSubWindow: false })
      }
      Row(){
        Button('14')
          .id('button14')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_REGULAR }, 
            showInSubWindow: false })
        Button('15')
          .id('button15')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_THICK }, 
            showInSubWindow: false })
        Button('16')
          .id('button16')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.BACKGROUND_ULTRA_THICK }, 
            showInSubWindow: false })
        Button('17')
          .id('button17')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.NONE }, 
            showInSubWindow: false })
      }
      Row(){
        Button('18')
          .id('button18')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_ULTRA_THIN }, 
            showInSubWindow: false})
        Button('19')
          .id('button19')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_THIN }, 
            showInSubWindow: false })
        Button('20')
          .id('button20')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_REGULAR }, 
            showInSubWindow: false })
        Button('21')
          .id('button21')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_THICK }, 
            showInSubWindow: false })
      }
      Row(){
        Button('22')
          .id('button22')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:BlurStyle.COMPONENT_ULTRA_THICK }, 
            showInSubWindow: false })
        Button('23')
          .id('button23')
          .bindMenu(this.MenuBuilder, {
             mask: { backgroundBlurStyle:undefined }, 
             showInSubWindow: false })
        Button('24')
          .id('button24')
          .bindMenu(this.MenuBuilder, { 
            mask: { backgroundBlurStyle:null }, 
            showInSubWindow: false})
      }
    }.width('100%')
  }
}
