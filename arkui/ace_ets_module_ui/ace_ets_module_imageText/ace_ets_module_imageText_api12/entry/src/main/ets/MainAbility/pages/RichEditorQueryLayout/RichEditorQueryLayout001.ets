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
struct RichEditorQueryLayout001 {
  controller: RichEditorController = new RichEditorController();
  @State content: string = ''

  build() {

    Column() {

      Text('content:' + this.content).id('content')

      Button('get content').onClick(() => {
        this.content = '';
        this.controller.getSpans({
          start: 0,
          end: 3
        }).forEach(item => {
          if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
            this.content += (item as RichEditorImageSpanResult).valueResourceStr;
            if (typeof ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)['layoutStyle'] !=
              'undefined') {
              console.log('get content get imageStyle');
              ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)
                .layoutStyle;
            }
            this.content += '\n'
          } else {
            if (typeof (item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
              console.log('get content get symbolSpanStyle');
              this.content += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
              this.content += '\n'
            } else {
              console.log('get content no layoutStyle');
              this.content += (item as RichEditorTextSpanResult).value;
              this.content += '\n'
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

        })
        .id('rich_struct')

    }
  }
}