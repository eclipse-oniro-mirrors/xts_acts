'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Builder,
  Menu,
  MenuItemOptions,
  Row,
  Margin,
  MenuItem,
  ResponseType,
  ButtonAttribute,
  AttributeModifier,
  $r,
  MenuElement,
  MenuOptions,
  Color,
  Placement,
  Font,
  MenuItemGroup,
  DividerStyleOptions,
  $$,
  SubMenuExpandingMode,
  BorderRadiuses,
  FontStyle,
  LengthMetrics,
  DividerMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  @State changeItemDivider: boolean = true;
  @State changeGroupDivider: boolean = true;
  @State changeExpandingMode: boolean = true;
  @State changeFontColor: boolean = false;
  @State changeFont: boolean = false;
  @State changeRadius1: boolean = true;
  @State changeRadius2: boolean = true;
  private myfont:Font =  {
    size: 20,
    weight: 500,
    style: FontStyle.Italic,
    family: 'Arial'
  } as Font;
  private myfont2:Font =  {
    size: 30,
    weight: 300,
    style: FontStyle.Italic,
    family: 'Arial'
  } as Font;
  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: 'select1', labelInfo: 'Ctrl+C' } as MenuItemOptions)
        .selected(true)
        .selectIcon(true)
      MenuItem({ content: 'ctrl+v', labelInfo: 'Ctrl+V' } as MenuItemOptions)
    }
    .menuItemDivider(this.changeItemDivider?{
      strokeWidth: LengthMetrics.vp(5),
      color: '#00fff0',
      mode: DividerMode.EMBEDDED_IN_MENU
    } as DividerStyleOptions :undefined)
    .radius(this.changeRadius2?40.0:undefined)
  }

  build() {
    Column() {
      Column() {
        Menu() {
          MenuItem({ content: 'select2 + select Icon' } as MenuItemOptions)
            .selected(true)
            .selectIcon(true)
          MenuItem({ content: '$$select3 + select Icon' } as MenuItemOptions)
            .selectIcon(true)
          MenuItem({ content: '$$select4/select4 + select Icon' } as MenuItemOptions)
            .selectIcon(true)
          MenuItem({
            content: '2ji caidan',
            builder: (): void => this.SubMenu()
          } as MenuItemOptions)
          MenuItem({ content: 'Item Content' } as MenuItemOptions)
          MenuItemGroup() {
            MenuItem({ content: 'Group Child change_contentFont' } as MenuItemOptions)
              .contentFont(this.myfont)
            MenuItem({ content: 'Group Child change_contentFontColor' } as MenuItemOptions)
              .contentFontColor(Color.Red)
          }
          MenuItemGroup() {
            MenuItem({
              content: 'Group Child',
              labelInfo: 'Ctrl+C'
            } as MenuItemOptions)
            MenuItem({
              content: 'Group Child',
              labelInfo: 'Ctrl+V'
            } as MenuItemOptions)
            MenuItem({
              content: 'Group Child + OnChange',
              labelInfo: 'Ctrl+V'
            } as MenuItemOptions)
          }
        }
        .font(this.changeFont ? this.myfont : undefined)
        .fontColor(this.changeFontColor ? '#FF7777' : undefined)
        .menuItemDivider(this.changeItemDivider?{
          strokeWidth: LengthMetrics.vp(1.5),
          color: Color.Pink,
          startMargin: LengthMetrics.vp(2),
          endMargin: LengthMetrics.vp(2)
        } as DividerStyleOptions :undefined)
        .menuItemGroupDivider(this.changeGroupDivider?{
          strokeWidth: LengthMetrics.vp(7),
          color: '#ff00f0',
          mode: DividerMode.EMBEDDED_IN_MENU
        } as DividerStyleOptions :undefined)
        .subMenuExpandingMode(this.changeExpandingMode?SubMenuExpandingMode.EMBEDDED_EXPAND:undefined)
        .radius(this.changeRadius1?{
          topLeft: 10,
          topRight: '15',
          bottomLeft: '50fp',
          bottomRight: '90fp'
        } as BorderRadiuses :undefined)
        .id('menu')
        .height('60%')

        Row() {
          Text('changeItemDivider: ' + this.changeItemDivider + ' ')
          Button('changeItemDivider')
            .onClick(() => {
              this.changeItemDivider = !this.changeItemDivider;
            })
            .margin({ top: 5 } as Margin)
            .id('menu_menuItemDivider')
        }
        Row() {
          Text('changeGroupDivider: ' + this.changeGroupDivider + ' ')
          Button('changeGroupDivider')
            .onClick(() => {
              this.changeGroupDivider = !this.changeGroupDivider;
            })
            .margin({ top: 5 } as Margin)
            .id('menu_menuItemGroupDivider')
        }

        Row() {
          Text('changeExpandingMode: ' + this.changeExpandingMode + ' ')
          Button('changeExpandingMode')
            .onClick(() => {
              this.changeExpandingMode = !this.changeExpandingMode;
            })
            .margin({ top: 5 } as Margin)
            .id('menu_subMenuExpandingMode')
        }
        Row() {
          Text('changeFont: ' + this.changeFont + ' ')
          Button('changeFont')
            .onClick(() => {
              this.changeFont = !this.changeFont;
            })
            .margin({ top: 5 } as Margin)
            .id('menu_font')
        }
        Row() {
          Text('changeFontColor: ' + this.changeFontColor + ' ')
          Button('changeFontColor')
            .onClick(() => {
              this.changeFontColor = !this.changeFontColor;
            })
            .margin({ top: 5 } as Margin)
            .id('menu_fontColor')
        }
        Row() {
          Button('changeRadius1')
            .onClick(() => {
              this.changeRadius1 = !this.changeRadius1;
            })
            .margin({ top: 5 } as Margin)
            .backgroundColor(this.changeRadius1?Color.Green:undefined)
            .id('menu_radius')
          Button('changeRadius2')
            .onClick(() => {
              this.changeRadius2 = !this.changeRadius2;
            })
            .backgroundColor(this.changeRadius2?Color.Green:undefined)
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}