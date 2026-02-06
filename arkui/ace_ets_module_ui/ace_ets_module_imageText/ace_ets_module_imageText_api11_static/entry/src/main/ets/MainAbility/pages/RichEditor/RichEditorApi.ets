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
  ColumnOptions,
  Button,
  ClickEvent,
  TextAlign,
  RichEditorController,
  RichEditorOptions,
  RichEditorImageSpanResult,
  Text,
  Scroll,
  Color,
  $r,
  Builder,
  Row,
  RichEditorSpanType,
  RichEditorResponseType,
  RowOptions,
  Dimension,
  LeadingMarginPlaceholder
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RichEditorApi {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  controller2: RichEditorController = new RichEditorController();
  options2: RichEditorOptions = { controller: this.controller2 } as RichEditorOptions;
  controller3: RichEditorController = new RichEditorController();
  options3: RichEditorOptions = { controller: this.controller3 } as RichEditorOptions;
  controller4: RichEditorController = new RichEditorController();
  options4: RichEditorOptions = { controller: this.controller4 } as RichEditorOptions;
  @State spanParagraphs: string = '';
  @State text1: string = '';;
  @State text2: string = ''

  @Builder
  placeholderBuilder() {
    Text("hello")
      .borderWidth(1)
      .id('RichEditorApi_text_hello')
  }

  @Builder
  panel() {
    Text("Custom")
      .borderWidth(1)
  }

  @Builder
  panel2() {
    Text("Second")
      .borderWidth(1)
  }

  build() {
    Column({ space: 0 } as ColumnOptions) {

      Text(this.spanParagraphs)
        .id('RichEditorApi_text_spanParagraphs')
        .height('10%').textAlign(TextAlign.Center)


      RichEditor(this.options)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')
        .onReady(() :void=> {
          this.controller.addBuilderSpan(():void => this.placeholderBuilder(), { offset: 0 })
        })
        .id('RichEditorApi_addBuilderSpan').height('10%')

      RichEditor(this.options2)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')
        .onReady(() :void=> {
          this.controller2.addTextSpan('Text', { paragraphStyle: { leadingMargin: '5vp' } })
        })
        .height('10%')


      Row({ space: 0 } as RowOptions) {
        Button("updateParagraphStyle")
          .id('RichEditorApi_btn_updateParagraphStyle')
          .onClick((e:ClickEvent) => {
            this.controller2.updateParagraphStyle({ style: { leadingMargin: '10vp' } })
          })

        Button("getParagraphs")
          .id('RichEditorApi_btn_getParagraphs')
          .onClick((e:ClickEvent) => {
            let getParagraphs = this.controller2.getParagraphs({ start: -1, end: -1 })!

            let textAlign = getParagraphs[0].style.textAlign as TextAlign
            let size = getParagraphs[0].style.leadingMargin
            let range = getParagraphs[0].range
            console.log("===================================== " + JSON.stringify(size));
            AppStorage.setOrCreate<TextAlign>('getParagraphs_textAlign',textAlign)
            AppStorage.setOrCreate<string>('getParagraphs_size', JSON.stringify(size))
            AppStorage.setOrCreate<[int, int]>('getParagraphs_range',range)
            this.spanParagraphs = JSON.stringify(this.controller2.getParagraphs({ start: -1, end: -1 })

            )
          })
      }.height('10%')


      Text(this.text1)
        .id('RichEditorApi_text1').height('10%').textAlign(TextAlign.Center)

      RichEditor(this.options3)
        .id('RichEditorApi_RichEditor3')
        .onReady(() :void=> {
          this.controller3.addTextSpan('文本')
        })
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, RichEditorResponseType.RIGHT_CLICK, {
          onAppear: () => {
            this.text1 = 'CustomMenuAppear'
          }
        })
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, RichEditorResponseType.SELECT)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')
        .height('10%')


      Text(this.text2).id('RichEditorApi_text2').height('10%').textAlign(TextAlign.Center)

      RichEditor(this.options4)
        .id('RichEditorApi_RichEditor4')
        .onReady(() :void=> {
          this.controller4.addTextSpan('paragraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraphparagraph')
        })
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel2, RichEditorResponseType.LONG_PRESS, {
          onAppear: () => {
            this.text2 = 'SecondMenuAppear'
          }
        })
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')
    }.width('100%').height('100%')
  }
}