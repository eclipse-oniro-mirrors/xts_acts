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

import LeadingMarginCreator from '../../common/LeadingMarginCreator'

@Entry
@Component
struct RichEditorLineMetrics019 {
  controller: RichEditorController = new RichEditorController();
  private leadingMarkCreatorInstance = LeadingMarginCreator.instance
  @State lineMetrics1: string = ''
  @State lineMetrics2: string = ''
  build() {

    Column() {
      Button('get lineMetrics(0)').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController 0 lineMetrics 0:' +  JSON.stringify(lineMetrics));
          this.lineMetrics1 = JSON.stringify(lineMetrics.left);

          let lineMetrics1 = layoutManager.getLineMetrics(1);
          console.log('RichEditorController 1 lineMetrics1:' +  JSON.stringify(lineMetrics1));
          this.lineMetrics2 = JSON.stringify(lineMetrics1.left);
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .width(200)
        .onReady(() => {
          this.controller.addTextSpan('1111111\n22222', {
            style: {
              fontColor: Color.Pink,
              fontSize: '32',
            },
            paragraphStyle: {
              leadingMargin: {
                pixelMap : this.leadingMarkCreatorInstance.genCircleMark(100, 40, 1),
                size: [30, 30]
              }
            }
          })
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics019')
      Text('' + this.lineMetrics1).id('lineMetrics1')
      Text('' + this.lineMetrics2).id('lineMetrics2')
    }
  }
}