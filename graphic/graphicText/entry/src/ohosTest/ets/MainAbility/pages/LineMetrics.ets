/*
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
struct lineMetrics1 {
  @State StartIndex: number = 0
  @State EndIndex: number = 0
  @State Ascent: number = 0
  @State Descent: number = 0
  @State Height: number = 0
  @State Width: number = 0
  @State Left: number = 0
  @State Baseline: number = 0
  @State LineNumber: number = 0
  @State TopHeight: number = 0
  @State flags: number = 0
  @State text: string = '点击'
  controller: TextController = new TextController()
  @State textStr: string = 'qwertyu'

  build() {
    Column() {
      Text(this.textStr, { controller: this.controller })
      Text(this.StartIndex + '').id('LineMetrics_1')
      Text(this.EndIndex + '').id('LineMetrics_2')
      Text(this.TopHeight + '').id('LineMetrics_3')
      Button('getLineMetrics(1)')
      .id('LineMetrics_4')
      .onClick(() => {
        let layoutManager: LayoutManager = this.controller.getLayoutManager()
        let lineMetrics = layoutManager.getLineMetrics(0)
        lineMetrics.startIndex = 1
        this.StartIndex = Math.round(lineMetrics.startIndex)
        lineMetrics.endIndex = 7
        this.EndIndex = Math.round(lineMetrics.endIndex)
        lineMetrics.topHeight = 10
        this.TopHeight = Math.round(lineMetrics.topHeight)
        console.log('aaa_1',JSON.stringify(lineMetrics))
      })
    }
    .width('100%')
    .height('100%')
  }
}