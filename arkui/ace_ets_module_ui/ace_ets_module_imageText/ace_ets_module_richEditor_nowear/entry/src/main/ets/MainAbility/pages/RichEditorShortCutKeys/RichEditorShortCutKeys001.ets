/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
struct RichEditorShortCutKeys001 {
  controller1: RichEditorController = new RichEditorController();
  controller: RichEditorController = new RichEditorController();
  @State finalText: string = '';
  build() {

    Column() {
      Text('finalText:' + this.finalText).id('finalText').height('5%').clip(true)
      Button('select')
        .id('select')
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller1.setSelection(1, 3, options);
        }).height('5%')

      RichEditor({ controller: this.controller1 })
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller1.addTextSpan('1234567',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20
              }
            })
        })
        .id('RichEditor')

      RichEditor({ controller: this.controller })
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('abcd',
            {
              style:
              {
                fontColor: Color.Red,
                fontSize: 20
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue) => {
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController item:' + JSON.stringify(item.value));
            this.finalText = JSON.stringify(item.value);
          })
          console.log('print replacedImageSpans')
          value.replacedImageSpans.forEach((item: RichEditorImageSpanResult) => {
            console.log('RichEditorController imageStyle:' + JSON.stringify(item.imageStyle))
            console.log('RichEditorController offsetInSpan:' + item.offsetInSpan)
          })
          value.replacedSymbolSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController symbolSpanStyle:' + JSON.stringify(item.symbolSpanStyle))
            console.log('RichEditorController paragraphStyle:' + JSON.stringify(item.paragraphStyle))
          })
          return true
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorShortCutKeys001')

    }
  }
}