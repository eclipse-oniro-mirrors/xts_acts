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
struct RichEditorLineMetrics008 {
  controller: RichEditorController = new RichEditorController();
  @State getHeight: string = ''
  build() {

    Column() {

      Button('get lineMetrics(0)').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController lineMetrics:' + JSON.stringify(lineMetrics));
          this.getHeight = JSON.stringify(lineMetrics.height);
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .padding(0)
        .width(200)
        .onReady(() => {
          this.controller.addTextSpan('0123456',
            {
              style:
              {
                fontColor: Color.Orange,
                lineHeight: '30px',
                letterSpacing: '30px'
              }
            })
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics008')

      Text('getHeight:' + this.getHeight).id('getHeight')
    }
  }
}