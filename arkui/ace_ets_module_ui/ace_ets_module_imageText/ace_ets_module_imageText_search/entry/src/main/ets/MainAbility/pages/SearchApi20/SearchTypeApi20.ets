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

 class SearchModifierApi20 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.type(SearchType.ONE_TIME_CODE)
  }
}

@Entry
@Component
struct SearchTypeApi20Page {
  @State searchModifier: SearchModifierApi20 = new SearchModifierApi20()

  build() {
    Column({ space: 5 }) {
      Search({
        value:'SearchType.ONE_TIME_CODE',
        placeholder: 'input your word...',
      })
        .id('SearchTypeApi20_ONE_TIME_CODE')
        .type(SearchType.ONE_TIME_CODE)
        .height('5%')

      Search({
        value:'SearchType: default',
        placeholder: 'input your word...',
      })
        .id('SearchTypeApi20_default')
        .height('5%')

      Search({
        value:'SearchType: undefined',
        placeholder: 'input your word...',
      })
        .id('SearchTypeApi20_undefined')
        .type(undefined)
        .height('5%')

      Search({
        value:'SearchModifier',
        placeholder:'Search组件, 请输入...'
      })
        .attributeModifier(this.searchModifier)
        .id('SearchTypeApi20_Modifier')
        .height('5%')
        .margin(1)
        .borderWidth(1)
    }.height('100%')
  }
}