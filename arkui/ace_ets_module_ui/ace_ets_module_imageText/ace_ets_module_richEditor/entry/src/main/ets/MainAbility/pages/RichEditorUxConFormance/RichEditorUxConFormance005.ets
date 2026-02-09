/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
struct RichEditorUxConFormance005 {
  controller: RichEditorController = new RichEditorController();
  @State spanInfo: string = '';
  private content: string = '';
  build() {

    Column() {
      Text('spanInfo:' + this.spanInfo).id('spanInfo').height('5%')

      Row(){
        Button('updateSpanStyle').onClick(() => {
          console.log('RichEditorController updateSpanStyle');
          this.controller.updateSpanStyle({
            start: 0,
            end: this.controller.getCaretOffset(),
            textStyle:
            {
              fontSize: -1
            }
          })
        }).id('updateSpanStyle').width('50%')

        Button('get spans').onClick(() => {
          this.content = '';
          this.controller.getSpans({
            start: 0,
            end: this.controller.getCaretOffset()
          }).forEach(item => {
            if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
              this.content += (item as RichEditorImageSpanResult).valueResourceStr;
              if (typeof ((item as RichEditorImageSpanResult).imageStyle as RichEditorImageSpanStyleResult)['layoutStyle'] !=
                'undefined') {
                console.log('RichEditorController get imageStyle');
              }
              this.content += '\n'
            } else {
              if (typeof (item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                this.content += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
                this.content += '\n'
              } else {
                console.log('RichEditorController textStyle:' + JSON.stringify((item as RichEditorTextSpanResult).textStyle));
                this.spanInfo = JSON.stringify((item as RichEditorTextSpanResult).textStyle);
                this.content += (item as RichEditorTextSpanResult).value;
                this.content += '\n'
              }
            }
          })
        }).id('get_spans').width('50%')
      }.height('5%')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('01ab测试AB@#$%',
            {
              style:
              {
                fontSize: 0
              }
            })
        })
        .id('RichEditorUxConFormance005')

    }
    .height('100%')
  }
}