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
  ColumnOptions, Shape, Path, Flex, Builder, Margin, Radio,RadioConfiguration,RadioConfiguration,CustomBuilderT,
  WrappedBuilder,wrapBuilder,ContentModifier
} from '@ohos.arkui.component'

class MyRadioStyle implements ContentModifier<RadioConfiguration> {
  constructor() {}
  applyContent(): WrappedBuilder<CustomBuilderT<RadioConfiguration>>{
    return wrapBuilder<CustomBuilderT<RadioConfiguration>>(buildRadio)
  }
}

@Builder function buildRadio(config: RadioConfiguration) {
  Column({ space:10 } as ColumnOptions) {
    Text(config.value)
    Button(config.checked ? "off" : "on")
      .id('RadioContentModifier_btn')
      .backgroundColor(0xAABBCC)
      .onClick((E:ClickEvent)=>{
        console.log("========================================= " + config.checked)
        if (config.checked) {
          config.triggerChange(false)
        } else {
          config.triggerChange(true)
          console.log("========================================= config.triggerChange(true)" + config.checked)
        }
      })
  }
}

@Entry
@Component
struct RadioContentModifierTest {
  build() {
    Column({ space: 50 } as ColumnOptions) {
      Radio({ value: 'Radio1', group: 'radioGroup' })
        .contentModifier(new MyRadioStyle())
        .checked(false)

    }.width('100%')
  }
}