/*
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
struct TextAreaSetStyledPlaceholder {
  controller: TextAreaController = new TextAreaController();
  paragraphStyledString1: MutableStyledString =
    new MutableStyledString('setStyledPlaceholder succ')

  build() {
    Column({ space: 5 }) {
      TextArea({ placeholder: 'TextArea default' })
        .id('TextArea_setStyledPlaceholder_default')
        .placeholderColor(Color.Red)
        .placeholderFont({ size: 20, weight: 400 })
        .width('90%')
        .height('5%')

      TextArea({ placeholder: 'TextArea default', controller: this.controller })
        .id('TextArea_setStyledPlaceholder_set')
        .placeholderColor(Color.Red)
        .placeholderFont({ size: 14, weight: 400 })
        .width('90%')
        .height('5%')
        .onAppear(() => {
          this.controller.setStyledPlaceholder(this.paragraphStyledString1)
        })
    }
  }
}