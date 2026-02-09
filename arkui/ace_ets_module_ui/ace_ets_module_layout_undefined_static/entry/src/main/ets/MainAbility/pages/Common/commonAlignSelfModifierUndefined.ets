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
import {AttributeModifier, CommonAttribute, FlexDirection, ItemAlign, TextAlign, Flex, FlexAlign, Stack, Row,
  Alignment, VerticalAlign, HorizontalAlign, RelativeContainer, Entry, Text, Column, Component, Button,
  ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MySelectModifier implements AttributeModifier<CommonAttribute> {
  public flag : boolean = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    instance.alignSelf(this.flag ? ItemAlign.Start : undefined);
  }
}

@Entry
@Component
struct FlexExample {
  @State modifier: MySelectModifier = new MySelectModifier()

  build() {
    Column() {
      Text('alignSelf').fontSize(20).fontColor('#ffcccccc').width('90%')
      // alignSelf会覆盖Flex布局容器中的alignItems设置
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('undefined')
          .attributeModifier(this.modifier)
          .width('33%')
          .height(70)
          .borderColor('#ffD2B48C')
          .borderWidth(2)
          .id('common_alignSelf_undefined')
          // .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
      }.width('90%').height(120).padding(10)
      .borderColor('#ffAFEEEE')
      .borderWidth(2)

      Column() {
        Button('flag is' + this.modifier.flag).fontSize(20).id('changeButton')
          .onClick((e: ClickEvent) => {
            this.modifier.flag = !this.modifier.flag;
          })
      }
    }.width('100%').margin(5)
  }
}
