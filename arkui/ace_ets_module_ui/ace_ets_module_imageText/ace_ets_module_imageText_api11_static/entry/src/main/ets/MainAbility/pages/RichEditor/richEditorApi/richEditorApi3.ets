'use static';
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
import {
  Entry,
  Component,
  RichEditor,
  Column,
  Button,
  ClickEvent,
  $r,
  TextAlign,
  RichEditorController,
  RichEditorOptions,
  RichEditorParagraphResult,
  Text,
  Color,
  Dimension,
  LeadingMarginPlaceholder
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct richEditorApi3 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State text1: string = '';

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() :void=> {

        })
        .borderWidth(1)
        .width('100%')
        .height('50%')
      Button('addTextSpan').onClick((event: ClickEvent) => {
        console.log("===============================11 ");
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
        console.log("===============================12 ");
      }).height('10%').id('richEditorApi3_btn1')
      Button('get').onClick((event: ClickEvent) => {
        console.log("===============================1 ");
        let getParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })!
        console.log("===============================2 ");
        let textAlign = getParagraphs[0].style.textAlign
        console.log("===============================3 ");
        let size = getParagraphs[0].style.leadingMargin as LeadingMarginPlaceholder
        console.log("===============================4 " + size.size);
        AppStorage.setOrCreate<TextAlign|undefined>('getParagraphs_textAlign',textAlign)
        AppStorage.setOrCreate<string>('getParagraphs_size', JSON.stringify(size))
        console.log("===============================5 ");
        this.controller.getParagraphs({ start: -1, end: -1 })!.forEach((item) => {
          // this.text1  +=  JSON.stringify((item as RichEditorParagraphResult).style)
        })
      }).height('10%').id('richEditorApi3_btn2')

      Text('' + this.text1).key('richEditorApi3_text1').height('10%').textAlign(TextAlign.Center)
    }
    .width('100%').height('100%')
  }

}