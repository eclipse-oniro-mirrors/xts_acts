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
import {TextAlign,FlexDirection,Flex,TextAttribute,AttributeModifier, CommonAttribute, Stack, Row, Alignment,
  VerticalAlign, HorizontalAlign, RelativeContainer, Entry, Text, Column, Component, Button,
  ClickEvent } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class ModifierFlexShrink implements AttributeModifier<TextAttribute> {
  public flag: boolean = true;
  applyNormalAttribute(instance: TextAttribute): void {
    instance.flexShrink(this.flag ? 8 as Double : undefined )
  }
}

@Entry
@Component
struct FlexExample {
  @State modifier: ModifierFlexShrink = new ModifierFlexShrink()

  build() {
    Column() {
      Text('flexShrink-动态切换').fontSize(20).margin(15).width('90%')
      Flex({ direction: FlexDirection.Row }) {
        Text('flexShrink(0)')
          .width('50%')
          .height(50)
          .backgroundColor('#0ff5DEB3')
          .textAlign(TextAlign.Center)
          .attributeModifier(this.modifier)
          .id('common_FlexShrink')
      }.width('90%').height(60).padding(10).backgroundColor('#ffAFEEEE')

      Column() {
        Button('flag is' + this.modifier.flag).fontSize(20).id('changeButton')
          .onClick((e: ClickEvent) => {
            this.modifier.flag = !this.modifier.flag;
          })
      }.width('100%')
    }
  }
}