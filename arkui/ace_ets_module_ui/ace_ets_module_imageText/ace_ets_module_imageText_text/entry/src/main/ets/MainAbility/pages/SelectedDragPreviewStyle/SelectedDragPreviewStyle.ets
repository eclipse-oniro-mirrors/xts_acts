/*
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
struct selectedDragPreviewStyleTest {

  build() {
    Row() {
      Scroll() {
        Column() {
          Button('DragButton')
            .id('drag_button')
            .margin(10)

          Text('TextTest')
            .fontSize(27)
            .width('90%')
            .selectedDragPreviewStyle({ color: '#008000' })
            .copyOption(CopyOptions.InApp)
            .id('text_test')

          TextArea({ text: 'TextAreaTest' })
            .draggable(true)
            .border({ width: 1 })
            .padding(5)
            .margin(5)
            .selectedDragPreviewStyle({ color: Color.Transparent })
            .id('textArea_test')

          TextInput({ text: 'TextInputTest' })
            .draggable(true)
            .border({ width: 1 })
            .padding(5)
            .margin(5)
            .selectedDragPreviewStyle(undefined)
            .id('textInput_test')

          Search({ value: 'SearchTest' })
            .draggable(true)
            .border({ width: 1 })
            .padding(5)
            .margin(5)
            .draggable(true)
            .selectedDragPreviewStyle({ color: '999test' })
            .id('search_test')
        }
        .width('100%')
      }
      .height('100%')
    }
  }
}