/*
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
struct RichEditorApi3 {
  controller: RichEditorController = new RichEditorController();
  @State testStr: string = "0123456789,0123456789,0123456789,0123456789,0123456789."
  private spanParagraphs: RichEditorParagraphResult[] = [];
  @State attributeValue: string = ""

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .onReady(() => {
          this.controller.addTextSpan(this.testStr, {
            style: {
              fontColor: Color.Black,
              fontSize: "32",
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              lineBreakStrategy: LineBreakStrategy.GREEDY
            }
          })
        })
        .width(400)
        .height(300)
        .margin({bottom:20})
        .draggable(false)

      Text(this.attributeValue == '0' ? 'LineBreakStrategy.GREEDY' : '').id('RichEditorApi3_text1')
      Button('获取linebreak属性值').onClick(() => {
        this.spanParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })
        this.spanParagraphs.forEach(item => {
          if(typeof(item as RichEditorParagraphResult)['style'] != 'undefined'){
            console.info('lineBreakStrategy:'+ JSON.stringify((item as RichEditorParagraphResult)['style']))
            this.attributeValue = JSON.stringify((item as RichEditorParagraphResult)['style'].lineBreakStrategy)
          }
        })
      }).id('RichEditorApi3_btn1')

    }
  }
}