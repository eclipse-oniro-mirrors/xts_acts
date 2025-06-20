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

class SearchModifier implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(SearchInstance: SearchAttribute): void {
    SearchInstance.textFont({ size: 15 });
  }
}

@Entry
@Component
struct SearchModifier1 {
  @State value: string = 'init'
  @State modifier: SearchModifier = new SearchModifier();

  aboutToAppear(): void {
    this.value = typeof SearchInstance
  }

  build() {
    Column({ space: 5 }) {
      Search({ value: 'SearchModifier' })
        .attributeModifier(this.modifier)
        .id('SearchModifier_get_value')
        .height('20%')

      Text(this.value)
        .id('SearchModifier_get_type')
        .height('10%')
    }.width("90%")
  }
}