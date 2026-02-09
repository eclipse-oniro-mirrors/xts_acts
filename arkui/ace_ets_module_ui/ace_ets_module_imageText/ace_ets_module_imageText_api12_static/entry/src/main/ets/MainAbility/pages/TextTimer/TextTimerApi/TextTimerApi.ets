'use static';
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Rating,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  ContentModifier,
  TextClockConfiguration,
  WrappedBuilder,
  Builder,
  TimePicker,
  TextClockController,
  TextClock,
  Button,
  TextTimerConfiguration,
  Stack,
  TextTimerController,
  TextTimer,
  Circle,
  wrapBuilder,
  CircleOptions
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
// class MyTextTimerModifier implements ContentModifier<TextTimerConfiguration> {
//   constructor() {
//   }
//   applyContent() : WrappedBuilder<[TextTimerConfiguration]>
//   {
//     return wrapBuilder(buildTextTimer)
//   }
// }

@Builder function buildTextTimer(config: TextTimerConfiguration) {
  Column() {
    Text(config.started + '')
      .id('started')
    Stack({ alignContent: Alignment.Center }) {
      //Circle({ width: 150, height: 150 } as CircleOptions).fill(config.started ? (config.isCountDown ? 0xFF232323 : 0xFF717171) : 0xFF929292)
      Column(){
        Text(
          (config.isCountDown ? "剩余" : "已经过去了") + (config.isCountDown?
            Number(Math.max((config.count - config.elapsedTime) / 1000,0)).toFixed(1) + "/" + Number(config.count / 1000).toFixed(0)
            :(Number(config.elapsedTime / 1000).toFixed(0))
          ) + "秒"
        ).fontColor(Color.White)
      }
    }
  }
}

@Entry
@Component
struct TextTimerIndex {
  @State count: number = 10000
  //@State myTimerModifier: MyTextTimerModifier = new MyTextTimerModifier()
  countDownTextTimerController: TextTimerController = new TextTimerController()
  countUpTextTimerController: TextTimerController = new TextTimerController()

  build() {
    Row() {
      Column() {
        TextTimer({isCountDown: false, controller: this.countUpTextTimerController})
          //.contentModifier(this.myTimerModifier)
          .onTimer((utc: Long, elapsedTime: Long) => {
            console.info('textTimer onTimer utc is：' + utc + ', elapsedTime: ' + elapsedTime)
          })
          .margin(10)
        Row() {
          Button("start").onClick((e:ClickEvent)=>{
            this.countDownTextTimerController.start()
            this.countUpTextTimerController.start()
          }).margin(10).id("start")
          Button("pause").onClick((e:ClickEvent)=>{
            this.countDownTextTimerController.pause()
            this.countUpTextTimerController.pause()
          }).margin(10)
          Button("reset").onClick((e:ClickEvent)=>{
            this.countDownTextTimerController.reset()
            this.countUpTextTimerController.reset()
          }).margin(10)
        }.margin(20)
      }.width('100%')
    }.height('100%')
  }
}