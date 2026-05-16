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

import {  Entry,  Text,  Column,  Component,  Button,
  ClickEvent,  $r,  Row,  Divider,  ColumnOptions,
  BorderOptions,  Color,  Toggle,  Blank,  Margin,
  List,  Padding,  AttributeModifier,  BlankAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<BlankAttribute> {
  public isUndefined: boolean = false;

  applyNormalAttribute(instance: BlankAttribute): void {
    instance
      .color(this.isUndefined ? undefined : Color.Yellow)
  }
}
@Entry
@Component
struct BlankExample {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Button('isUndefined = ' + this.myModifier.isUndefined)
        .onClick(() => {
          this.myModifier.isUndefined == true ? this.myModifier.isUndefined = false
                                              : this.myModifier.isUndefined = true;
        })
        .id('BlankAttrsModifier_color')
        .margin({ top: 10, bottom: 15 } as Margin)
        .height(60)
        .width(200)

      Text('Blank-color-动态切换(undefined/Color.Yellow)')
        .fontSize(20)
        .margin(15)
        .width('90%')
      List() {
        Row() {
          Text('Bluetooth').fontSize(18)
          Blank('160')
            .id('MyBlankAttrsModifier')
            .attributeModifier(this.myModifier)
        }
        .borderRadius(15)
        .padding({ left: 12 } as Padding)
        .width('90%')
      }
      Divider().margin(10)
    }
    .backgroundColor('#EFEFEF')
    .padding(10)
    .width('100%')
    .height('100%')
  }
}