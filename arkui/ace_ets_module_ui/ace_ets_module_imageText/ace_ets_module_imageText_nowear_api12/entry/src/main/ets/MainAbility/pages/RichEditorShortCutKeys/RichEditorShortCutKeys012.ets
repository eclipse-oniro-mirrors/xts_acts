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
struct RichEditorShortCutKeys012 {
  controller: RichEditorController = new RichEditorController();
  @State style: string = '';
  build() {

    Column() {

      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(300)
        .width(300)
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          this.controller.addTextSpan('This is ss01 on :' + '0000' + '\n', {
            style: {
              fontSize: 35,
              fontWeight: FontWeight.Bolder,
              fontColor: Color.Red,
              fontFamily: Utils.FONT_FAMILY,
              fontStyle: FontStyle.Italic,
              decoration: { type: TextDecorationType.None, color: '#FF000000', style: TextDecorationStyle.SOLID },
              lineHeight: 30,
              letterSpacing: 30,
              fontFeature: '\'ss01\' 1'
            }
          });
            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['25px', '25px']
                }
              });
        })
        .id('RichEditorShortCutKeys012')

      Button('get spans').onClick(() => {
        this.style = '';
        this.controller.getSpans({
          start: 0,
          end: 6
        }).forEach(item => {
          this.style = JSON.stringify(item);
          console.log('RichEditorController  this.style:' +  JSON.stringify(this.style));
        })
      }).id('getSpans')

      Text('style:' + this.style).id('style')
    }
  }
}