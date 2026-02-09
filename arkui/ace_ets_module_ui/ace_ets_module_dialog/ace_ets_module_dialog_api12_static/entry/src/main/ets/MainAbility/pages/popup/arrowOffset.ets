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
  Entry, Component, Placement, KeyboardAvoidMode,
  Column, ColumnOptions, Color, RowOptions, PopupStateChangeParam,
  Text, Button, ClickEvent, Margin, Row, Builder, CustomPopupOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CustomPopup {
  @State customPopup: boolean = false;
  @State customPopup1: boolean = false;

  @Builder popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom Popup')
        .id('customText')
        .fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build() {
    Column() {
      Button('CustomPopup')
        .id('CustomPopup')
        .onClick((e:ClickEvent) => {
          this.customPopup = !this.customPopup;
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Top,
          mask: {color:'#33000000'},
          popupColor: Color.Yellow,
          enableArrow: true,
          arrowOffset:10,
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        } as CustomPopupOptions)

      Button('CustomPopup1')
        .id('CustomPopup1')
        .onClick((e:ClickEvent) => {
          this.customPopup1 = !this.customPopup1;
        })
        .bindPopup(this.customPopup1, {
          builder: this.popupBuilder,
          placement: Placement.Top,
          mask: {color:'#33000000'},
          popupColor: Color.Yellow,
          enableArrow: true,
          arrowOffset: undefined,
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup1 = false;
            }
          }
        } as CustomPopupOptions)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
