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
struct RichEditorAttributeStrings001 {

  @State spans: string = '';
  @State finalSpans: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

  controller1: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };


  build() {
    Column() {
      Row(){
        Button('get spans').onClick(() => {
          this.controller1.getSpans({
            start: 0,
            end: 8
          }).forEach(item => {
            this.spans += (item as RichEditorTextSpanResult).value + '\n';
          })
        }).id('getSpans').width('25%')
        Button('get final Spans').onClick(() => {
          this.finalSpans = '';
          this.controller1.getSpans({
            start: 0,
            end: 16
          }).forEach(item => {
            this.finalSpans += (item as RichEditorTextSpanResult).value;
          })
        }).id('getFinalSpans').width('25%')
        Button('set center').onClick(() => {
          this.controller1.setCaretOffset(1);
        }).id('setCenter').width('25%')
        Button('set start').onClick(() => {
          this.controller1.setCaretOffset(0);
        }).id('setStart').width('25%')
      }.height('5%')
      Row(){
        Text('Spans:' + this.spans).id('Spans').width('50%')
        Text('finalSpans:' + this.finalSpans).id('finalSpans').width('50%')
      }.height('5%')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings001')

      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('0123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings001_1')
    }.height('90%')
  }
}