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
struct richEditorApi1 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State types: TextDataDetectorType[] = [];
  @State text1: string = '11';

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            {
              style:
              {
                fontSize: 50
              }
            }
          )
        })
        .onPaste((event: PasteEvent) => {
          event.preventDefault = () => {
            this.text1 = '222'
          }
          event.preventDefault()
        })
        .key("RichEditor1")
        .borderWidth(1)
        .width('100%')
        .height(200)

      Text('' + this.text1)
        .key('richEditorApi1_text1')
        .height(50)
    }
    .width('100%')
    .height('100%')
  }
}