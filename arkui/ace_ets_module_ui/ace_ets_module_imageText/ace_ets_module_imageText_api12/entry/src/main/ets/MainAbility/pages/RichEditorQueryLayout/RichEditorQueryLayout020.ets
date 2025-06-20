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
struct RichEditorQueryLayout020 {
  controller: RichEditorController = new RichEditorController();
  @State delLayoutStyle: string = '';
  @State paragraphStyle: string = '';

  build() {

    Column() {

      Text('delLayoutStyle:' + this.delLayoutStyle).id('delLayoutStyle')
      Text('paragraphStyle:' + this.paragraphStyle).id('paragraphStyle')

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
              textAlign: TextAlign.Start,
              leadingMargin: 20
            }
          })

          this.controller.addImageSpan($r('app.media.app_icon'), {
            imageStyle: {
              size: ['20px', '20px'],
              layoutStyle: {
                borderRadius: '10px',
                margin: '21px'
              }
            }
          })
        })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          value.richEditorDeleteSpans.forEach(item => {
            if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
              this.delLayoutStyle = JSON.stringify(((item as RichEditorImageSpanResult).imageStyle))
              console.log('RichEditorController image:' + (item as RichEditorImageSpanResult).valueResourceStr)
            } else {
              console.log('RichEditorController text item:' + JSON.stringify((item)));
              this.paragraphStyle = JSON.stringify(((item as RichEditorTextSpanResult).paragraphStyle));
              console.log('RichEditorController text:' + (item as RichEditorTextSpanResult).value)
            }
          })
          return true;
        })
        .id('rich_struct')

    }
  }
}