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
struct SwipeRecognizerExample {
  @State message: string = 'Gesture';

  build() {
    Column() {
      Column() {
        Row({ space: 20 }) {
          Text(this.message)
            .width('100%')
            .height('100%')
        }
      }
      .id('Horizontal')
      .margin(5)
      .width('100%')
      .height('20%')
      .borderWidth(2)
      .gesture(SwipeGesture({
        direction: SwipeDirection.Horizontal
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
            let target = current as SwipeRecognizer;
            this.message = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
            target.getVelocityThreshold();
            console.log('aaa' + target.getDirection())
            AppStorage.setOrCreate('Horizontal', target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Row({ space: 20 }) {
          Text(this.message)
            .width('100%')
            .height('100%')
            .key('value')
        }
      }
      .key('SwipeRecognizer')
      .margin(5)
      .width('100%')
      .height('20%')
      .borderWidth(2)
      .gesture(SwipeGesture({
        direction: SwipeDirection.All
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
            let target = current as SwipeRecognizer;
            AppStorage.setOrCreate('SWIPE_GESTURE', current.getType())
            this.message = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
            target.getVelocityThreshold();
            console.log('aaa' + target.getDirection())
            AppStorage.setOrCreate('All', target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Row({ space: 20 }) {
          Text(this.message)
            .width('100%')
            .height('100%')
        }
      }
      .margin(5)
      .width('100%')
      .height('20%')
      .borderWidth(2)
      .id('Vertical')
      .gesture(SwipeGesture({
        direction: SwipeDirection.Vertical
      }))
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
            let target = current as SwipeRecognizer;
            this.message = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
            target.getVelocityThreshold();
            console.log('aaa' + target.getDirection())
            AppStorage.setOrCreate('Vertical', target.getDirection())
          }
        }
        return GestureJudgeResult.CONTINUE;
      })

      Column() {
        Row({ space: 20 }) {
          Text(this.message)
            .width('100%')
            .height('100%')
        }
      }
      .id('None')
      .margin(5)
      .width('100%')
      .height('20%')
      .borderWidth(2)
      .gesture(SwipeGesture({
        direction: SwipeDirection.None | SwipeDirection.All
      }).onAction(() => {
        AppStorage.setOrCreate('None', SwipeDirection.None)
      }))

      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        let target = current as SwipeRecognizer;
        this.message = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
        target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
        target.getVelocityThreshold();
        console.log('aaa' + this.message)
        if (current) {
          if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
            let target = current as SwipeRecognizer;
            this.message = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
            target.getVelocityThreshold();
            console.log('aaa' + this.message)
          }
        }
        return GestureJudgeResult.CONTINUE;
      })
    }
    .width('80%')
    .height('90%')
  }
}