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
  Direction,  RowOptions,  TextAttribute,  AttributeModifier } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<TextAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined2: boolean = true;

  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .flexBasis(this.isUndefined1 ? undefined : 100.0)
      .flexGrow(this.isUndefined2 ? undefined : 2.0)
  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row({ space: 5 } as RowOptions) {
        Text('t1')
          .backgroundColor(Color.Red)
          .id('FlexLayoutM_1')
          .attributeModifier(this.myModifier)
        Text('t2')
          .flexGrow(1)
          .backgroundColor(Color.Red)
      }
      .width('100%')

      Row() {
        Button('btn1 : ' + this.myModifier.isUndefined1)
          .id('FlexLayoutM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined1 = !this.myModifier.isUndefined1
          })
        Button('btn2 : ' + this.myModifier.isUndefined2)
          .id('FlexLayoutM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier.isUndefined2 = !this.myModifier.isUndefined2
          })
      }
    }.width('100%')
  }
}