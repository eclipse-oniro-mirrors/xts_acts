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
import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import {
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  cursorControl,
  Entry,
  Margin,
  PointerStyle,
  TextInputController
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct CursorControlExample {
  @State num1: PointerStyle = pointer.PointerStyle.DEFAULT
  controller: TextInputController = new TextInputController()

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('setCursor枚举值：' + `${this.num1}`)
        .onClick((e: ClickEvent) => {
          let context = this.getUIContext().getHostContext() as common.BaseContext
          window.getLastWindow(context, (error: BusinessError<void> | null, win: window.Window | undefined) => {
            let windowId: Int | undefined = win?.getWindowProperties()?.id ?? undefined;
            let style: pointer.PointerStyle = pointer.getPointerStyleSync(windowId!);
            this.num1 = style
          });
        })
        .key('setCursor_1')
        .margin({ top: 10 } as Margin)
      Button('setCursor')
        .onClick((e: ClickEvent) => {
          cursorControl.setCursor(pointer.PointerStyle.SOUTH)
        })
        .key('setCursor_2')
      Button('restoreDefault')
        .onClick((e: ClickEvent) => {
          cursorControl.restoreDefault()
        })
        .key('setCursor_3')
    }.width('100%')
  }
}