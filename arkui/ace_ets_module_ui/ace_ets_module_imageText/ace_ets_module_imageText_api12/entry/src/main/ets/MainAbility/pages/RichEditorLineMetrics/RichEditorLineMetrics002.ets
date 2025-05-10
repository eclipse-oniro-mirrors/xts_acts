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
struct RichEditorLineMetrics002 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetrics: string = ''
  build() {

    Column() {
      Text('lineMetrics:' + this.lineMetrics).id('lineMetrics')
      Button('get lineMetrics(1000)').id('getLineMetrics')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          this.lineMetrics = JSON.stringify(layoutManager.getLineMetrics(1000));
        })
        .margin({ bottom: 20, top: 10 })

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addImageSpan($r('app.media.app_icon'),
            {
              imageStyle:
              {
                size: ['20px', '20px']
              }
            })
          for (let i = 0; i < 50; i++) {
            this.controller.addTextSpan('123', {
              style: {
                fontColor: Color.Pink,
                fontSize: 20,
              }
            })
          }
          this.controller.addImageSpan($r('app.media.app_icon'),
            {
              imageStyle:
              {
                size: ['20px', '20px']
              }
            })
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics002')

    }
  }
}