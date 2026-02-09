'use static'
/**
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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, Color, AttributeModifier, SearchAttribute} from '@ohos.arkui.component'
import { State, Observed  } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier1 implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .fontColor(undefined)
  }
}

@Observed
class MyTextModifier implements AttributeModifier<SearchAttribute> {
  public isFontColor: boolean = true;
  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.isFontColor) {
      instance.fontColor('#FFA76D8D')
    } else {
      instance.fontColor(undefined)
    }
  }
}

@Entry
@Component
struct SelectedBackgroundColor {
  @State modifier: MyTextModifier = new MyTextModifier()
  @State modifier1: MyTextModifier1 = new MyTextModifier1()

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .attributeModifier(undefined)
        .id('isFontColorModifier')
      Search({ value: `Search onCut  long long long long text`})
        .attributeModifier(this.modifier)
        .id('isFontColorModifier1')

      Text('isFontColor: ' + this.modifier.isFontColor).height(30)
        .id('isFontColorValue0')
      Button('change isTextIndent').onClick((event: ClickEvent) => {
        this.modifier.isFontColor = !this.modifier.isFontColor;
      })
        .margin(5)
        .id('isFontColorButton0')
    }.width('100%')
  }
}