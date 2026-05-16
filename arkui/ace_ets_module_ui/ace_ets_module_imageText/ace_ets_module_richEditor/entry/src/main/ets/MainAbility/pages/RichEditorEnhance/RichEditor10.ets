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
struct RichEditor10 {
  controller: RichEditorController = new RichEditorController();
  @State text:number = 0
  @State lineBreakOptionStr: string[] = ['GREEDY', 'HIGH_QUALITY', 'BALANCED']
  build() {
    Column() {
      Text(''+this.lineBreakOptionStr[this.text])
      .id('RichEditor10_Text')
      RichEditor({controller:this.controller})
        .onReady(()=>{
          this.controller.addTextSpan('LineBreakStrategy.BALANCED',{
            paragraphStyle: {
              lineBreakStrategy: LineBreakStrategy.BALANCED
            }
          })
        })
      Button('linebreak').onClick(() => {
        let spanParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })
        spanParagraphs.forEach(item => {
          if(typeof(item as RichEditorParagraphResult)['style'] != 'undefined'){
            console.info('lineBreakStrategy:'+ JSON.stringify((item as RichEditorParagraphResult)['style']))
            this.text = Number((item as RichEditorParagraphResult)['style'].lineBreakStrategy);
          }
        })
      })
    }
    .width('100%')
    .height('100%')
  }
}