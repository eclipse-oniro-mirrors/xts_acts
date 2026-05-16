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
  Color,
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
  Placement,
  Font,
  MenuItemGroup,
  DividerStyleOptions,
  $$,
  SubMenuExpandingMode,
  BorderRadiuses,
  FontStyle,
  LengthMetrics,
  DividerMode,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  @State changeSelect: boolean = true;
  @State changeSelectIcon: boolean = true;
  @State changeContentFontColor: boolean = true;
  @State changeContentFont: boolean = true;
  @State changeLabelFontColor: boolean = true;
  @State changeLabelFont: boolean = true;
  @State changeOnChange: boolean = true;
  @State itemOnChange: number = 0;
  private myfont: Font = {
    size: 20,
    weight: 500,
    style: FontStyle.Italic,
    family: 'Arial'
  } as Font;

  build() {
    Column() {
      Column() {
        Menu() {
          MenuItem({ content: 'select + select Icon' } as MenuItemOptions)
            .id('menuItemOrigin')
            .contentFontColor(undefined)
            .labelFontColor(undefined)
          MenuItem({ content: 'select + select Icon' } as MenuItemOptions)
            .selected(this.changeSelect ? true : undefined)
            .selectIcon(this.changeSelectIcon ? true : undefined)
            .id('menuItem1')
          MenuItem({
            content: 'Group Child + OnChange',
            labelInfo: 'Ctrl+V'
          } as MenuItemOptions)
            .contentFont(this.changeContentFont ? this.myfont : undefined)
            .contentFontColor(this.changeContentFontColor ? '#FFFF7777' : undefined)
            .labelFont(this.changeLabelFont ? this.myfont : undefined)
            .labelFontColor(this.changeLabelFontColor ? '#FFFF7777' : undefined)
            .onChange(this.changeOnChange ? (selected: boolean) => {
              this.itemOnChange = this.itemOnChange + 1;
            } : undefined)
            .id('menuItem2')
        }
        .height('40%')

        Row() {
          Button('changeSelect')
            .onClick(() => {
              this.changeSelect = !this.changeSelect;
            })
            .backgroundColor(this.changeSelect ? Color.Green : undefined)
            .margin({ top: 5 } as Margin)
            .id('menuItem_selected')
        }

        Row() {
          Button('changeSelectIcon')
            .onClick(() => {
              this.changeSelectIcon = !this.changeSelectIcon;
            })
            .margin({ top: 5 } as Margin)
            .backgroundColor(this.changeSelectIcon ? Color.Green : undefined)
            .id('menuItem_selectIcon')
        }

        Row() {
          Text('changeContentFont: ' + this.changeContentFont + ' ')
          Button('changeContentFont')
            .onClick(() => {
              this.changeContentFont = !this.changeContentFont;
            })
            .margin({ top: 5 } as Margin)
            .id('menuItem_contentFont')
        }

        Row() {
          Text('changeContentFontColor: ' + this.changeContentFontColor + ' ')
          Button('changeContentFontColor')
            .onClick(() => {
              this.changeContentFontColor = !this.changeContentFontColor;
            })
            .margin({ top: 5 } as Margin)
            .id('menuItem_contentFontColor')
        }

        Row() {
          Text('changeLabelFont: ' + this.changeLabelFont + ' ')
          Button('changeLabelFont')
            .onClick(() => {
              this.changeLabelFont = !this.changeLabelFont;
            })
            .margin({ top: 5 } as Margin)
            .id('menuItem_labelFont')
        }

        Row() {
          Text('changeLabelFontColor: ' + this.changeLabelFontColor + ' ')
          Button('changeLabelFontColor')
            .onClick(() => {
              this.changeLabelFontColor = !this.changeLabelFontColor;
            })
            .margin({ top: 5 } as Margin)
            .id('menuItem_labelFontColor')
        }

        Row() {
          Text('itemOnChange: ' + this.itemOnChange)
            .margin({ top: 5 } as Margin)
            .id('menuItem_OnChange1')
          Text('changeOnChange: ' + this.changeOnChange)
          Button('changeOnChange')
            .onClick(() => {
              this.changeOnChange = !this.changeOnChange;
            })
            .margin({ top: 5 } as Margin)
            .id('menuItem_OnChange2')
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}