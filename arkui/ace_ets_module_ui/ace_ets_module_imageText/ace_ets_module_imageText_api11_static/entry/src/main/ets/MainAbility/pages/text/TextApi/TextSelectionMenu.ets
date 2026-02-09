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
import {
  Entry,
  Component,
  Column,
  CopyOptions,
  Text,
  TextController,
  TextOptions,
  TextAlign,
  Span,
  TextSpanType,
  TextResponseType,
  Color,
  HorizontalAlign,
  Builder,
  Menu,
  MenuItemGroup,
  MenuItem,
  MenuItemOptions,
  $r,
  ClickEvent,
  MenuAttribute
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'

function MenuStyles (this: MenuAttribute) {
  this.radius($r('sys.float.ohos_id_corner_radius_card'));
  this.clip(true)
  this.backgroundColor('#F0F0F0')
  return this;
}

@Entry
@Component
struct Demo {
  controller: TextController = new TextController();
  options1: TextOptions = { controller: this.controller } as TextOptions;
  options2: TextOptions = { controller: this.controller } as TextOptions;
  options3: TextOptions = { controller: this.controller } as TextOptions;
  @State text1: string = 'text1'
  @State text2: string = 'text2'
  @State text3: string = 'text3'

  build() {
    Column() {
      Column() {

        Text(this.text1).id('textApi_text1_test').height('10%').textAlign(TextAlign.Center)
        Text(undefined, this.options1) {
          Span('Hello World')
        }
        .id('Text_bindSelectionMenu_test')
        .copyOption(CopyOptions.InApp)
        .bindSelectionMenu(TextSpanType.TEXT, this.LongPressImageCustomMenu, TextResponseType.RIGHT_CLICK, {
          onAppear: () => {
            this.text1 = 'TextResponseType.RIGHT_CLICK'
          }
        })
        .onTextSelectionChange((selectionStart: int, selectionEnd: int) => {
          console.info(`文本选中区域变化回调, selectionStart: ${selectionStart}, selectionEnd: ${selectionEnd}`);
        })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(200)
        .height('20%').textAlign(TextAlign.Center)

        Text('' + this.text2).id('textApi_text2').height('10%').textAlign(TextAlign.Center)
        Text(undefined, this.options2) {
          Span('Hello World')
        }
        .id('text_TextResponseType')
        .copyOption(CopyOptions.InApp)
        .bindSelectionMenu(TextSpanType.TEXT, this.RightClickTextCustomMenu, TextResponseType.LONG_PRESS,
          {
            onAppear: () => {
              console.log("========================================== 11111")
              this.text2 = 'TextResponseType.LONG_PRESS'
            }
          })
        .onTextSelectionChange((selectionStart: int, selectionEnd: int) => {
          console.info(`文本选中区域变化回调, selectionStart: ${selectionStart}, selectionEnd: ${selectionEnd}`);
        })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(200)
        .height('20%').textAlign(TextAlign.Center)


        Text(this.text3).id('textApi_text3').height('10%').textAlign(TextAlign.Center)
        Text(undefined, this.options3) {
          Span('Hello World')
        }
        .copyOption(CopyOptions.InApp)
        .bindSelectionMenu(TextSpanType.MIXED, this.SelectMixCustomMenu, TextResponseType.SELECT, {
          onAppear: () => {

          }
        })
        .onTextSelectionChange((selectionStart: int, selectionEnd: int) => {
          console.info(`文本选中区域变化回调, selectionStart: ${selectionStart}, selectionEnd: ${selectionEnd}`);
        })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(200)
        .height('20%').textAlign(TextAlign.Center)





      }
      .width('100%')
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.Start)
      .height('100%')
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
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Select Mixed Menu 1", labelInfo: "" }as MenuItemOptions)
            .onClick((event:ClickEvent) => {
              this.controller.closeSelectionMenu();
            })
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Select Mixed Menu 2", labelInfo: "" }as MenuItemOptions)
          MenuItem({ startIcon: $r('app.media.app_icon'), content: "Select Mixed Menu 3", labelInfo: "" }as MenuItemOptions)
        }
      }
      .MenuStyles()
    }
  }
}


