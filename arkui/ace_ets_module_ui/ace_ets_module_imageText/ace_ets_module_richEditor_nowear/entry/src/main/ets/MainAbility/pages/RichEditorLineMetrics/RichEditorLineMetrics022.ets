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
struct RichEditorLineMetrics022 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetricsImeInput: string = '';
  @State lineMetricsOnDelete: string = '';
  build() {

    Column() {

      RichEditor({ controller: this.controller })
        .width(200)
        .onReady(() => {
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController onIMEInputComplete:' +  JSON.stringify(lineMetrics));
          this.lineMetricsImeInput = JSON.stringify(lineMetrics);
        })
        .onDeleteComplete(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController onDeleteComplete:' +  JSON.stringify(lineMetrics));
          this.lineMetricsOnDelete = JSON.stringify(lineMetrics);
        })
        .id('RichEditorLineMetrics022')
      Text('lineMetricsImeInput' + this.lineMetricsImeInput).id('lineMetricsImeInput')
      Text('lineMetricsOnDelete:' + this.lineMetricsOnDelete).id('lineMetricsOnDelete')
    }
  }
}