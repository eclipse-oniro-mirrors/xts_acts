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
struct RichEditorAttributeStrings003 {

  @State spans: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };


  build() {
    Column() {

      Button('get spans').onClick(() => {
        this.controller.getSpans({
          start: 0,
          end: 9
        }).forEach(item => {
          this.spans += (item as RichEditorTextSpanResult).value + '\n';
        })
      }).id('getSpans')

      Button('set care').onClick(() => {
        this.controller.setSelection(1, 3);
      }).id('setCare')


      Text('Spans:' + this.spans).id('Spans')


      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('0123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
          this.controller.addTextSpan('abc',
            {
              style:
              {
                fontColor: Color.Red,
                fontSize: 40,
                textShadow: { radius: 10, color: Color.Green, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings003')
    }
  }
}