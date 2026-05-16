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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  BorderStyle,
  Button,
  SizeOptions,
  Margin,
  ClickEvent,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
@Entry
@Component
struct AreaExample {
  @State value: string = 'Text'
  @State sizeValue: string = ''
  @State onSizeChangeValue: string = 'onSizeChange'
  build() {
    Column() {
      Text(this.onSizeChangeValue)
        .id("onSizeChangeMessage")
        .margin(30)
        .fontSize(20)

      Button(this.value)
        .id("onSizeChangeXTS")
        .backgroundColor(Color.Green)
        .margin(30)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.value = this.value + 'Text'
        })
        .onSizeChange((oldValue: SizeOptions, newValue: SizeOptions): void => {
          this.onSizeChangeValue = 'onSizeChange success'
          console.info(`Ace: on size change, oldValue is ${JSON.stringify(oldValue)} value is ${JSON.stringify(newValue)}`)
          this.sizeValue = JSON.stringify(newValue)
        })
      Text('new area is: \n' + this.sizeValue).margin({ right: 30, left: 30 } as Margin)
    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}