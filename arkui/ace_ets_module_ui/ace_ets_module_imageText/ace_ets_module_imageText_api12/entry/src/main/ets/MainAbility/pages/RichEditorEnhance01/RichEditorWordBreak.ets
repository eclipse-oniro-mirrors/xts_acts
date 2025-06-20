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
struct RichEditorWordBreak {
  controller: RichEditorController = new RichEditorController();
  private spanParagraphs: RichEditorParagraphResult[] = [];
  @State wordBreakOptionStr: string[] = ['NORMAL', 'BREAK_ALL', 'BREAK_WORD']
  @State index: number = 2
  @State content: string = ''

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .onReady(() => {
          this.controller.addTextSpan('This is used to test the ability of rich text WordBreak tewtrtewrrwrewr3ewtesttesttesttesttesttesttesttest test', {
            style: {
              fontColor: Color.Pink,
              fontSize: 10,
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 16,
              wordBreak: WordBreak.BREAK_WORD
            }
          })
        })
        .width('100%')
        .height('25%')
        .border({ width: 1, radius: 5 })
        .draggable(false)
        .clip(false)
        .margin({ bottom: 20 })

      Row(){
        Text('getParagraphs获取到的wordBreak为：').fontSize(10)
        Text(this.content).id('RichEditorWordBreakValue_' + this.content).fontSize(10).fontColor(Color.Green)
      }.margin({ bottom: 20 })

      Column({ space: 10 }) {
        Button('BREAK_WORD')
          .id('RichEditorWordBreak_BREAK_WORD')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                wordBreak: WordBreak.BREAK_WORD
              }
            })
          }).height('5%')
        Button('NORMAL')
          .id('RichEditorWordBreak_NORMAL')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                wordBreak: WordBreak.NORMAL
              }
            })
          }).height('5%')
        Button('BREAK_ALL')
          .id('RichEditorWordBreak_BREAK_ALL')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                wordBreak: WordBreak.BREAK_ALL
              }
            })
          }).height('5%')
        Button('getParagraphs')
          .id('RichEditorWordBreak_getParagraphs')
          .onClick(() => {
            this.spanParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })
            console.log('RichEditor getParagraphs:' + JSON.stringify(this.spanParagraphs))
            this.spanParagraphs.forEach(item => {
              if(typeof(item as RichEditorParagraphResult)['style'] != 'undefined'){
                this.content = ''
                this.content += this.wordBreakOptionStr[Number((item as RichEditorParagraphResult)['style'].wordBreak)];
              }
            })
          })
          .height('5%')
      }
    }
  }
}