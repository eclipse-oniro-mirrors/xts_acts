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
struct RichEditorApi9 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text: string = '';

  build() {
    Row() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('aaaaaaaa',
              {
                style:
                {
                  fontSize: 30
                }
              })
            this.controller.addImageSpan($r('app.media.icon'),{
              imageStyle:
              {
                size: ["57px", "57px"]
              }
            })
            this.controller.deleteSpans({
              start:0,
              end:2
            })
          })
          .copyOptions(CopyOptions.InApp)
          .enablePreviewText(true)
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            console.log('previewText' + value.previewText)
            return true;
          })
          .onIMEInputComplete((value:RichEditorTextSpanResult) => {
            console.log('previewText' + value.previewText)
          })
          .onWillChange((value:RichEditorChangeValue) => {
            value.replacedImageSpans.forEach(item => {
              this.text = String(item.offsetInSpan)
            });
            return true
          })
          .borderWidth(1)
          .width('100%')

        Text(this.text).id('RichEditorApi9_text1')

      }
      .width('100%')
    }
  }
}