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
struct GestureContiune {
  @State message: string = '';

  build() {
    Column() {
      Row({ space: 20 }) {
        Button('Gesture is ' + this.message).height(200).width(800).fontSize(40).id("GestureContiune")
          .borderWidth(2)
          .onClick((event?: ClickEvent) => {

          })
          .onDragStart(() => {
            console.log("Drag start.")
          })
          .gesture(
            TapGesture()
              .tag("tap1")
          )
          .gesture(
            LongPressGesture()
              .tag("longPress1")
          )
          .gesture(
            SwipeGesture()
              .tag("swipe1")
          )
          .gesture(
            PanGesture()
              .tag("pan1")
          )
          .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
            this.message = 'CONTINUE'
            if (gestureInfo.type == GestureControl.GestureType.LONG_PRESS_GESTURE) {
              let longPressEvent = event as LongPressGestureEvent;
              console.log("repeat " + longPressEvent.repeat)
            }

            if (gestureInfo.type == GestureControl.GestureType.SWIPE_GESTURE) {
              let swipeEvent = event as SwipeGestureEvent;
              console.log("angle " + swipeEvent.angle)
            }

            if (gestureInfo.type == GestureControl.GestureType.PAN_GESTURE) {
              let panEvent = event as PanGestureEvent;
              console.log("velocity " + panEvent.velocity)
            }

            return GestureJudgeResult.CONTINUE;

          })

      }.margin(20)
    }

  }
}