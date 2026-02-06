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

class SearchModifier1 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.NONE)
  }
}

class SearchModifier2 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.WORDS)
  }
}

class SearchModifier3 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.SENTENCES)
  }
}

class SearchModifier4 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.ALL_CHARACTERS)
  }
}

class SearchModifier5 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.autoCapitalizationMode(undefined)
  }
}

class SearchModifier6 implements AttributeModifier<SearchAttribute> {

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.autoCapitalizationMode(0)
  }
}

@Entry
@Component
struct SearchAutoCapitalizationModeModifier {
  @State SearchModifier1: SearchModifier1 = new SearchModifier1()
  @State SearchModifier2: SearchModifier2 = new SearchModifier2()
  @State SearchModifier3: SearchModifier3 = new SearchModifier3()
  @State SearchModifier4: SearchModifier4 = new SearchModifier4()
  @State SearchModifier5: SearchModifier5 = new SearchModifier5()
  @State SearchModifier6: SearchModifier6 = new SearchModifier6()

  build() {
    Column({ space: 1 }) {
      Search({
        value: 'AutoCapitalizationMode.NONE',
      })
        .id('Search_AutoCapitalizationModeModifier_NONE')
        .attributeModifier(this.SearchModifier1)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode.WORDS',
      })
        .id('Search_AutoCapitalizationModeModifier_WORDS')
        .attributeModifier(this.SearchModifier2)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode.SENTENCES',
      })
        .id('Search_AutoCapitalizationModeModifier_SENTENCES')
        .attributeModifier(this.SearchModifier3)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode.ALL_CHARACTERS',
      })
        .id('Search_AutoCapitalizationModeModifier_ALL_CHARACTERS')
        .attributeModifier(this.SearchModifier4)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode: undefined',
      })
        .id('Search_AutoCapitalizationModeModifier_undefined')
        .attributeModifier(this.SearchModifier5)
        .height('5%')

      Search({
        value:'AutoCapitalizationMode: 0',
      })
        .id('Search_AutoCapitalizationModeModifier_0')
        .height('5%')
        .attributeModifier(this.SearchModifier6)
    }.height('100%')
  }
}