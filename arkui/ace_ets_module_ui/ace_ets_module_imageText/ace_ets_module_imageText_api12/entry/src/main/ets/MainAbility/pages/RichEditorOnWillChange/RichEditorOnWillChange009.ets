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
struct RichEditorOnWillChange009 {
  controller: RichEditorController = new RichEditorController();
  @State onWillChangeCallback: boolean = false;
  @State replacedSpansCallback: boolean = false;
  @State onDidChangeCallback: boolean = false;
  @State rangeText: string = '';
  @State replaceText: string = '';

  build() {

    Column() {

      Text('onWillChange_callback:' + this.onWillChangeCallback).id('onWillChange_callback')
      Text('replacedSpans_callback:' + this.replacedSpansCallback).id('replacedSpans_callback')
      Text('onDidChange_callback:' + this.onDidChangeCallback).id('onDidChange_callback')
      Text('range_text:' + this.rangeText).id('range_text')
      Text('replace_text:' + this.replaceText).id('replace_text')


      Button('setTypingStyle insert').onClick(() => {
        this.controller.setTypingStyle(
          {
            fontWeight: 'medium',
            fontFamily: 'MiSans-Bold',
            fontColor: Color.Blue,
            fontSize: 50,
            fontStyle: FontStyle.Italic,
            decoration: { type: TextDecorationType.Underline, color: Color.Green }
          })
        this.controller.setCaretOffset(this.controller.getCaretOffset() - 3)

      }).id('set_style')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
          this.controller.addTextSpan('abc',
            {
              style:
              {
                fontColor: Color.Red,
                fontSize: 20
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
            this.replaceText = item.value;
            console.log('RichEditorController replacedSpans value:' + item.value);
            console.log('RichEditorController replacedSpans value length:' + item.value.length);
          })
          return true;
        })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          value.richEditorDeleteSpans.forEach(item => {
            console.log('RichEditorController aboutToDelete spanIndex:' + item.spanPosition.spanIndex);
          })
          return true;
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
          this.onDidChangeCallback = true;
          console.log('RichEditorController onDidChange rangeBefore:' + JSON.stringify(rangeBefore));
          console.log('RichEditorController onDidChange rangeAfter:' + JSON.stringify(rangeAfter));
          this.rangeText = JSON.stringify(rangeBefore) + JSON.stringify(rangeAfter);
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