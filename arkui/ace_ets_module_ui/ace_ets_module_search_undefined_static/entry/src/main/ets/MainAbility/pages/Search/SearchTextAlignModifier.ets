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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, Color, TextAlign, AttributeModifier, SearchAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchTextAlignModifier implements AttributeModifier<SearchAttribute> {
  public isTextAlign: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isTextAlign){
      instance.textAlign(TextAlign.Center)
    } else {
      instance.textAlign(undefined)
    }
  }
}

@Entry
@Component
struct SelectedBackgroundColor {
  @State searchTextAlignModifier: SearchTextAlignModifier = new SearchTextAlignModifier();

  build() {
    Column({ space: 3 } as ColumnOptions) {
      Search({ value: '', placeholder: 'please enter...' })
        .id('isTextAlignModifier')
        .width('95%')
        .height(40)
        .attributeModifier(this.searchTextAlignModifier)

      Button('change isTextAlignModifier').id('isTextAlignModifierButton')
        .onClick(() => {
          this.searchTextAlignModifier.isTextAlign = !this.searchTextAlignModifier.isTextAlign;
        })
        .margin(5)
    }.width('100%')
  }
}