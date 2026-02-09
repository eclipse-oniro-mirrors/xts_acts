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
struct RichEditorSingleLineDemo {
  controller: RichEditorController = new RichEditorController();
  textSpanOptions: RichEditorTextSpanOptions = { style: { fontSize: 30 } };
  exampleText: string = '这是一段示例文本\n这是一段示例文本\n这是一段示例文本';
  @State enableSingleLine: boolean | undefined | null = undefined;

  build() {
    Column() {
      Row() {
        RichEditor({ controller: this.controller })
          .id('RichEditor_singleLine')
          .onReady(() => {
            this.controller.addTextSpan(this.exampleText, this.textSpanOptions)
          })
          .singleLine(this.enableSingleLine)
          .border({ width: 1, color: Color.Black })
          .margin(10)
      }
      Row() {
        Button('切换单行模式')
          .id('RichEditor_enableSingleLine_true')
          .onClick((event: ClickEvent) => {
            this.enableSingleLine = true
          }).margin(5)
        Button('切换多行模式')
          .id('RichEditor_enableSingleLine_false')
          .onClick((event: ClickEvent) => {
            this.enableSingleLine = false
          }).margin(5)
        Button('set null')
          .id('RichEditor_enableSingleLine_null')
          .onClick((event: ClickEvent) => {
            this.enableSingleLine = null
          }).margin(5)
      }
    }
  }
}