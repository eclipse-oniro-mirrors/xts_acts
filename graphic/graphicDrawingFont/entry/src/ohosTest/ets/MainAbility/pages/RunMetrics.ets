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
struct runMetrics1 {
  @State AvgCharWidth: number = 0
  @State MaxCharWidth: number = 0
  @State XMin: number = 0
  @State XMax: number = 0
  @State XHeight: number = 0
  @State Width: number = 0
  @State CapHeight: number = 0
  @State UnderlineThickness: number = 0
  @State UnderlinePosition: number = 0
  @State StrikethroughThickness: number = 0
  @State StrikethroughPosition: number = 0
  @State text: string = '点击'
  controller: TextController = new TextController()
  @State textStr: string = 'qwertyu'

  build() {
    Column() {
      Text(this.textStr, { controller: this.controller })
      Text(this.AvgCharWidth + '').id('runMetrics_1')
      Text(this.MaxCharWidth + '').id('runMetrics_2')
      Text(this.XMin + '').id('runMetrics_3')
      Text(this.XMax + '').id('runMetrics_4')
      Text(this.XHeight + '').id('runMetrics_5')
      Text(this.CapHeight + '').id('runMetrics_6')
      Text(this.UnderlineThickness + '').id('runMetrics_7')
      Text(this.UnderlinePosition + '').id('runMetrics_8')
      Text(this.StrikethroughThickness + '').id('runMetrics_9')
      Text(this.StrikethroughPosition + '').id('runMetrics_10')
      Button('runMetrics')
        .id('runMetrics_11')
        .onClick(() => {
        let layoutManager: LayoutManager = this.controller.getLayoutManager()
        let lineMetrics = layoutManager.getLineMetrics(0)
        console.log('aaa', JSON.stringify(lineMetrics))
        let runMetrics1 = lineMetrics.runMetrics
        runMetrics1.forEach((key, value) => {
          key.fontMetrics.avgCharWidth = 10
          this.AvgCharWidth = key.fontMetrics.avgCharWidth
          key.fontMetrics.maxCharWidth = 59
          this.MaxCharWidth = key.fontMetrics.maxCharWidth
          key.fontMetrics.xMin = -10
          this.XMin = key.fontMetrics.xMin
          key.fontMetrics.xMax = 50
          this.XMax = key.fontMetrics.xMax
          key.fontMetrics.xHeight = 10
          this.XHeight = key.fontMetrics.xHeight
          key.fontMetrics.capHeight = 15
          this.CapHeight = key.fontMetrics.capHeight
          key.fontMetrics.underlineThickness = 1
          this.UnderlineThickness = key.fontMetrics.underlineThickness
          key.fontMetrics.underlinePosition = 5
          this.UnderlinePosition = key.fontMetrics.underlinePosition
          key.fontMetrics.strikethroughThickness = 1
          this.StrikethroughThickness = key.fontMetrics.strikethroughThickness
          key.fontMetrics.strikethroughPosition = -5
          this.StrikethroughPosition = key.fontMetrics.strikethroughPosition
          console.info('key', key)
          console.info('key1', JSON.stringify(key))
        })
      })
    }
    .width('100%')
    .height('100%')
  }
}