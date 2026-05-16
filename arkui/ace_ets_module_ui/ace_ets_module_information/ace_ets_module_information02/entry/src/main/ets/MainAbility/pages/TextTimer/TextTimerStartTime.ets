/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TextTimerStartTime {
  textTimerController1: TextTimerController = new TextTimerController();
  textTimerController2: TextTimerController = new TextTimerController();
  textTimerController3: TextTimerController = new TextTimerController();
  textTimerController4: TextTimerController = new TextTimerController();
  textTimerController5: TextTimerController = new TextTimerController();
  textTimerController6: TextTimerController = new TextTimerController();

  build() {
    Scroll(){
      Column() {
        TextTimer({ isCountDown: false, controller: this.textTimerController1 })
          .id('textTimer_startTime_default')
          .format('mm:ss.SS')
          .fontSize(30)

        TextTimer({ isCountDown: false, controller: this.textTimerController2, startTime: 30000 })
          .id('textTimer_startTime_positive')
          .format('mm:ss.SS')
          .fontSize(30)

        TextTimer({ isCountDown: false, controller: this.textTimerController3, startTime: 0 })
          .id('textTimer_startTime_zero')
          .format('mm:ss.SS')
          .fontSize(30)

        TextTimer({ isCountDown: false, controller: this.textTimerController4, startTime: -10000 })
          .id('textTimer_startTime_negative')
          .format('mm:ss.SS')
          .fontSize(30)

        TextTimer({ isCountDown: false, controller: this.textTimerController5, startTime: null })
          .id('textTimer_startTime_null')
          .format('mm:ss.SS')
          .fontSize(30)

        TextTimer({ isCountDown: false, controller: this.textTimerController6, startTime: undefined })
          .id('textTimer_startTime_undefined')
          .format('mm:ss.SS')
          .fontSize(30)
      }
      .width('100%')
      .height('100%')
    }
  }
}