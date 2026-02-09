/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct Page {
  controller: TextInputController = new TextInputController();

  build() {
    Column() {
      TextInput({ text: '测试文本⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️⛏️', controller: this.controller })
        .id('miningTimeTextInput')
        .width('80%')
        .height('10%')

      Button('1')
        .onClick(() => {
          this.controller.deleteBackward();
        })
        .id('deleteBackwardBtn')
    }
    .width('100%')
  }
}