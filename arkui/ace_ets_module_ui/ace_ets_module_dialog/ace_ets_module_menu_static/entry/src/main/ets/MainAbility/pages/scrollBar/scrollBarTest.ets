/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

'use static'

import { Entry, Text, Column, Row, Component, Button, Marquee, Scroll, MarqueeUpdateStrategy } from '@kit.ArkUI';
import { Entry, Text, Column, Component, Button, ClickEvent, Divider, Image, KeyEvent, Padding, $r, Row, Flex,
  Scroll, Color, FontWeight, KeyType, AxisModel, FocusAxisEvent, ButtonType, UIContext, TextAttribute, ButtonAttribute,
  Position, Placement, MenuElement, LocalizedPadding, Margin, TabsController, Tabs, Visibility,TextAlign, ResourceStr,
  MenuOptions, BarState,  Menu, MenuItem, ResponseType, FlexAlign, ItemAlign, FlexDirection, CounterAttribute,
  ContextMenuOptions, DividerMode, DividerStyleOptions, MenuItemGroup, ResponseType, DividerStyleOptions, Builder,
  AttributeModifier, ButtonAttribute, SubMenuExpandingMode, FontStyle, Font, CustomBuilder, MenuItemOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct scrollBarIndex {
  @State textAutoValue: string = '';
  @State textOnValue: string = '';
  @State textOffValue: string = '';

  private uiContext: UIContext | undefined = undefined;

  aboutToAppear() {
    this.uiContext = this.getUIContext();
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
      MenuItem({ content: 'Item Content' }as MenuItemOptions)
    }.id('menu')
  }

  build() {
    Scroll() {
      Column() {
        Row(){
          Text(this.textOffValue)
            .id('textOff')
            .fontSize(15)
          Text(this.textAutoValue)
            .id('textAuto')
            .fontSize(15)
          Text(this.textOnValue)
            .id('textOn')
            .fontSize(15)
        }
        Row() {
          Button('scrollBar: Off')
            .id('off')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('scrollBar: Off' + BarState.Off);
              const scrollBarValue0 = BarState.Off;
              this.textOffValue = scrollBarValue0.toString();
            })
            .bindMenu(this.MyMenu,
              {
                scrollBar: BarState.Off,
                showInSubWindow: false
              })

          Button('scrollBar: Auto')
            .id('auto')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('scrollBar: Auto' + BarState.Auto);
              const scrollBarValue1 = BarState.Auto;
              this.textAutoValue = scrollBarValue1.toString();
            })
            .bindMenu(this.MyMenu,
              {
                scrollBar: BarState.Auto,
                showInSubWindow: false
              })

          Button('scrollBar: On')
            .id('on')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('scrollBar: On' + BarState.On);
              const scrollBarValue2 = BarState.On;
              this.textOnValue = scrollBarValue2.toString();
            })
            .bindMenu(this.MyMenu,
              {
                scrollBar: BarState.On,
                showInSubWindow: false
              })
        }
      }
    }
  }
}
