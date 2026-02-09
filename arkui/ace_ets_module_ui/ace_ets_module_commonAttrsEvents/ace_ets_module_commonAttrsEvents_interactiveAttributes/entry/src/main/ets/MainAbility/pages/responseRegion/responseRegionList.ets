/**
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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct ResponseRegionListExample {
  @State text: string = "";

  build() {
    Column() {
      Text("left part of button1").height('5%')
      Button("button1")
        .height('5%')
        .id('button1')
        .responseRegionList([])
        .onClick(() => {
          this.text = 'button1 clicked'
          AppStorage.setOrCreate('click1', 'button1 clicked')
        })

      Text("one button size right of button2," + "\n one button size below button2").height('5%')
      Button("button2")
        .height('5%')
        .id('button2')
        .responseRegionList([{
          x: LengthMetrics.percent(1),
          y: LengthMetrics.vp(0),
          width: LengthMetrics.percent(1),
          height: LengthMetrics.percent(1),
        }, {
          tool: ResponseRegionSupportedTool.FINGER,
          x: LengthMetrics.vp(0),
          y: LengthMetrics.percent(1),
          width: 'calc(100% + 0vp)',
          height: 'calc(100% - 0px)',
        }])
        .onClick(() => {
          this.text = 'button2 clicked'
          AppStorage.setOrCreate('click2', 'button2 clicked')
        })
      Button("button3")
        .height('5%')
        .id('button3')
        .responseRegionList([{
          tool: ResponseRegionSupportedTool.ALL
        }])
        .onClick(() => {
          this.text = 'button3 clicked'
          AppStorage.setOrCreate('click3', 'button3 clicked')
        })
      Button("button4")
        .height('5%')
        .id('button4')
        .responseRegionList([{
          tool: ResponseRegionSupportedTool.PEN && ResponseRegionSupportedTool.ALL
        }])
        .onClick(() => {
          this.text = 'button4 clicked'
          AppStorage.setOrCreate('click4', 'button4 clicked')
        })
      Button("button5")
        .height('5%')
        .id('button5')
        .responseRegionList([{
          tool: ResponseRegionSupportedTool.MOUSE && ResponseRegionSupportedTool.ALL
        }])
        .onClick(() => {
          this.text = 'button5 clicked'
          AppStorage.setOrCreate('click5', 'button5 clicked')
        })

      Text(this.text).margin({ top: '3%' }).height('5%')
    }.width('100%').margin({ top: '3%' }).height('90%')
  }
}