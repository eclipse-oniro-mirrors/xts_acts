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
struct lineMetrics2 {
  @State startIndexA: number = 0
  @State endIndexA: number = 0
  @State ascentA: number = 0
  @State descentA: number = 0
  @State heightA: number = 0
  @State widthA: number = 0
  @State leftA: number = 0
  @State baselineA: number = 0
  @State lineNumberA: number = 0
  @State topHeightA: number = 0
  @State flags: number = 0
  @State text: string = '点击'
  controller: TextController = new TextController()
  @State textStr: string = 'qwertyu'

  build(){
    Column() {
      Text(this.textStr, { controller: this.controller })
      Text(this.startIndexA + '').id('LineMetrics_1')
      Text(this.endIndexA + '').id('LineMetrics_2')
      Text(this.topHeightA + '').id('LineMetrics_3')
      Text(this.ascentA + '').id('LineMetrics_5')
      Text(this.descentA + '').id('LineMetrics_6')
      Button('getLineMetrics(1)')
      .id('LineMetrics_4')
      .onClick(() => {
        let layoutManager: LayoutManager = this.controller.getLayoutManager()
        let lineMetrics = layoutManager.getLineMetrics(0)
        lineMetrics.startIndex = 1
        this.startIndexA = Math.round(lineMetrics.startIndex)
        lineMetrics.endIndex = 7
        this.endIndexA = Math.round(lineMetrics.endIndex)
        lineMetrics.topHeight = 10
        this.topHeightA = Math.round(lineMetrics.topHeight)
        lineMetrics.ascent = 5
        this.ascentA = Math.round(lineMetrics.ascent)
        lineMetrics.descent = 6
        this.descentA = Math.round(lineMetrics.descent)
        console.log('aaa_1',JSON.stringify(lineMetrics))
      })
    }
    .width('100%')
    .height('100%')
  }
}