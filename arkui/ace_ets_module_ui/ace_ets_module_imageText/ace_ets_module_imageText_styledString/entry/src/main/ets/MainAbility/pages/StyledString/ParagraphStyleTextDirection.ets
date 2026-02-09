/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  @State paragraphStyleVlaue: ParagraphStyle = {
    textDirection: TextDirection.LTR,
  }
  @State paragraphStyleInterfaceVlaue: ParagraphStyleInterface = {
    textDirection: TextDirection.DEFAULT,
  }
  @State content: string = ''

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .onReady(() => {
          this.controller.addTextSpan('paragraphStyle TextDirection', {
            style: {
              fontColor: Color.Pink,
              fontSize: 10,
            },
            paragraphStyle: this.paragraphStyleVlaue
          })
        })
        .width('100%')
        .height('5%')
        .border({ width: 1, radius: 5 })
        .margin({ top: 10 })

      Row(){
        Text('getParagraphs textDirection：').fontSize(10)
        Text(this.content).id('StyledString_textDirection_' + this.content).fontSize(10).fontColor(Color.Green)
      }.margin({ bottom: 2 })

      Column({ space: 5 }) {
        Button('TextDirection.AUTO')
          .id('StyledString_textDirection_AUTO')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                textDirection: TextDirection.AUTO
              }
            })
          }).height('5%')
        Button('TextDirection.DEFAULT')
          .id('StyledString_textDirection_DEFAULT')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                textDirection: TextDirection.DEFAULT
              }
            })
          }).height('5%')
        Button('TextDirection.RTL')
          .id('StyledString_textDirection_RTL')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                textDirection: TextDirection.RTL
              }
            })
          }).height('5%')

        Button('undefined')
          .id('StyledString_textDirection_undefined')
          .onClick(() => {
            this.controller.updateParagraphStyle({ start: -1, end: -1,
              style: {
                textDirection: undefined
              }
            })
          }).height('5%')
        
        Button('get textDirection')
          .id('StyledString_textDirection_get')
          .onClick(() => {
            this.spanParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })
            console.log('StyledString getParagraphs:' + JSON.stringify(this.spanParagraphs))
            this.spanParagraphs.forEach(item => {
              if(typeof(item as RichEditorParagraphResult)['style'] != 'undefined'){
                this.content = ''
                this.content += (item as RichEditorParagraphResult)['style'].textDirection;
                AppStorage.setOrCreate('StyledString_textDirection', this.content)
              }
            })
          })
          .height('5%')
      }
    }
  }
}