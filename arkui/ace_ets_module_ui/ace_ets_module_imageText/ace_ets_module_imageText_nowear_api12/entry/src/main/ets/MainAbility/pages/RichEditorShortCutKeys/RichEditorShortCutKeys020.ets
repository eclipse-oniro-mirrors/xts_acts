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

import Utils from '../../common/Utils'

@Entry
@Component
struct RichEditorShortCutKeys020 {
  controller: RichEditorController = new RichEditorController();
  @State style: string = '';
  build() {

    Column() {
      Row(){
        Button('get spans').onClick(() => {
          this.style = '';
          this.controller.getSpans({
            start: 0,
            end: 6
          }).forEach(item => {
            if (typeof (item as RichEditorTextSpanResult)['textStyle'] != 'undefined') {
              let span = item as RichEditorTextSpanResult
              let spanPosition = JSON.stringify(span.spanPosition);
              let value = JSON.stringify(span.value);
              let textStyle = JSON.stringify(span.textStyle);
              this.style += 'spanPosition:' + spanPosition + ',';
              this.style += 'value:' + value + ',';
              this.style += 'textStyle:' + textStyle + ',';
              console.log('RichEditorController  this.style:' +  JSON.stringify(this.style));
            }
          })
        }).id('getSpans').width('50%')

        Button('set select').onClick(() => {
          this.controller.setSelection(3, 5);
        }).id('setSelect').width('50%')
      }.height('5%')
      Text('style:' + this.style).id('style').height('5%').clip(true)

      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(200)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          this.controller.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['25px', '25px']
              }
            });

          this.controller.addTextSpan('abcd', {
            style: {
              fontSize: 35,
              fontWeight: FontWeight.Bolder,
              fontColor: Color.Red,
              fontFamily: Utils.FONT_FAMILY,
              fontStyle: FontStyle.Italic,
              decoration: { type: TextDecorationType.LineThrough, color: Color.Black, style: TextDecorationStyle.SOLID }
            }
          });
        })
        .id('RichEditorShortCutKeys020')
    }
  }
}