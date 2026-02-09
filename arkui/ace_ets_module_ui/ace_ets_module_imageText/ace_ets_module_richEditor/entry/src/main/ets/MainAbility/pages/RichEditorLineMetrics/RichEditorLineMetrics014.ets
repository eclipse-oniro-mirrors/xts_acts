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

import Utils from '../../common/Utils'

@Entry
@Component
struct RichEditorLineMetrics014 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetrics: string = '';
  build() {

    Column() {
      Text('lineMetrics:' + this.lineMetrics).id('lineMetrics')
      Button('get lineMetrics(0)').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController 0 lineMetrics:' + JSON.stringify(lineMetrics));
          this.lineMetrics = JSON.stringify(lineMetrics);
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .placeholder('please input text', {
          fontColor: Color.Gray,
          font: {
            size: 16,
            weight: FontWeight.Normal,
            family: Utils.FONT_FAMILY,
            style: FontStyle.Normal
          }
        })
        .id('RichEditorLineMetrics014')

    }
  }
}