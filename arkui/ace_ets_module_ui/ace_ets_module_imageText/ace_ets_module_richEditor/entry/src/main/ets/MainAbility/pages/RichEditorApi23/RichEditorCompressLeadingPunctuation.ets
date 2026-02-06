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
struct RichEditorCompressLeadingPunctuation {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  @State compressLeadingPunctuation: boolean | undefined | null = undefined;
  @State text: string = '「0123456789\n『0123456789\n（0123456789\n《0123456789\n〈0123456789\n【0123456789\n〖0123456789\n〔0123456789\n［0123456789\n｛0123456789';

  build() {
    Column() {
      RichEditor(this.options)
        .id('RichEditor_compressLeadingPunctuation')
        .onReady(() => {
          this.controller.addTextSpan(this.text)
        })
        .compressLeadingPunctuation(this.compressLeadingPunctuation)
        .borderWidth(1)
        .borderColor(Color.Green)
        .align(Alignment.Center)
        .height("30%")
        .width("50%")

      Column() {
        Button("开启行首标点符号压缩").onClick(() => {
          this.compressLeadingPunctuation = true
        }).margin({ top: 10 }).id('RichEditor_compressLeadingPunctuation_true')

        Button("关闭行首标点符号压缩").onClick(() => {
          this.compressLeadingPunctuation = false
        }).margin({ top: 10 }).id('RichEditor_compressLeadingPunctuation_false')

        Button("null").onClick(() => {
          this.compressLeadingPunctuation = null
        }).margin({ top: 10 }).id('RichEditor_compressLeadingPunctuation_null')
      }
    }.width("100%").padding(20)
  }
}