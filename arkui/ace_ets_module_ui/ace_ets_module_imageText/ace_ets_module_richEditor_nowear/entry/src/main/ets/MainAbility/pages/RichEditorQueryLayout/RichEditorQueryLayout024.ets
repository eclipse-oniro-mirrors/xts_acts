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
struct RichEditorQueryLayout024 {
  controller: RichEditorController = new RichEditorController();
  @State selectValue: string = '';

  build() {

    Column() {

      Text('selectValue:' + this.selectValue).id('selectValue')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('01', {
            style: {
              fontColor: Color.Pink,
              fontSize: '32',
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 16
            }
          })

          this.controller.addImageSpan($r('app.media.app_icon'), {
            imageStyle: {
              size: ['40px', '40px'],
              layoutStyle: {
                borderRadius: '20px',
                margin: '30px'
              }
            }
          })

        })
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          console.log('RichEditorController onIMEInputComplete value:' + value.value);
        })
        .onSelect((value: RichEditorSelection) => {
          this.selectValue = JSON.stringify(value);
          console.info('RichEditorController onSelect='+JSON.stringify(value))
        })
        .id('rich_struct')

    }
  }
}