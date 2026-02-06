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

@Entry
@Component
struct ClickRecognizerExample {
  @State message: string = '';

  build() {
    Column() {
      Text(this.message).key('PanRecognizer')
    }
    .key('Click')
    .margin(5)
    .borderWidth(2)
    .width('80%')
    .height('10%')
    .onClick((event: ClickEvent) => {
    })
    .gesture(PanGesture({
      direction: PanDirection.Down,
      isFingerCountLimited: true
    }))
    .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
      others: Array<GestureRecognizer>) => {
      if (current) {
        if (current.getType() == GestureControl.GestureType.CLICK) {
          console.log('AAA', current.getType())
          AppStorage.setOrCreate('getState0', current.getState())
          AppStorage.setOrCreate('Click', current.getType())
        }
      }
      return GestureJudgeResult.CONTINUE;
    })
  }
}