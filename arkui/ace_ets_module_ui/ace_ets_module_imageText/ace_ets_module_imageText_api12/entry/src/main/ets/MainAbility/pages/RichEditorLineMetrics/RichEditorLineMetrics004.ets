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
struct RichEditorLineMetrics004 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetrics: string = ''
  build() {

    Column() {
      Text('lineMetrics:' + this.lineMetrics).id('lineMetrics')
      Button('get lineMetrics(0)').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController 0 lineMetrics:' + lineMetrics);
          this.lineMetrics = JSON.stringify(lineMetrics);
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('0123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
          this.controller.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['55px', '55px']
              }
            })
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics004')

    }
  }
}