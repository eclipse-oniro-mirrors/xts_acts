'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  BottomTabBarStyle,
  TabBarSymbol,
  Text,
  Tabs,
  BarPosition,
  TabContent,
  BarMode,
  Color,
  $r,
  SubTabBarStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier'

@Entry
@Component
struct symbolModifierIndex {
  @State symbolModifier1: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_wifi'));
  @State symbolModifier2: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ellipsis_bubble'));
  @State mess: string = '111'

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('页签样式')
      Text('symbol: ' + this.mess)
        .id('tabs_symbol_mess')
      Column() {
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .tabBar(new BottomTabBarStyle({
            normal: this.symbolModifier1,
            selected: this.symbolModifier2
          } as TabBarSymbol, 'Pink'))
          .onWillShow((): void => {
            this.mess = 'Pink onWillShow'
            console.info('Pink will show')
          })
          .onWillHide((): void => {
            this.mess = 'Pink onWillHide'
            console.info('Pink will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }
          .tabBar(new BottomTabBarStyle({
            normal: this.symbolModifier1,
            selected: this.symbolModifier2,
            // params: ['111']
          } as TabBarSymbol, 'Green'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }
          .tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Orange')
            .id('Orange'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }
          .tabBar(SubTabBarStyle.of('Blue').id('Blue'))
        }
        .id('tabs_normal_id')
        .vertical(false)
        .scrollable(true)
        .height('60%')
        .width('90%')
        .barMode(BarMode.Fixed)
        .onChange((index: int): void => {
          console.info(index.toString())
        })
        .backgroundColor('0xF1F3F5')
      }
    }.width('100%')
    .height('100%')
  }
}