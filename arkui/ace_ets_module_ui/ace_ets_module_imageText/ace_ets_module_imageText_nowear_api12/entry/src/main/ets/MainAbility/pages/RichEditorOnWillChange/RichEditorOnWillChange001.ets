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
struct RichEditorOnWillChange001 {
  controller: RichEditorController = new RichEditorController();
  @State onWillChangeCallback: boolean = false;
  @State replacedSpansCallback: boolean = false;
  @State onDidChangeCallback: boolean = false;
  @State rangeAfterEmoji: string = '';
  @State replacedSpansCallbackInfo: string = '';
  @State onDidChangeRangeBefore: string = '';
  @State onWillChangeRangeBefore: string = '';

  build() {

    Column() {

      Text('onWillChange_callback:' + this.onWillChangeCallback).id('onWillChange_callback').height('5%').clip(true)
      Text('replacedSpans_callback:' + this.replacedSpansCallback).id('replacedSpans_callback').height('5%').clip(true)
      Text('onDidChange_callback:' + this.onDidChangeCallback).id('onDidChange_callback').height('5%').clip(true)
      Text('onWillChange_rangeBefore:' + this.onWillChangeRangeBefore).id('onWillChange_rangeBefore').height('5%').clip(true)
      Text('onDidChange_rangeBefore:' + this.onDidChangeRangeBefore).id('onDidChange_rangeBefore').height('5%').clip(true)
      Text('rangeAfter_emoji:' + this.rangeAfterEmoji).id('rangeAfter_emoji').height('5%').clip(true)
      Text('replacedSpans Callback:' + this.replacedSpansCallbackInfo).id('replacedSpansCallback').height('5%').clip(true)

      Button('add emoji').onClick(() => {
        this.controller.addTextSpan('\uD83D\uDE00',
          {
            style:
            {
              fontColor: Color.Orange,
              fontSize: 30
            }
          })
      }).id('add_emoji')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {

        })
        .onWillChange((value: RichEditorChangeValue) => {
          console.log('RichEditorController：onWillChange')
          console.log('RichEditorController：value' + JSON.stringify(value));
          this.onWillChangeRangeBefore = JSON.stringify(value.rangeBefore);
          this.onWillChangeCallback = true;
          this.replacedSpansCallbackInfo = JSON.stringify(value.replacedSpans);
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController：replacedSpans')
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
          this.onDidChangeRangeBefore = JSON.stringify(rangeBefore);
          this.rangeAfterEmoji = JSON.stringify(rangeAfter);
        })
        .onCut((event: CutEvent) => {
          event.preventDefault!()
          console.log('RichEditorController：onCut');
        })
        .onCopy((event: CopyEvent) => {
          event.preventDefault!()
          console.log('RichEditorController：onCopy');
        })
        .onPaste(() => {
          console.log('RichEditorController：onPaste');
        })
        .id('rich_struct')

    }
  }
}