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
import {MenuItemModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {
  @State select: boolean = true
  @State menuItemValue: string = ''
  @State modifier:MenuItemModifier = new MenuItemModifier().onChange((value: boolean) => {
    if(value){
      this.menuItemValue = 'true'
    }else {
      this.menuItemValue = 'false'
    }

    console.info('selectMenu02 MenuItemModifier change is' + value)
  })
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
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        } as MenuItemOptions).id('MenuItemOnChangeID')
          .attributeModifier(this.modifier as MenuItemModifier)
    }
  }
  build() {
    Column() {
      Column() {
        Text('menu')
          .fontSize(5)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Green)
      }
      .bindMenu(this.MyMenu)
      .id('MenuItemOnButtonID')
      .width('10%')
      Text(this.menuItemValue.toString()).key('MenuItemOnChangValueKey')
    }.width('10')
  }
}
