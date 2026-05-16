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
  Direction,  AttributeModifier,  RowAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<RowAttribute> {
  public isUndefined1: boolean = true;

  applyNormalAttribute(instance: RowAttribute): void {
    instance
      .direction(this.isUndefined1 ? undefined : Direction.Rtl)
  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Button('b1')
        Button('b2')

      }
      .id('LocationM_1')
      .attributeModifier(this.myModifier)

      Row() {
        Button('btn1 : ' + this.myModifier.isUndefined1)
          .id('LocationM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined1 = !this.myModifier.isUndefined1
          })
      }
    }
  }
}