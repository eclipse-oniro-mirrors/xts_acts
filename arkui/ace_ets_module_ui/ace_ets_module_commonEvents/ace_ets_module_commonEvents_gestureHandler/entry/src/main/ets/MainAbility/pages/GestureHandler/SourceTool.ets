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
struct PanGestureSourceTool {
  @State sourceTool1: SourceTool = SourceTool.MOUSE
  @State sourceTool2: SourceTool = SourceTool.TOUCHPAD
  @State sourceTool3: SourceTool = SourceTool.JOYSTICK
  @State axisHorizontal: number = 0
  @State axisVertical: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })

  build() {
    Column() {
      Column() {
        Button('' + this.axisHorizontal).id("axisHorizontal_id")
        Button('' + this.axisVertical).id("axisVertical_id")
        Button('' + this.sourceTool1).id("sourceTool1_id")
      }
      .id("PanGestureSourceToolColumn")
      .height('30%')
      .width('30%')
      .padding(20)
      .border({ width: 3 })
      .margin(50)
      // 左右拖动触发该手势事件
      .gesture(
        PanGesture(this.panOption)
          .onActionStart((event: GestureEvent) => {
            console.info('Pan start')
          })
          .onActionUpdate((event: GestureEvent) => {
            if (event) {
              this.axisHorizontal = event.axisHorizontal
              this.axisVertical = event.axisVertical
              this.sourceTool1 = event.sourceTool
            }
          })
          .onActionEnd((event: GestureEvent) => {
            console.info('Pan end')
          })
      )
      .gesture(
        TapGesture()
          .onAction((event: GestureEvent) => {
            console.info('tap start')
            if (event) {
              this.sourceTool1 = event.sourceTool
            }
          })
      )

      Button('change SourceTool2').id("changeSourceTool2_id")
        .onClick(() => {
          this.sourceTool1 = this.sourceTool2
        })
      Button('change SourceTool3').id("changeSourceTool3_id")
        .onClick(() => {
          this.sourceTool1 = this.sourceTool3
        })
    }
  }
}