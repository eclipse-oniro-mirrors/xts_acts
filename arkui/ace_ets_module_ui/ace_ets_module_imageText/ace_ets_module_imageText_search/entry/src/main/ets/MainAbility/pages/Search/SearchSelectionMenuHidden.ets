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
struct SearchSelectionMenuHiddenDemo {
  @State selectionMenuHiddenValue: boolean | null | undefined = false;
  @State searchText: string = '123456';
  controller: SearchController = new SearchController();

  build() {
    Column({ space: 2 }) {
      Text('Search SelectionMenuHidden Test')
        .fontSize(20).height('3%')
        .fontWeight(FontWeight.Bold)

      // 测试 selectionMenuHidden 属性
      Search({
        value: this.searchText,
        placeholder: 'Type to search...',
        controller: this.controller
      })
        .width('90%')
        .height('3%')
        .selectionMenuHidden(this.selectionMenuHiddenValue)
        .key('searchSelectionMenuHiddenTest')

      Row({ space: 1 }) {
        Button('Set null')
          .onClick(() => {
            this.selectionMenuHiddenValue = null;
          })
        Button('Set undefined')
          .onClick(() => {
            this.selectionMenuHiddenValue = undefined;
          })
      }.height('3%')

      Text(`Current selectionMenuHidden value: ${JSON.stringify(this.selectionMenuHiddenValue)}`)
        .fontSize(16).height('3%')

      Row(){
        // 测试 默认值的 Search
        Search({
          value: 'Default',
          placeholder: 'null test...',
          controller: new SearchController()
        })
          .width('90%')
          .height('3%')
          .key('searchSelectionMenuHiddenDefault')

        // 测试 null 值的 Search
        Search({
          value: 'null',
          placeholder: 'null test...',
          controller: new SearchController()
        })
          .width('90%')
          .height('3%')
          .selectionMenuHidden(null)
          .key('searchSelectionMenuHiddenNull')

        // 测试 undefined 值的 Search
        Search({
          value: 'undefined',
          placeholder: 'undefined test...',
          controller: new SearchController()
        })
          .width('90%')
          .height('3%')
          .selectionMenuHidden(undefined)
          .key('searchSelectionMenuHiddenUndefined')
      }      
    }
    .width('100%')
    .height('100%')
  }
}
