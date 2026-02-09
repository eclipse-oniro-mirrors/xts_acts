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
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  FlexDirection,
  CustomPopupOptions,
  RowOptions,
  Placement,
  Padding,
  Builder
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

@Entry
@Component
struct PopupExampleA {
  @State customPopup: boolean = false

  // popup构造器定义弹框内容
  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Text('Custom Popup').fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      // CustomPopupOptions 类型设置弹框内容
      Button('Popup按esc逐层退出').key('Popup_dialog_A')
        .onClick((e: ClickEvent) => {
          this.customPopup = !this.customPopup
        }).bindPopup(this.customPopup, {
        builder: this.popupBuilder,
        placement: Placement.Top,
        popupColor: Color.Yellow,
        enableArrow: true,
      } as CustomPopupOptions)
    }.width('100%').padding({ top: 200 } as Padding)
  }
}