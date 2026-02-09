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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button,
  AttributeModifier, SearchAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchModifierUndefined implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .onCopy(undefined)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public isOnCopyValid: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isOnCopyValid){
      instance.onCopy((copyValue1: string) => {
        this.value += 'onCopy';
      })
    } else {
      instance.onCopy(undefined)
    }
  }
}

@Entry
@Component
struct SearchOnCopyModifier {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCopy undefined long long long long text' })
        .attributeModifier(this.searchModifierUndefined)
        .id('Search_OnCopy_Modifier_Undefined0')
      Search({ value: `Search onCopy ${this.searchModifierDynamicSwitch.isOnCopyValid ? `defined` : `undefined`} long long long long text`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('Search_OnCopy_Modifier_Dynamic0')

      Text('copyValue: ' + this.searchModifierDynamicSwitch.value).height(30)
        .id('Search_OnCopy_Modifier_Value0')
      Text('isOnCopyValid:' + this.searchModifierDynamicSwitch.isOnCopyValid).height(30)
      Button('change isOnCopyValid').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isOnCopyValid = !this.searchModifierDynamicSwitch.isOnCopyValid;
      })
        .margin(5)
        .id('Search_OnCopy_Modifier_Button0')

    }.width('100%')
  }
}