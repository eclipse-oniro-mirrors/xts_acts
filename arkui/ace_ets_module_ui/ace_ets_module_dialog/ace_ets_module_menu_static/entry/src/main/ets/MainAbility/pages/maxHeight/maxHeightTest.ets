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
import { Entry, Text, Column, Component, Button, ClickEvent, Divider, Image, KeyEvent, Padding, $r, Flex,
  Color, FontWeight, KeyType, AxisModel, FocusAxisEvent, ButtonType, UIContext, TextAttribute, ButtonAttribute,
  Position, Placement, MenuElement, LocalizedPadding, Margin, TabsController, Tabs, Visibility,TextAlign,
  MenuOptions, BarState,  Menu, MenuItem, ResponseType, FlexAlign, ItemAlign, FlexDirection, CounterAttribute,
  ContextMenuOptions, DividerMode, DividerStyleOptions, MenuItemGroup, ResponseType, DividerStyleOptions,
  AttributeModifier, ButtonAttribute, SubMenuExpandingMode, FontStyle, Font, CustomBuilder,
  MenuItemOptions, LengthMetrics, Builder, ResourceStr,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct maxHeightIndex {
  private iconStr: ResourceStr = $r('app.media.startIcon');
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
        Row() {
          Button('1')
            .id('percent')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + LengthMetrics.percent(0.7));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: LengthMetrics.percent(0.7),
                showInSubWindow: false
              })

          Button('2')
            .id('vp')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + LengthMetrics.vp(300));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: LengthMetrics.vp(300),
                showInSubWindow: false
              })

          Button('3')
            .id('px')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' +  LengthMetrics.px(400));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: LengthMetrics.px(400),
                showInSubWindow: false
              })
        }
        Row() {
          Button('4')
            .id('fp')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + LengthMetrics.fp(200));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: LengthMetrics.fp(200),
                showInSubWindow: false
              })

          Button('5')
            .id('lpx')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + LengthMetrics.lpx(300));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: LengthMetrics.lpx(300),
                showInSubWindow: false
              })

          Button('6')
            .id('0')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + LengthMetrics.vp(0));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: LengthMetrics.vp(0),
                showInSubWindow: false
              })
        }
        Row() {
          Button('7')
            .id('-1')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + LengthMetrics.vp(-1));
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight:LengthMetrics.vp(-1),
                showInSubWindow: false
              })

          Button('8')
            .id('undefined')
            .margin(5)
            .onClick((event?: ClickEvent) => {
              console.info('maxHeight:percent' + undefined);
            })
            .bindMenu(this.MyMenu,
              {
                maxHeight: undefined,
                showInSubWindow: false
              })
        }
      }
    }
  }
}
