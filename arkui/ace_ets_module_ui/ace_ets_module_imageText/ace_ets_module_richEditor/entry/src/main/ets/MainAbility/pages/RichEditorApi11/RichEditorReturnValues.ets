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
struct RichEditorReturnValues {
  @State range: RichEditorRange = { start: 0, end: 5 };
  controller: RichEditorController = new RichEditorController();
  controller1: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  options1: RichEditorOptions = { controller: this.controller1 };

  build() {
    Column({space:1}) {
      Row() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('RichEditor');
          })
          .width('45%')
          .height('10%')
          .borderWidth(1)

        RichEditor(this.options1)
          .onReady(() => {
            this.controller1.addTextSpan('');
          })
          .width('45%')
          .height('10%')
          .borderWidth(1)
      }

      Row() {
        Button('setCaretOffset: true')
          .width('50%')
          .height('5%')
          .id('setCaretOffset_true')
          .onClick(() => {
            let result: boolean = this.controller.setCaretOffset(3)
            console.log('setCaretOffset true: ' + result)
            AppStorage.setOrCreate('setCaretOffset_return', result)
          })

        Button('setCaretOffset: false')
          .width('50%')
          .height('5%')
          .id('setCaretOffset_false')
          .onClick(() => {
            let result: boolean = this.controller.setCaretOffset(10000)
            console.log('setCaretOffset false: ' + result)
            AppStorage.setOrCreate('setCaretOffset_return', result)
          })
      }

      Button('addImageSpan get')
        .width('50%')
        .height('5%')
        .id('addImageSpan_get')
        .onClick(() => {
          let result1: number = this.controller.addImageSpan($r('app.media.icon'), {
            offset: 1,
            imageStyle: {
              size: ['50px', '50px'],
              verticalAlign: ImageSpanAlignment.CENTER,
              objectFit: ImageFit.Cover
            }
          })
          console.log('addImageSpan result: ' + result1)
          AppStorage.setOrCreate('addImageSpan_return', result1)
        })

      Row() {
        Button('getSpans []')
          .width('50%')
          .height('5%')
          .id('getSpans_return_0')
          .onClick(() => {
            let value:Array<RichEditorImageSpanResult | RichEditorTextSpanResult>=this.controller1.getSpans(this.range)
            console.log('getSpans return []:' + value.length)
            AppStorage.setOrCreate('getSpans_return_0', value.length)
          })

        Button('getSpans [1]')
          .width('50%')
          .height('5%')
          .id('getSpans_return_1')
          .onClick(() => {
            let value:Array<RichEditorImageSpanResult | RichEditorTextSpanResult>=this.controller.getSpans(this.range)
            console.log('getSpans return [1]:' + value.length)
            AppStorage.setOrCreate('getSpans_return_1', value.length)
          })
      }

      Row() {
        Button('getParagraphs []')
          .width('50%')
          .height('5%')
          .id('getParagraphs_return_0')
          .onClick(() => {
            let value: RichEditorParagraphResult[] = this.controller1.getParagraphs(this.range)
            console.log('getParagraphs return []:' + value.length)
            AppStorage.setOrCreate('getParagraphs_return_0', value.length)
          })

        Button('getParagraphs [1]')
          .width('50%')
          .height('5%')
          .id('getParagraphs_return_1')
          .onClick(() => {
            let value: RichEditorParagraphResult[] = this.controller.getParagraphs(this.range)
            console.log('getParagraphs return [1]:' + value.length)
            AppStorage.setOrCreate('getParagraphs_return_1', value.length)
          })
      }
    }
  }
}