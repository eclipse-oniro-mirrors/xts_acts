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

 class SearchModifier11 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.enableAutoSpacing(true)
  }
}

class SearchModifier12 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.enableAutoSpacing(false)
  }
}

class SearchModifier13 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.enableAutoSpacing(undefined)
  }
}

@Entry
@Component
struct SearchEnableAutoSpacing {
  @State searchModifier11: SearchModifier11 = new SearchModifier11()
  @State searchModifier12: SearchModifier12 = new SearchModifier12()
  @State searchModifier13: SearchModifier13 = new SearchModifier13()

  build() {
    Column({ space: 1 }) {
      Search({
        value:'Search：enableAutoSpacing(true)',
      })
        .id('Search_enableAutoSpacing_true')
        .enableAutoSpacing(true)
        .height('5%')

      Search({
        value:'Search：enableAutoSpacing(false)',
      })
        .id('Search_enableAutoSpacing_false')
        .enableAutoSpacing(false)
        .height('5%')

      Search({
        value:'Search：enableAutoSpacing(default)',
      })
        .id('Search_enableAutoSpacing_default')
        .height('5%')

      Search({
        value:'Search：enableAutoSpacing(undefined)',
      })
        .id('Search_enableAutoSpacing_undefined')
        .enableAutoSpacing(undefined)
        .height('5%')

      Search({
        value:'SearchModifier: true',
      })
        .attributeModifier(this.searchModifier11)
        .id('SearchModifier_enableAutoSpacing_true')
        .height('5%')
        .borderWidth(1)

      Search({
        value:'SearchModifier: false',
      })
        .attributeModifier(this.searchModifier12)
        .id('SearchModifier_enableAutoSpacing_false')
        .height('5%')
        .borderWidth(1)

      Search({
        value:'SearchModifier: undefined',
      })
        .attributeModifier(this.searchModifier13)
        .id('SearchModifier_enableAutoSpacing_undefined')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}