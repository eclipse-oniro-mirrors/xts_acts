'use static'
/**
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

import {  Entry,  Text,  Column,  ColumnOptions,  Component,  Button,  ClickEvent,  Color,  Row,  $r,
  Direction } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Button('b1').displayPriority(1)
          .width('60%')
        Button('b2').displayPriority(this.isUndefined1 ? undefined : 2.0)
          .id('LayoutConstraints_1')
          .width('60%')
      }
      .width('50%')
      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('LayoutConstraints_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
      }
    }
  }
}