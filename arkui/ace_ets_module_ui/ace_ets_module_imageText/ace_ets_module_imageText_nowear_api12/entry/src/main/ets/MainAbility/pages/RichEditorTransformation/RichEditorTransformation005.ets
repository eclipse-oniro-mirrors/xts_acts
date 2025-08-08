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
struct RichEditorTransformation005 {
  controller: RichEditorController = new RichEditorController();
  @State textStyle: string = '';
  @State length: number = -1;
  private myOffset: number | undefined = undefined
  private myBuilder: CustomBuilder = undefined

  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom').fontSize(10)
    }.width(100).height(50).padding(5)
  }
  build() {

    Column() {
      Button('setTypingStyle')
        .fontSize(10)
        .onClick(() => {
          this.controller.setTypingStyle(
            {
              fontWeight: FontWeight.Lighter,
              fontFamily: 'Arial',
              fontColor: Color.Green,
              fontSize: '30',
              fontStyle: FontStyle.Italic,
              decoration: { type: TextDecorationType.Underline, color: Color.Orange }
            })
        }).id('setTypingStyle')
      Button('getTypingStyle').onClick(() => {
        let richEditorTextStyle = this.controller.getTypingStyle();
        this.textStyle = JSON.stringify(richEditorTextStyle);
        console.log('RichEditor getTypingStyle:' + JSON.stringify(richEditorTextStyle));
      }).id('getTypingStyle')
      Text('textStyle:' + this.textStyle).id('textStyle')
      Text('length:' + this.length).id('length')
      Button('get length').onClick(() => {
        this.length = this.controller.getCaretOffset();
      }).id('getLength')
      RichEditor({ controller: this.controller })
        .width(200)
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          this.controller.addTextSpan('\uD83D\uDE00 abc',
            {
              style:
              {
                fontSize: 30,
                fontColor: Color.Red
              }
            })
          this.controller.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['25px', '25px']
              }
            })
          this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
                fontSize: 20
              }
            })
          this.myBuilder = () => {
            this.placeholderBuilder();
          }
          this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset });
        })
        .rotate({
          angle: 100
        })
        .translate({ x: 50, y: 10 })
        .scale({ x: 2, y: 0.5 })
        .borderColor(Color.Green)
        .width(200)
        .height(200)
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorTransformation005')
    }
  }
}