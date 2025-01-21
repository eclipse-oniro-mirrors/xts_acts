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
struct getLineMetricsText {
  @State lineCount: string = ''
  @State glyphPositionAtCoordinate: string = ''
  @State startIndex: string = ''
  @State lineMetrics: string = ''
  controller: TextController = new TextController()
  @State textStr: string =
    'Hello World! 您好，世界！'

  build() {
    Scroll() {
      Column() {
        Text('getLayoutManager')
          .fontSize(9)
          .fontColor(0xCCCCCC)
          .width('90%')
          .padding(10)
        Text(this.textStr, { controller: this.controller })
          .fontSize(25)
          .borderWidth(1)
          .onAreaChange(() => {
            let layoutManager: LayoutManager = this.controller.getLayoutManager()
            this.lineCount = 'LineCount: ' + layoutManager.getLineCount()
          })

        Text('GlyphPositionAtCoordinate').fontSize(9).fontColor(0xCCCCCC).width('90%').padding(10)
        Button('getGlyphPositionAtCoordinate').id('position_get')
          .onClick(() => {
            let layoutManager: LayoutManager = this.controller.getLayoutManager()
            let position: PositionWithAffinity = layoutManager.getGlyphPositionAtCoordinate(150, 50)
            this.glyphPositionAtCoordinate =
            'position: ' + position.position + ' affinity: ' +
            position.affinity
          })
          .margin({ bottom: 20, top: 10 })

        Text('LineMetrics').fontSize(9).fontColor(0xCCCCCC).width('90%').padding(10)
        Button('getLineMetrics').id('lineMetrics_get')
          .onClick(() => {
            let layoutManager: LayoutManager = this.controller.getLayoutManager()
            let lineMetrics: LineMetrics = layoutManager.getLineMetrics(0)
            this.startIndex = 'startIndex: ' + JSON.stringify(lineMetrics.startIndex)
            this.lineMetrics = 'lineMetrics is ' + JSON.stringify(lineMetrics) + '\n\n'
            let runMetrics = lineMetrics.runMetrics
            runMetrics.forEach((value, key) => {
              this.lineMetrics += 'runMetrics key is ' + key + ' ' + JSON.stringify(value) + '\n\n'
            });
          })
          .margin({ bottom: 20, top: 10 })
        Text(this.startIndex).id('lineMetrics_mess')
      }
      .margin({ top: 100, left: 8, right: 8 })
    }
  }
}