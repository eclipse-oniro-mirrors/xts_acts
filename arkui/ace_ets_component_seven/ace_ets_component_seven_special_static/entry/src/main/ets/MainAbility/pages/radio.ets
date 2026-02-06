'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Flex, AttributeModifier, RadioAttribute, Text, FlexDirection, ItemAlign, FlexAlign, Alignment,
  TextAlign, TextOverflow, Radio } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
class RadioModifier1 implements AttributeModifier<RadioAttribute> {
  applyNormalAttribute(instance: RadioAttribute): void {
    instance
      .radioStyle({
        indicatorColor: '#FF123456',
        checkedBackgroundColor: '#FF147258',
        uncheckedBorderColor: '#FF963852'
      })
      .checked(true)
  }
}

@Entry
@Component
struct RadioGroup {
  @State radioModifier1: RadioModifier1 = new RadioModifier1();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("radio-Group")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("groupText")

      Radio({ value: 'Radio1', group: 'radioGroup' })
        .key("RadioOne")
        .attributeModifier(this.radioModifier1)

      Radio({ value: 'Radio2', group: 'radioGroup' })
        .checked(false)
        .key("RadioTwo")
        .height(50)
        .width(50)
        .onChange((value: boolean) => {
          console.log('Radio2 status is ' + value)
        })

    }.width("100%").height("100%")
  }
}
