'use static';
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
import router from '@ohos.router';
import {
  Entry,
  Column,Resource,MenuItemGroup,
  Component,
  Button,
  ClickEvent,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,MenuItem,BlurStyleActivePolicy,AdaptiveColor,ThemeColorMode,MenuElement,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,Menu,BackgroundBlurStyleOptions,BlurStyle,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { MenuModifier } from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {
  @State fontSizeIndex: Int = 0;
  @State fontSizeList: ( string | number | Resource )[] = new Array<string | number | Resource>('50px', -20, 0)
  @State select: boolean = true
  @State menuItemValue: string = ''
  @State modifier:MenuModifier = new MenuModifier().font({ size: this.fontSizeList[this.fontSizeIndex] })
  private iconStr: ResourceStr = $r('app.media.app_icon')
  private iconStr2: ResourceStr = $r('app.media.app_icon')

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '复制', labelInfo: 'Ctrl+C' } as MenuItemOptions)
      MenuItem({ content: '粘贴', labelInfo: 'Ctrl+V' } as MenuItemOptions)
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' } as MenuItemOptions)
      MenuItem({ startIcon: $r('app.media.app_icon'), content: '菜单选项' } as MenuItemOptions)
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      } as MenuItemOptions)
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        } as MenuItemOptions)
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      } as MenuItemOptions)
    }
    .attributeModifier(this.modifier as MenuModifier)

  }
  build() {
    Column() {
      Button('切换数值')
        .onClick((e: ClickEvent) => {
          this.fontSizeIndex++
          if (this.fontSizeIndex > this.fontSizeList.length - 1) {
            this.fontSizeIndex = 0
          }
          console.log('fontSizeIndex = ' + this.fontSizeIndex)
        })
        .id('MenuFontSizeChangeButtonID')
      Column() {
        Text('click to show menu')
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)
      }
      .bindMenu(this.MyMenu)
      .id('MenuFontSizeButtonID')
      .width('100%')
      Text(this.fontSizeList[this.fontSizeIndex].toString()).key('MenuFontSizeValueKey')
    }.width('100%')
  }
}
