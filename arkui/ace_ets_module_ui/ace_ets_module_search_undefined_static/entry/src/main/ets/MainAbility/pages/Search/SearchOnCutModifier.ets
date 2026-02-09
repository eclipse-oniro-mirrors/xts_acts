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

import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, AttributeModifier, SearchAttribute} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchModifierUndefined implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .onCut(undefined)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public isOnCutValid: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isOnCutValid){
      instance.onCut((cutValue1: string) => {
        this.value += 'onCut';
      })
    } else {
      instance.onCut(undefined)
    }
  }
}
@Entry
@Component
struct SearchOnCut {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .attributeModifier(this.searchModifierUndefined)
        .id('SearchOnCutModifier')
      Search({ value: `Search onCut  long long long long text`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('SearchOnCutModifier1')

      Text('copyValue: ' + this.searchModifierDynamicSwitch.value).height(30)
        .id('Search_Cut_ValueModifier0')
      Text('isOnCutValid: ' + this.searchModifierDynamicSwitch.isOnCutValid).height(30)
      Button('change isOnCutValid').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isOnCutValid = !this.searchModifierDynamicSwitch.isOnCutValid;
      })
        .margin(5)
        .id('Search_onCut_ButtonModifier0')
    }.width('100%')
  }
}