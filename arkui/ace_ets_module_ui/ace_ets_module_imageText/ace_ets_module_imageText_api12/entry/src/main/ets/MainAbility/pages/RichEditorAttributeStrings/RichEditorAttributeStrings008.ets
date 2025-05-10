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
struct RichEditorAttributeStrings008 {

  @State spans: string = '';
  @State finalSpans: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  mutableStyledString: MutableStyledString = new MutableStyledString('ab12',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };


  build() {
    Column() {

      Button('get spans').onClick(() => {
        this.spans = this.controller.getStyledString().getString();
      }).id('getSpans')

      Button('get final Spans').onClick(() => {
        this.finalSpans = this.controller.getStyledString().getString();
      }).id('getFinalSpans')

      Button('set end').onClick(() => {
        this.controller.setCaretOffset(12);
      }).id('setEnd')

      Button('set center').onClick(() => {
        this.controller.setCaretOffset(2);
      }).id('setCenter')

      Button('set start').onClick(() => {
        this.controller.setCaretOffset(0);
      }).id('setStart')


      Text('Spans:' + this.spans).id('Spans')
      Text('finalSpans:' + this.finalSpans).id('finalSpans')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings008')

    }
  }
}