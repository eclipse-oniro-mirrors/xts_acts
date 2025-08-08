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
struct RichEditorApi {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  controller2: RichEditorController = new RichEditorController();
  options2: RichEditorOptions = { controller: this.controller2 };
  controller3: RichEditorController = new RichEditorController();
  options3: RichEditorOptions = { controller: this.controller3 };
  controller4: RichEditorController = new RichEditorController();
  options4: RichEditorOptions = { controller: this.controller4 };
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
    Column({ space: 0 }) {

      Text(this.spanParagraphs)
        .id('RichEditorApi_text_spanParagraphs')
        .height('10%').textAlign(TextAlign.Center)


      RichEditor(this.options)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')
        .onReady(() => {
          this.controller.addBuilderSpan(() => this.placeholderBuilder(), { offset: 0 })
        })
        .id('RichEditorApi_addBuilderSpan').height('10%')

      RichEditor(this.options2)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('300vp')
        .onReady(() => {
          this.controller2.addTextSpan('Text', { paragraphStyle: { leadingMargin: '5vp' } })
        })
        .height('10%')


      Row({ space: 0 }) {
        Button("updateParagraphStyle")
          .id('RichEditorApi_btn_updateParagraphStyle')
          .onClick(() => {
            this.controller2.updateParagraphStyle({ style: { leadingMargin: '10vp' } })
          })

        Button("getParagraphs")
          .id('RichEditorApi_btn_getParagraphs')
          .onClick(() => {
            this.spanParagraphs = JSON.stringify(this.controller2.getParagraphs({ start: -1, end: -1 })

            )
          })
      }.height('10%')


      Text(this.text1)
        .id('RichEditorApi_text1').height('10%').textAlign(TextAlign.Center)

      RichEditor(this.options3)
        .id('RichEditorApi_RichEditor3')
        .onReady(() => {
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
        .onReady(() => {
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