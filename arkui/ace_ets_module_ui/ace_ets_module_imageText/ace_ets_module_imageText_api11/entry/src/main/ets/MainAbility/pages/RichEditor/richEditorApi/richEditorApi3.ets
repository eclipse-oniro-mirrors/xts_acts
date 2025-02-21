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
struct richEditorApi3 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: string = '';

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {

        })
        .borderWidth(1)
        .width('100%')
        .height(200)
      Button('addTextSpan').onClick((event: ClickEvent) => {
        this.controller.addTextSpan('1023456789\n',{
          style:{
            fontColor:Color.Pink,
            fontSize:"32"
          },
          paragraphStyle:{
            textAlign:TextAlign.Start,
            leadingMargin:16
          }
        })
      }).height(100).id('richEditorApi3_btn1')
      Button('get').onClick(() => {
        this.controller.getParagraphs({ start: -1, end: -1 }).forEach((item) => {
          this.text1  +=  JSON.stringify((item as RichEditorParagraphResult).style)
        })
      }).height(100).id('richEditorApi3_btn2')

      Text('' + this.text1).key('richEditorApi3_text1')
    }
    .width('100%').height('100%')
  }

}