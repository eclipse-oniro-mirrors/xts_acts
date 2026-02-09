/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct PanGestureEvent {
  @State velocityX: number = 0
  @State velocityY: number = 0
  @State velocity: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })

  build() {
    Column() {
      Column() {
        Text(this.velocityX.toString()).id("velocityX")
        Text(this.velocityY.toString()).id("velocityY")
        Text(this.velocity.toString()).id("velocity")
      }
      .id("PanGestureEvent_column_id")
      .height("90%")
      .width("90%")
      .padding(20)
      .border({ width: 3 })
      .margin(50)
      // 左右拖动触发该手势事件
      .gesture(
      PanGesture(this.panOption)
        .onActionUpdate((event: GestureEvent) => {
          this.velocityX = event.velocityX
          this.velocityY = event.velocityY
          this.velocity = event.velocity
        })
      )
    }
  }
}