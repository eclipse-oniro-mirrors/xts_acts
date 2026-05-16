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
struct RichEditorLineBreakStrategy003 {
  controller: RichEditorController = new RichEditorController();
  @State attributeValue: string = ''
  @State lineBreakOptionStr: string[] = ['GREEDY', 'HIGH_QUALITY', 'BALANCED']
  build() {

    Column() {
      Column(){
        Text('linebreak attributeValue:' + this.attributeValue).fontSize(20).fontColor(Color.Black).id('attributeValue')
      }.margin({bottom: 10})

      Button('get linebreak attributeValue').onClick(() => {
        let spanParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })
        console.log('RichEditor getParagraphs:' + JSON.stringify(spanParagraphs))
        spanParagraphs.forEach(item => {
          if(typeof(item as RichEditorParagraphResult)['style'] != 'undefined'){
            this.attributeValue = ''
            console.info('lineBreakStrategy:'+ JSON.stringify((item as RichEditorParagraphResult)['style']))
            this.attributeValue += this.lineBreakOptionStr[Number((item as RichEditorParagraphResult)['style'].lineBreakStrategy)];
          }
        })
      }).id('getAttr')

      Button('updateParagraphStyle').onClick(() => {
        this.controller.updateParagraphStyle({ start: -1, end: -1,
          style: {
            textAlign: TextAlign.Center,
          }
        })
      }).id('updateParagraphStyle')

      Button('updateQuality').onClick(() => {
        this.controller.updateParagraphStyle({ start: -1, end: -1,
          style: {
            lineBreakStrategy: LineBreakStrategy.HIGH_QUALITY,
          }
        })
      }).id('updateQuality')

      Button('update -1').onClick(() => {
        this.controller.updateParagraphStyle({ start: -1, end: -1,
          style: {
            lineBreakStrategy: -1,
          }
        })
      }).id('updateGreedy')

      RichEditor({ controller: this.controller })
        .height(400)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(300)
        .onReady(() => {
          this.controller.addTextSpan('0123456789,0123456789,0123456789,0123456789,0123456789.',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 32
              },
              paragraphStyle:
              {
                lineBreakStrategy: -1
              }
            })
        })
        .id('RichEditorLineBreakStrategy003')

    }
  }
}