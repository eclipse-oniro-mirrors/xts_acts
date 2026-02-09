'use static';
/*
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


import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'
import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,State} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { ResourceColor, Entry, Component,RichEditorController,RichEditorOptions,Column,RichEditor,FlexAlign,BarState,Row,Button,ClickEvent,TextInput,TextArea,
  Search,Text,TextStyle,MutableStyledString,TextController,TextController,UrlStyle,TextController,StyledStringKey,Color,TextOptions,ColumnOptions,CopyOptions,
  FontStyle,Margin,StyleOptions,Span,ImageSpan,TextSpanType,TextResponseType,MenuType,HorizontalAlign,Menu,Builder,MenuItemGroup,ImageFit,ImageSpanAlignment,$r,MenuItem,
  MenuItemOptions,MenuAttribute
} from '@ohos.arkui.component';


@Entry
@Component
struct TextMenuType1 {
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller } as TextOptions;

  build() {
    Column() {
      Column() {
        Text(undefined, this.options) {
          Span('textMenuType1')
          ImageSpan($r('app.media.icon'))
            .width('100px')
            .height('100px')
            .objectFit(ImageFit.Fill)
            .verticalAlign(ImageSpanAlignment.CENTER)
        }
        .copyOption(CopyOptions.InApp)
        .bindSelectionMenu(TextSpanType.IMAGE,
          this.LongPressImageCustomMenu,
          TextResponseType.LONG_PRESS,
          {menuType:MenuType.PREVIEW_MENU})
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(200)
        .height(100)
        .id('textMenuType1')
      }
      .width('100%')
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.Start)
      .padding(25)

      Row(){
        Column() {
            Text(undefined, this.options) {
                Span('textMenuType2')
                ImageSpan($r('app.media.icon'))
                  .width('100px')
                  .height('100px')
                  .objectFit(ImageFit.Fill)
                  .verticalAlign(ImageSpanAlignment.CENTER)
            }
            .copyOption(CopyOptions.InApp)
            .bindSelectionMenu(TextSpanType.IMAGE,
              this.LongPressImageCustomMenu,
              TextResponseType.LONG_PRESS,
              {menuType:MenuType.SELECTION_MENU})
            .borderWidth(1)
            .borderColor(Color.Red)
            .width(200)
            .height(100)
            .id('textMenuType2')
        }
      }
    }
    .height('100%')
  }

  @Builder
  RightClickTextCustomMenu() {
    Column() {
      Menu() {
        MenuItemGroup() {
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Right Click Menu 1", labelInfo: "" } as MenuItemOptions)
            .onClick((event:ClickEvent) => {
              this.controller.closeSelectionMenu();
            })
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Right Click Menu 2", labelInfo: "" } as MenuItemOptions)
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Right Click Menu 3", labelInfo: "" } as MenuItemOptions)
        }
      }
      .MenuStyles()
    }
  }

  @Builder
  LongPressImageCustomMenu() {
    Column() {
      Menu() {
        MenuItemGroup() {
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Long Press Image Menu 1", labelInfo: "" } as MenuItemOptions)
            .onClick((event:ClickEvent) => {
              this.controller.closeSelectionMenu();
            })
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Long Press Image Menu 2", labelInfo: "" } as MenuItemOptions)
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Long Press Image Menu 3", labelInfo: "" } as MenuItemOptions)
        }
      }
      .MenuStyles()
    }
  }

  @Builder
  SelectMixCustomMenu() {
    Column() {
      Menu() {
        MenuItemGroup() {
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Select Mixed Menu 1", labelInfo: "" } as MenuItemOptions)
            .onClick((event:ClickEvent) => {
              this.controller.closeSelectionMenu();
            })
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Select Mixed Menu 2", labelInfo: "" } as MenuItemOptions)
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Select Mixed Menu 3", labelInfo: "" } as MenuItemOptions)
        }
      }
      .MenuStyles()
    }
  }
}

function MenuStyles(this: MenuAttribute) {
  this.radius($r('sys.float.ohos_id_corner_radius_card'))
  this.clip(true)
  this.backgroundColor('#F0F0F0')
  return this
}