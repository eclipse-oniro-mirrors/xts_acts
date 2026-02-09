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
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchSelectedBackgroundColorModifier implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .textIndent(undefined)
  }
}

@Observed
class SearchSelectedBackgroundColorModifier1 implements AttributeModifier<SearchAttribute> {
  public isSelectedBackgroundColor: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isSelectedBackgroundColor){
      instance.selectedBackgroundColor('#33808080')
    } else {
      instance.selectedBackgroundColor(undefined)
    }
  }
}

@Entry
@Component
struct SelectedBackgroundColor3 {
  private searchSelectedBackgroundColorModifier: SearchSelectedBackgroundColorModifier =
  new SearchSelectedBackgroundColorModifier();
  @State searchSelectedBackgroundColorModifier1: SearchSelectedBackgroundColorModifier1 = 
  new SearchSelectedBackgroundColorModifier1();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .attributeModifier(this.searchSelectedBackgroundColorModifier)
        .id('isSelectedBackgroundColorModifier')
      Search({ value: `Search onCut ${this.searchSelectedBackgroundColorModifier1.isSelectedBackgroundColor ? `defined` : `undefined`} long long long long text`})
        .attributeModifier(this.searchSelectedBackgroundColorModifier1)
        .id('isSelectedBackgroundColorModifier1')

      Text('isSelectedBackgroundColor: ' + this.searchSelectedBackgroundColorModifier1.isSelectedBackgroundColor).height(30)
        .id('isSelectedBackgroundColorValueModifier0')
      Text('isSelectedBackgroundColor: ' + this.searchSelectedBackgroundColorModifier1.isSelectedBackgroundColor).height(30)
      Button('change isSelectedBackgroundColor').onClick((event: ClickEvent) => {
        this.searchSelectedBackgroundColorModifier1.isSelectedBackgroundColor = 
        !this.searchSelectedBackgroundColorModifier1.isSelectedBackgroundColor;
      })
        .margin(5)
        .id('isSelectedBackgroundColorButtonModifier0')
    }.width('100%')
  }
}