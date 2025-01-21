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
struct onGesture1 {
  @State message: string = 'hello';

  build() {
    Column() {
      Text(this.message)
        .key('onGesture_Text')
        .width(100)
        .height(40)
        .backgroundColor(Color.Pink)
    }
    .margin({ top: 20 })
    .width('100%')
    .height(200)
    .gesture(
      LongPressGesture()
        .tag("longPress1")
    )
    .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
      if (gestureInfo.type == GestureControl.GestureType.LONG_PRESS_GESTURE) {
        this.message = 'longPress'
      }
      return GestureJudgeResult.CONTINUE;
    })
  }
}