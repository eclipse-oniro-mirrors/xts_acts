/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct AllowableMovementExample {
  @State count: number = 0;
  @State count2: number = 0;
  @State count3: number = 0;
  @State count4: number = 0;
  @State count5: number = 0;
  @State allowableMovementTest: Array<number | undefined | null> = [-20, 0, 1, 15, 200.5, 10000, undefined, null]
  @State allowableMovement: number | undefined | null = 15
  @State eventType: string = ''
  @State text: number = 15

  build() {
    Scroll() {
      Column() {
        Column() {
          Text('LongPress onAction:' + this.count)
            .fontSize(28)
            .width('100%')
        }
        .id('column1')
        .onTouch((event?: TouchEvent) => {
          if (event) {
            if (event.type === TouchType.Down) {
              this.eventType = 'Down'
            }
            if (event.type === TouchType.Up) {
              this.eventType = 'Up'
            }
            if (event.type === TouchType.Move) {
              this.eventType = 'Move'
            }
            if (event.touches) {

            }
          }
        })
        .gesture(
          LongPressGesture({ repeat: true, allowableMovement: this.allowableMovement })
            .onAction((event: GestureEvent) => {
              if (event && event.repeat) {
                this.count++
              }
              AppStorage.setOrCreate('allowableMovement', this.allowableMovement)
            })
            .onActionEnd((event: GestureEvent) => {
              this.count = 0
            })
        )
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          recognizers: Array<GestureRecognizer>) => {
          if (current.getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) {
            let getAllow = (current as LongPressRecognizer).getAllowableMovement();
            AppStorage.setOrCreate('getAllowableMovement', getAllow)
          }
          return GestureJudgeResult.CONTINUE
        })
        .height('20%')
        .width('90%')

      }.height('90%')
      .width('100%')
    }
  }
}