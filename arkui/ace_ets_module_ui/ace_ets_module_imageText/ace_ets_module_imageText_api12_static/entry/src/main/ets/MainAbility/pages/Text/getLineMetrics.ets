'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  Entry, Component,
  Scroll, Column, Text, ForEach, Button, ClickEvent,
  LayoutManager, TextController,Color,
  PositionWithAffinity
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
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
          .fontColor(Color.Red)
          .width('90%')
          .padding(10)
        Text(this.textStr, { controller: this.controller })
          .fontSize(25)
          .borderWidth(1)
          .onAreaChange(():void => {
            let layoutManager: LayoutManager = this.controller!.getLayoutManager() as LayoutManager
            this.lineCount = 'LineCount: ' + String(layoutManager.getLineCount() as int)
          })
          .height('5%')

        Text('GlyphPositionAtCoordinate').fontSize(9).fontColor(Color.Red).width('90%').padding(10)
        Button('getGlyphPositionAtCoordinate').id('position_get')
          .onClick((e:ClickEvent) => {
            let layoutManager: LayoutManager = this.controller!.getLayoutManager() as LayoutManager
            let position: PositionWithAffinity = layoutManager!.getGlyphPositionAtCoordinate(150, 50) as PositionWithAffinity
            console.log('positionpositionposition',JSON.stringify(position))
            this.glyphPositionAtCoordinate =
              'position: ' + position.position + ' affinity: ' +
              position.affinity
          })
          .height('5%')

        Text('LineMetrics').fontSize(9).fontColor(Color.Red).width('90%').padding(10)
        Button('getLineMetrics').id('lineMetrics_get')
          .onClick((e:ClickEvent) => {
            let layoutManager = this.controller!.getLayoutManager() as LayoutManager
            let lineMetrics = layoutManager!.getLineMetrics(0)
            this.startIndex = 'startIndex: ' + JSON.stringify(lineMetrics!.startIndex)
            // this.lineMetrics = 'lineMetrics is ' + JSON.stringify(lineMetrics) + '\n\n'
            // let runMetrics = lineMetrics!.runMetrics
            // runMetrics!.forEach((value, key) => {
            //   this.lineMetrics += 'runMetrics key is ' + key + ' ' + JSON.stringify(value) + '\n\n'
            // });
          }).height('5%')
        Text(this.startIndex).id('lineMetrics_mess')
      }
      .height('100%')
    }
  }
}