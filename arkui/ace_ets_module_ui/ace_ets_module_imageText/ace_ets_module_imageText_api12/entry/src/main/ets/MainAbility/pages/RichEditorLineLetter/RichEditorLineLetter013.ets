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
struct RichEditorLineLetter013 {
  controller: RichEditorController = new RichEditorController();
  @State textStyle: string = '';
  build() {

    Column() {
      Text('textStyle:' + this.textStyle).id('textStyle')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('012345',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30,
                lineHeight: 0x20,
                letterSpacing: 0x20
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue) => {
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController item.textStyle:' + JSON.stringify(item.textStyle));
            this.textStyle = JSON.stringify(item.textStyle);
          })
          return true
        })
        .id('RichEditorLineLetter013')

    }
  }
}