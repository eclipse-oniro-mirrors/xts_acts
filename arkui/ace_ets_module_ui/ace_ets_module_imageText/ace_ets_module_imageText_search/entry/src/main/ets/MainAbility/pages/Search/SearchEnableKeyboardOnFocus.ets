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

@Entry
@Component
struct SearchEnableKeyboardOnFocusDemo {
  @State enableKeyboardOnFocusValue: boolean | null | undefined = true;
  @State searchText: string = '';
  controller: SearchController = new SearchController();

  build() {
    Column({ space: 2 }) {
      Text('Search EnableKeyboardOnFocus Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      // 测试 enableKeyboardOnFocus 属性
      Search({
        placeholder: 'Type to search...',
        controller: this.controller
      })
        .width('90%')
        .height(50)
        .key('searchEnableKeyboardOnFocusDefault')

      Search({
        placeholder: 'Type to search...',
        controller: this.controller
      })
        .width('90%')
        .height(50)
        .enableKeyboardOnFocus(this.enableKeyboardOnFocusValue)
        .key('searchEnableKeyboardOnFocusTest')

      Row({ space: 1 }) {
        Button('Set null')
          .onClick(() => {
            this.enableKeyboardOnFocusValue = null;
          })
        Button('Set undefined')
          .onClick(() => {
            this.enableKeyboardOnFocusValue = undefined;
          })
      }

      Text(`Current enableKeyboardOnFocus value: ${JSON.stringify(this.enableKeyboardOnFocusValue)}`)
        .fontSize(16)

      // 测试 null 值的 Search
      Text('Search with enableKeyboardOnFocus(null)')
        .fontSize(16)
        .margin({ top: 20 })
      Search({
        placeholder: 'null test...',
        controller: new SearchController()
      })
        .width('90%')
        .height(50)
        .enableKeyboardOnFocus(null)
        .key('searchEnableKeyboardOnFocusNull')

      // 测试 undefined 值的 Search
      Text('Search with enableKeyboardOnFocus(undefined)')
        .fontSize(16)

      Search({
        placeholder: 'undefined test...',
        controller: new SearchController()
      })
        .width('90%')
        .height(50)
        .enableKeyboardOnFocus(undefined)
        .key('searchEnableKeyboardOnFocusUndefined')
    }
    .width('100%')
    .height('100%')
  }
}
