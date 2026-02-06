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
struct PanRecognizerExample {
  @State message: string = 'Gesture';

  build() {
    Column() {
      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('PanRecognizer1')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.All
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('PAN_GESTURE', current.getType())
            AppStorage.setOrCreate('All', target.getDirection())
            console.log('aaaaa' + target.getDirection())
            this.message = 'PanGesture\ndistance:' + target.getPanGestureOptions().getDistance() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('Horizontal')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.Horizontal
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('Horizontal', target.getDirection())
            console.log('aaaaa' + target.getDirection())
            this.message = 'PanGesture\ndistance:' + target.getPanGestureOptions().getDistance() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('Left')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.Left
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('Left', target.getDirection())
            console.log('aaaaa' + target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('Right')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.Right
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('Right', target.getDirection())
            console.log('aaaaa' + target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('Vertical')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.Vertical
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('Vertical', target.getDirection())
            console.log('aaaaa' + target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('Up')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.Up
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('Up', target.getDirection())
            console.log('aaaaa' + target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('Down')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.Down
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
            AppStorage.setOrCreate('Down', target.getDirection())
            console.log('aaaaa' + target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Text(this.message).key('PanRecognizer')
      }
      .key('None')
      .margin(5)
      .borderWidth(2)
      .width('100%')
      .height('10%')
      .gesture(PanGesture({
        direction: PanDirection.None | PanDirection.All
      }).onActionStart(() => {
        console.log('aaa' + PanDirection.None)
        AppStorage.setOrCreate('None', PanDirection.None)
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            let target = current as PanRecognizer;
          }
        }
        return GestureJudgeResult.CONTINUE;
      })
    }
    .width('90%')
    .height('90%')
  }
}