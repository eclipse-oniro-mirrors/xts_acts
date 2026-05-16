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

class MyTextTimerModifier1 implements ContentModifier<TextTimerConfiguration> {
  constructor() {
  }

  applyContent(): WrappedBuilder<[TextTimerConfiguration]> {
    return wrapBuilder(buildTextTimer1);
  }
}

@Builder
function buildTextTimer1(config: TextTimerConfiguration) {
  Column() {
    Stack({ alignContent: Alignment.Center }) {
      Circle({ width: 150, height: 150 })
        .fill(config.started ? (config.isCountDown ? 0xFF232323 : 0xFF717171) : 0xFF929292)
      Column() {
        Text(config.isCountDown ? '倒计时' : '正计时').fontColor(Color.White)
        Text(
          'startTime: ' + config.startTime + 'ms'
        ).fontColor(Color.White)
      }
    }
  }
}

@Entry
@Component
struct TextTimerConfigurationStartTime {
  textTimerController1: TextTimerController = new TextTimerController();
  textTimerController2: TextTimerController = new TextTimerController();
  textTimerController3: TextTimerController = new TextTimerController();
  textTimerController4: TextTimerController = new TextTimerController();
  textTimerController5: TextTimerController = new TextTimerController();
  textTimerController6: TextTimerController = new TextTimerController();
  @State myTimerModifier: MyTextTimerModifier1 = new MyTextTimerModifier1();

  build() {
    Scroll() {
      Column({ space: 20 }) {
        TextTimer({ isCountDown: false, controller: this.textTimerController1 })
          .id('textTimer_config_startTime_default')
          .contentModifier(this.myTimerModifier)
          .fontSize(20)

        TextTimer({ isCountDown: false, controller: this.textTimerController2, startTime: 30000 })
          .id('textTimer_config_startTime_positive')
          .contentModifier(this.myTimerModifier)
          .fontSize(20)

        TextTimer({ isCountDown: false, controller: this.textTimerController3, startTime: 0 })
          .id('textTimer_config_startTime_zero')
          .contentModifier(this.myTimerModifier)
          .fontSize(20)

        TextTimer({ isCountDown: false, controller: this.textTimerController4, startTime: -10000 })
          .id('textTimer_config_startTime_negative')
          .contentModifier(this.myTimerModifier)
          .fontSize(20)

        TextTimer({ isCountDown: false, controller: this.textTimerController5, startTime: null })
          .id('textTimer_config_startTime_null')
          .contentModifier(this.myTimerModifier)
          .fontSize(20)

        TextTimer({ isCountDown: false, controller: this.textTimerController6, startTime: undefined })
          .id('textTimer_config_startTime_undefined')
          .contentModifier(this.myTimerModifier)
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
  }
}