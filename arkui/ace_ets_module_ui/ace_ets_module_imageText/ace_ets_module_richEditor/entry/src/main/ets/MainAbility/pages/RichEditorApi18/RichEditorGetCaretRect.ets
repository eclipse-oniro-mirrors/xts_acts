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
struct RichEditorGetCaretRect {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      RichEditor(this.options)
        .height('5%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)

      Button('getCaretRect undefined').onClick(() => {
        let ret = this.controller.getCaretRect();
        console.log('getCaretRect return:' + ret)
        AppStorage.setOrCreate('getCaretRect_return', ret)
      }).id('getCaretRect_return')
    }
  }
}