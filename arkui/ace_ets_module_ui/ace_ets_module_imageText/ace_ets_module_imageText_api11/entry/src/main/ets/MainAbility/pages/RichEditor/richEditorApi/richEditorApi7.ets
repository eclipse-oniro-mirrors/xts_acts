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
struct richEditorApi7 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State selection: string = ''
  @State text1: string = '111'

  build() {
    Scroll() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('Area1\n', {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 200
              },
              gesture:
              {
                onLongPress: () => {
                  this.text1 = "333"
                }
              },
              paragraphStyle: {
                textAlign: TextAlign.Start,
                leadingMargin: 18
              }
            })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height(400)
          .key('RichEditor7')
        Text('' + this.text1).key('richEditorApi7_text1')

      }.borderWidth(1).borderColor(Color.Red)
    }
  }
}
