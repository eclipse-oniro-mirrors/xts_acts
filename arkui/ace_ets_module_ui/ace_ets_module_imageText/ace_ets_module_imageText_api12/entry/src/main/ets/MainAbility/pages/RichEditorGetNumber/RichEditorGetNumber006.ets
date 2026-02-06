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
struct RichEditorGetNumber006 {
  controller: RichEditorController = new RichEditorController();
  @State lineCount: number = 0;

  build() {

    Column() {
      Text('lineCount:' + this.lineCount).id('lineCount')
      Button('get lineCount').id('getLineCount')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          this.lineCount = layoutManager.getLineCount()
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(300)
        .width(200)
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          for (let index = 0; index < 50; index++) {
            this.controller.addTextSpan('abcdefg01234',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
          }
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorGetNumber006')
    }
  }
}