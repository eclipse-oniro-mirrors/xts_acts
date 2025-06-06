/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@CustomDialog
struct CustomDialogExample {
  @Consume textValue: string
  // @Consume inputValue: string
  controller ?: CustomDialogController

  build() {
    Column() {
      Text(`${this.textValue}`).key('childText')
      Button('change').onClick(() => {
        this.textValue = 'world'
      }).key('change')
    }.borderRadius(10)
  }
}

@Entry
@Component
struct CustomDialogUser {
  @Provide textValue: string = 'hello'
  inputValue: string = 'click me'
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      textValue: $textValue,
      // inputValue: $inputValue
    }),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
  })

  build() {
    Column() {
      Text(`${this.textValue}`).key('parentText')
      Button(this.inputValue)
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff).key('click')
      Button('parent_change').onClick(() => {
        this.textValue = 'hello world'
      }).key('parent_change')
    }.width('100%')
  }
}