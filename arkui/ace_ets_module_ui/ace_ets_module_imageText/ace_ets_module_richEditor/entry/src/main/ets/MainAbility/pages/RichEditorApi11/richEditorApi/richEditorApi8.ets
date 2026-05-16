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
struct richEditorApi8 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State selection: string = ''
  @State text1: string = '111'

  build() {
    Scroll() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: ["600px", "600px"],
              },
              gesture:
              {
                onClick: () => {
                  this.text1 = "444"
                }
              }
            })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height(400)
          .key('RichEditor8')
        Text('' + this.text1).key('richEditorApi8_text1')

      }.borderWidth(1).borderColor(Color.Red)
    }
  }
}
