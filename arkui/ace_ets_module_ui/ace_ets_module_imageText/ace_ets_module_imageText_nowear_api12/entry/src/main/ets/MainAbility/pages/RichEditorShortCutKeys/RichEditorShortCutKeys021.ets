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
struct RichEditorShortCutKeys021 {
  controller: RichEditorController = new RichEditorController();
  @State style: string = '';
  build() {

    Column() {
      Row(){
        Button('add text').onClick(() => {
          this.controller.addTextSpan('    ', {
            style: {
              fontSize: 35,
              fontWeight: FontWeight.Bolder,
              fontColor: Color.Red,
              fontFamily: Utils.FONT_FAMILY,
              fontStyle: FontStyle.Italic,
              decoration: { type: TextDecorationType.LineThrough, color: Color.Black, style: TextDecorationStyle.SOLID }
            }
          });
        }).id('addText').width('50%')
        Button('get spans').onClick(() => {
          this.style = '';
          this.controller.getSpans({
            start: 0,
            end: 4
          }).forEach(item => {
            this.style = JSON.stringify((item as RichEditorTextSpanResult));
            console.log('RichEditorController  this.style:' +  JSON.stringify(this.style));
          })
        }).id('getSpans').width('50%')
      }.height('5%')
      Text('style:' + this.style).id('style').height('5%').clip(true)
      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(200)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
        })
        .placeholder('input...', {
          fontColor: Color.Gray,
          font: {
            size: 16,
            weight: FontWeight.Normal,
            style: FontStyle.Normal
          }
        })
        .id('RichEditorShortCutKeys021')
    }
  }
}