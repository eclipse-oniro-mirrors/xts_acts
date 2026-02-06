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

import LeadingMarginCreator from '../../common/LeadingMarginCreator'

@Entry
@Component
struct RichEditorQueryLayout011 {
  controller: RichEditorController = new RichEditorController();
  private leadingMarkCreatorInstance = LeadingMarginCreator.instance
  @State style: string = ''
  leadingMargin: Dimension = '10%'

  build() {

    Column() {
      Text('style:' + this.style).id('style').height('5%').clip(true)
      Button('get spans').onClick(() => {
        this.style = '';
        this.controller.getSpans({
          start: 0,
          end: 6
        }).forEach(item => {
          if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
            this.style += (item as RichEditorImageSpanResult).valueResourceStr;
            if (typeof ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)['layoutStyle'] !=
              'undefined') {
              this.style =
                JSON.stringify(((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)
                  .layoutStyle);
            }
            this.style += '\n'
          } else {
            if (typeof (item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
              console.log('get content get symbolSpanStyle');
              this.style += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
              this.style += '\n'
            } else {
              this.style += JSON.stringify((item as RichEditorTextSpanResult).paragraphStyle);
            }
          }
        })
      }).id('get_content').height('5%')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('01234567', {
            style: {
              fontColor: Color.Pink,
              fontSize: '32',
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: {
                pixelMap: this.leadingMarkCreatorInstance.genCircleMark(100, 40, 1),
                size: [this.leadingMargin, this.leadingMargin]
              }
            }
          })
        })
        .id('rich_struct')
    }
  }
}