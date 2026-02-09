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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, AttributeModifier,
  SearchAttribute, CaretStyle, Color } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

const curCaretStyle:(CaretStyle | undefined)[] = [
  { width : '4vp', color : Color.Red } as CaretStyle,
  { width : undefined, color : Color.Red } as CaretStyle,
  { width : '4vp', color : undefined } as CaretStyle,
  { width : undefined, color : undefined } as CaretStyle,
  { width : '4vp', color : Color.Red } as CaretStyle,
  undefined
]

@Observed
class SearchModifierUndefined implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .caretStyle(undefined)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public caretStyleIndex: Int = 0;

  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
    if (this.caretStyleIndex === 0) {
      instance
        .caretStyle(curCaretStyle[0])
    } else if (this.caretStyleIndex === 1) {
      instance
        .caretStyle(curCaretStyle[1])
    } else if (this.caretStyleIndex === 2) {
      instance
        .caretStyle(curCaretStyle[2])
    } else if (this.caretStyleIndex === 3) {
      instance
        .caretStyle(curCaretStyle[3])
    } else if (this.caretStyleIndex === 4) {
      instance
        .caretStyle(curCaretStyle[4])
    } else if (this.caretStyleIndex === 5) {
      instance
        .caretStyle(curCaretStyle[5])
    }
  }
}

@Entry
@Component
struct SearchCaretStyleModifier {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State private searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({value: 'Search caretStyle undefined'})
        .attributeModifier(this.searchModifierUndefined)
        .id('Search_CaretStyle_Modifier_Undefined0')
      Search({value: `Search caretStyle ${this.searchModifierDynamicSwitch.caretStyleIndex}`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('Search_CaretStyle_Modifier_Dynamic0')

      Text('caretStyleIndex:' + this.searchModifierDynamicSwitch.caretStyleIndex).height(30)
      Button('change caretStyleIndex').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.caretStyleIndex = (this.searchModifierDynamicSwitch.caretStyleIndex + 1) % 6;
      })
        .margin(5)
        .id('Search_CaretStyle_Modifier_Button0')

    }.width('100%')
  }
}