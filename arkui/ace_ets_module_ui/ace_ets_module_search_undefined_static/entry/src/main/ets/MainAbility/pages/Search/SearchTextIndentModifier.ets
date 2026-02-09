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
class SearchTextIndentModifier implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .textIndent(undefined)
  }
}

@Observed
class SearchTextIndentModifier1 implements AttributeModifier<SearchAttribute> {
  public isTextIndent: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isTextIndent){
      instance.textIndent('5vp')
    } else {
      instance.textIndent(undefined)
    }
  }
}

@Entry
@Component
struct SelectedBackgroundColor5 {
  private searchTextIndentModifier: SearchTextIndentModifier = new SearchTextIndentModifier();
  @State searchTextIndentModifier1: SearchTextIndentModifier1 = new SearchTextIndentModifier1();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .attributeModifier(this.searchTextIndentModifier)
        .id('isTextIndentModifier')
      Search({ value: `Search onCut ${this.searchTextIndentModifier1.isTextIndent ? `defined` : `undefined`} long long long long text`})
        .attributeModifier(this.searchTextIndentModifier1)
        .id('isTextIndentModifier1')

      Text('isSelectedBackgroundColor: ' + this.searchTextIndentModifier1.value).height(30)
        .id('isTextIndentValueModifier0')
      Text('isSelectedBackgroundColor: ' + this.searchTextIndentModifier1.isTextIndent).height(30)
      Button('change isTextIndent').onClick((event: ClickEvent) => {
        this.searchTextIndentModifier1.isTextIndent = !this.searchTextIndentModifier1.isTextIndent;
      })
        .margin(5)
        .id('isTextIndentButtonModifier0')
    }.width('100%')
  }
}