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
struct RichEditorLineMetrics021 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetricsWill: string = '';
  @State lineMetricsDid: string = '';
  build() {

    Column() {

      RichEditor({ controller: this.controller })
        .width(200)
        .onReady(() => {
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .onWillChange((value: RichEditorChangeValue) => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController onWillChange:' +  JSON.stringify(lineMetrics));
          this.lineMetricsWill = JSON.stringify(lineMetrics);
          return true
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController onDidChange:' +  JSON.stringify(lineMetrics));
          this.lineMetricsDid = JSON.stringify(lineMetrics);
        })
        .id('RichEditorLineMetrics021')
      Text('lineMetricsWill' + this.lineMetricsWill).id('lineMetricsWill')
      Text('lineMetricsDid:' + this.lineMetricsDid).id('lineMetricsDid')
    }
  }
}