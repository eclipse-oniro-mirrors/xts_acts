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

import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Color, Column, Component, DragEvent, Entry, FontWeight, PreDragStatus, Row, Text,RowOptions,ColumnOptions,DragItemInfo } from '@ohos.arkui.component'

@Entry
@Component
struct ACTION_CANCELED_BEFORE_DRAG_test {
  @State message: string = 'Hello World';
  @State text: string = 'init';

  build() {
    Row({space: 1} as RowOptions) {
      Column({space: 1} as ColumnOptions) {
        Text(this.text)
          .fontSize(30)
          .margin(30)
          .id('ACTION_CANCELED_BEFORE_DRAG')
        Text(this.message)
          .id('btn')
          .width('100')
          .height('100')
          .backgroundColor(Color.Green)
          .onPreDrag((value: PreDragStatus): void => {
            if (value == PreDragStatus.ACTION_DETECTING_STATUS) {
              this.text = 'ACTION_CANCELED_BEFORE_DRAG'
            }
          })
          .fontWeight(FontWeight.Bold)
          .draggable(true)
          .onDragStart(() => {
            return {} as DragItemInfo;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}