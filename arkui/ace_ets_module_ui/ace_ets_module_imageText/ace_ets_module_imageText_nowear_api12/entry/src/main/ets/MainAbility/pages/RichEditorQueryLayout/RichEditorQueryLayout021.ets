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
struct RichEditorQueryLayout021 {
  controller: RichEditorController = new RichEditorController();
  @State layoutStyle: string = '';
  @State paragraphStyle: string = '';

  build() {

    Column() {

      Text('layoutStyle:' + this.layoutStyle).id('layoutStyle')
      Text('paragraphStyle:' + this.paragraphStyle).id('paragraphStyle')

      Button('getSelection').onClick(() => {
        this.controller.setSelection(-1, -1);
        let selection = this.controller.getSelection();
        selection.spans.forEach(item => {
          if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
            if (typeof ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)['layoutStyle'] !=
              'undefined') {
              this.layoutStyle =
                JSON.stringify(((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)
                  .layoutStyle);
              console.log('RichEditorController this.layoutStyle:' + this.layoutStyle);
            }
          } else {
            if (typeof (item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
              console.log('RichEditorController get content get symbolSpanStyle');
            } else {
              this.paragraphStyle += JSON.stringify((item as RichEditorTextSpanResult).paragraphStyle);
              console.log('RichEditorController this.paragraphStyle:' + this.paragraphStyle);
            }
          }
        })
      }).id('get_content')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('0123', {
            style: {
              fontColor: Color.Pink,
              fontSize: '32',
            },
            paragraphStyle: {
              textAlign: TextAlign.End,
              leadingMargin: 16
            }
          })

          this.controller.addImageSpan($r('app.media.app_icon'), {
            imageStyle: {
              size: ['80px', '80px'],
              layoutStyle: {
                borderRadius: '50px',
                margin: '40px'
              }
            }
          })
        })
        .id('rich_struct')

    }
  }
}