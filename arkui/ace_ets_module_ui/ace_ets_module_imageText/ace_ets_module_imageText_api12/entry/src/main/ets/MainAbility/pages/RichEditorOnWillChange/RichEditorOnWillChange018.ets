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

@Entry
@Component
struct RichEditorOnWillChange018 {
  @State text: string = 'abcd'
  controller: RichEditorController = new RichEditorController();
  @State onWillChangeCallback: boolean = false;
  @State replacedSpansCallback: boolean = false;
  @State onDidChangeCallback: boolean = false;

  build() {

    Column() {

      Text('onWillChange_callback:' + this.onWillChangeCallback).id('onWillChange_callback')
      Text('replacedSpans_callback:' + this.replacedSpansCallback).id('replacedSpans_callback')
      Text('onDidChange_callback:' + this.onDidChangeCallback).id('onDidChange_callback')

      RichEditor({ controller: this.controller })
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('abc',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue) => {
          console.log('RichEditorController：onWillChange')
          this.onWillChangeCallback = true;
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController：replacedSpans');
            console.log('RichEditorController item:' + JSON.stringify(item));
            console.log('RichEditorController spanPosition spanIndex:' + JSON.stringify(item.spanPosition.spanIndex));
            this.replacedSpansCallback = true;
            console.log('RichEditorController replacedSpans value:' + item.value);
            console.log('RichEditorController replacedSpans value length:' + item.value.length);
          })
          return true;
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
          this.onDidChangeCallback = true;
          console.log('RichEditorController onDidChange rangeBefore:' + JSON.stringify(rangeBefore));
          console.log('RichEditorController onDidChange rangeAfter:' + JSON.stringify(rangeAfter));
        })
        .onCut((event: CutEvent) => {
          event.preventDefault!();
          console.log('RichEditorController：onCut');
        })
        .onCopy(() => {
          console.log('RichEditorController：onCopy');
        })
        .onPaste(() => {
          console.log('RichEditorController：onPaste');
        })
        .id('rich_struct')

      Button('int callback status')
        .onClick(() => {
          this.onWillChangeCallback = false;
          this.replacedSpansCallback = false;
          this.onDidChangeCallback = false;
        }).id('int_callback_status')
    }
  }
}