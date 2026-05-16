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
struct RichEditorLineMetrics012 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetrics: string = '';
  @State lineCount: number = 0;
  @State lineMetrics2: string = '';



  build() {

    Column() {
      Button('get lineMetrics').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          this.lineCount = layoutManager.getLineCount()
          let lineMetrics1 = layoutManager.getLineMetrics(1);
          console.log('RichEditorController 1 lineMetrics 1:' +  JSON.stringify(lineMetrics1));
          this.lineMetrics2 = JSON.stringify(lineMetrics1);
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .padding('10px')
        .width(200)
        .onReady(() => {
          this.controller.addTextSpan('012345012345abctest012345012345abctest')
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics012')
      Text('lineCount:' + this.lineCount).id('lineCount')
      Text('lineMetrics(1):' + this.lineMetrics2).id('lineMetrics2')
    }
  }
}