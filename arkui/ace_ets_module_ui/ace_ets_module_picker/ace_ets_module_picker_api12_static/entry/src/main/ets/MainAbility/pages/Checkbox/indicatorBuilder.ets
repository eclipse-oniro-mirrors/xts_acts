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
import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox,
  ColumnOptions, Shape, Path, Flex, Builder, TextAlign, FontWeight, FlexAlign, ItemAlign} from '@ohos.arkui.component'

@Entry
@Component
struct CheckboxExample {
  @Builder
  indicatorBuilder() {
    Column(){
      Text('9')
        .textAlign(TextAlign.Center)
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
        .fontColor('#ffffffff')
        .id('text')
    }
  }
  build() {
    Row() {
      Column() {
        Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}) {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup', indicatorBuilder:()=>{this.indicatorBuilder()}})
            .id('btn')
          Text('Checkbox1').fontSize(20)
        }.padding(15)
      }
      .width('100%')
    }
    .height('100%')
  }
}