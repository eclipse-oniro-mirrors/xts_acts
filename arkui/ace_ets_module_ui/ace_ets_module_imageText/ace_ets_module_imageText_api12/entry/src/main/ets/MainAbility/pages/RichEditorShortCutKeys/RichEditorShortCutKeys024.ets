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
struct RichEditorShortCutKeys024 {
  controller: RichEditorController = new RichEditorController();
  @State carePosition: string = '';
  private myOffset: number | undefined = undefined;
  private myBuilder: CustomBuilder = undefined;

  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom Popup').fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build() {

    Column() {
      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(200)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          this.controller.addTextSpan('12', {
            style: {
              fontSize: 35,
              fontWeight: FontWeight.Bolder,
              fontColor: Color.Red,
              fontFamily: Utils.FONT_FAMILY,
              fontStyle: FontStyle.Italic
            }
          });
          this.controller.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['25px', '25px']
              }
            });
          this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
                fontSize: 30
              }
            })

          this.controller.addTextSpan('ab', {
            style: {
              fontSize: 35,
              fontWeight: FontWeight.Bolder,
              fontColor: Color.Red,
              fontFamily: Utils.FONT_FAMILY,
              fontStyle: FontStyle.Italic
            }
          });
        })
        .id('RichEditorShortCutKeys024')

      Button('get position').onClick(() => {
        this.carePosition = this.controller.getCaretOffset() + '';
      }).id('getPosition')
      Button('set position').onClick(() => {
        this.controller.setCaretOffset(3);
      }).id('setPosition')
      Button('builder').onClick(() => {
        this.myBuilder = () => {
          this.placeholderBuilder();
        }
        let num = this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset });
        console.info('addBuilderSpan return ' + num);
      }).id('builder')
      Text('carePosition:' + this.carePosition).id('carePosition')
    }
  }
}