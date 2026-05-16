/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct RichEditorBreak003 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State wordBreak: string = 'str';

  build() {
    Column() {
      Column() {
        Text('' + this.wordBreak).id('word_break_text');

        Button('getParagraphStyle').onClick(() => {
          this.wordBreak = JSON.stringify(this.controller.getParagraphs({ start: -1, end: -1 }));
        }).id('getParagraphStyle')

      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('TestWord abc', { style: { fontColor: Color.Orange, fontSize: 30 } })
          })
          .onWillChange((value: RichEditorChangeValue) => {
            value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
              console.log('change')
            })
            return true
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
          .id('rich_struct')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}