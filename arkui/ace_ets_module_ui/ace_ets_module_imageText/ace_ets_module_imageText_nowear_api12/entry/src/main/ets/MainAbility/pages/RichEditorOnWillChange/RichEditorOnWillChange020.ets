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
struct RichEditorOnWillChange020 {
  controller: RichEditorController = new RichEditorController();
  @State onWillChangeCallback: boolean = false;
  @State replacedSpansCallback: boolean = false;
  @State onDidChangeCallback: boolean = false;
  @State spanIndex: string = '';
  @State replacedSpansCallbackInfo: string = '';
  @State onWillChangeRangeBefore: string = '';
  @State onDidChangeRangeBefore: string = '';
  @State onDidRangeAfter: string = '';

  build() {

    Column() {
      Row(){
        Text('onWillChange_callback:' + this.onWillChangeCallback).id('onWillChange_callback').width('25%').clip(true)
        Text('replacedSpans_callback:' + this.replacedSpansCallback).id('replacedSpans_callback').width('25%').clip(true)
        Text('onDidChange_callback:' + this.onDidChangeCallback).id('onDidChange_callback').width('25%').clip(true)
        Text('onDidChange rangeBefore:' + this.onDidChangeRangeBefore).id('onDidChange_rangeBefore').width('25%').clip(true)
      }.height('5%')
      Row(){
        Text('onWillChange_rangeBefore:' + this.onWillChangeRangeBefore).id('onWillChange_rangeBefore').width('30%').clip(true)
        Text('replacedSpans Callback:' + this.replacedSpansCallbackInfo).id('replacedSpansCallback').width('30%').clip(true)
        Text('ondid rangeAfter:' + this.onDidRangeAfter).id('ondid_rangeAfter').width('30%').clip(true)
      }.height('5%')
      Button('光标定位').onClick(() => {
        this.controller.setCaretOffset(this.controller.getCaretOffset() - 1);
      }).id('back').height('5%')
      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('1234',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue) => {
          console.log('RichEditorController：onWillChange');
          console.log('RichEditorController：value' + JSON.stringify(value));
          this.onWillChangeRangeBefore = JSON.stringify(value.rangeBefore);
          this.onWillChangeCallback = true;
          this.replacedSpansCallbackInfo = JSON.stringify(value.replacedSpans);
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController：replacedSpans');
            console.log('RichEditorController item:' + JSON.stringify(item));
            console.log('RichEditorController spanPosition spanIndex:' + JSON.stringify(item.spanPosition.spanIndex));
            this.spanIndex = JSON.stringify(item.spanPosition.spanIndex);
            this.replacedSpansCallback = true;
            console.log('RichEditorController replacedSpans value:' + item.value);
            console.log('RichEditorController replacedSpans value length:' + item.value.length);
          })
          return true;
        })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          value.richEditorDeleteSpans.forEach(item => {
            console.log('RichEditorController aboutToDelete spanIndex:' + item.spanPosition.spanIndex);
            this.spanIndex = item.spanPosition.spanIndex + '';
          })
          return true;
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
          this.onDidChangeCallback = true;
          console.log('RichEditorController onDidChange rangeBefore:' + JSON.stringify(rangeBefore));
          this.onDidChangeRangeBefore = JSON.stringify(rangeBefore);
          console.log('RichEditorController onDidChange rangeAfter:' + JSON.stringify(rangeAfter));
          this.onDidRangeAfter = JSON.stringify(rangeAfter);
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