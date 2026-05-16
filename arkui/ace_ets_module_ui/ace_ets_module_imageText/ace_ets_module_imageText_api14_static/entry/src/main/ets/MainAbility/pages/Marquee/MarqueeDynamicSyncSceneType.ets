'use static';
/**
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
import { MarqueeDynamicSyncSceneType, MarqueeDynamicSyncScene ,DynamicSyncScene } from '@ohos.arkui.UIContext';
import { Entry,FlexDirection,ItemAlign,TextClock,Margin,MarqueeUpdateStrategy,FlexAlign,Marquee,Flex,TextClockController,ExpectedFrameRateRange,
  Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent,Image,ImageFit } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct MarqueeDynamicSyncSceneTypeExample {
  @State start: boolean = false
  @State src: string = ''
  @State marqueeText: string = 'Running Marquee'
  private fromStart: boolean = true
  private step: number = 10
  private loop: number = Number.POSITIVE_INFINITY
  controller: TextClockController = new TextClockController()
  convert2time(value: Long): string{
    let date = new Date(value+'000');
    let hours = String(date.getHours()).padStart(2, '0');
    let minutes = String(date.getMinutes()).padStart(2, '0');
    let seconds = String(date.getSeconds()).padStart(2, '0');
    return hours+ ':' + minutes + ':' + seconds;
  }
  @State ANIMATION: ExpectedFrameRateRange = {min:0, max:120, expected:30} as ExpectedFrameRateRange
  private scenes: MarqueeDynamicSyncScene[] = [] as MarqueeDynamicSyncScene[]

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Marquee({
        start: this.start,
        step: this.step,
        loop: Number.parseInt(this.loop.toString()).toInt(),
        fromStart: this.fromStart,
        src: this.marqueeText + this.src
      })
        .marqueeUpdateStrategy(MarqueeUpdateStrategy.PRESERVE_POSITION)
        .width('80%')
        .height('10%')
        .fontColor('#FFFFFF')
        .fontSize(50)
        .fontWeight(700)
        .backgroundColor('#182431')
        .margin({ bottom: 2 } as Margin)
        .id('dynamicMarquee_type')
        .onAppear(() :void =>{
          let result: Array<DynamicSyncScene> = this.getUIContext().requireDynamicSyncScene("dynamicMarquee_type");
          let array: Array<MarqueeDynamicSyncScene> = result.map((item: DynamicSyncScene) => { return (item as MarqueeDynamicSyncScene) });
          this.scenes = array
          // this.scenes = this.getUIContext().requireDynamicSyncScene('dynamicMarquee_type') as MarqueeDynamicSyncScene[]
        })

      Button('Start')
        .onClick(():void => {
          this.start = true
          this.controller.start()
          this.scenes.forEach((scenes: MarqueeDynamicSyncScene) => {
            if (scenes.type == MarqueeDynamicSyncSceneType.ANIMATION) {
              AppStorage.setOrCreate<string>('MarqueeDynamicSyncSceneType', 'ANIMATION')
              scenes.setFrameRateRange(this.ANIMATION)
            }
          });
        })
        .width('50%')
        .height('5%')
        .fontSize(16)
        .fontWeight(500)

      TextClock({ timeZoneOffset: -8, controller: this.controller } )
        .format('hms')
        .onDateChange((value: Long) => {
          this.src = this.convert2time(value) + AppStorage.get<string>('MarqueeDynamicSyncSceneType');
        })
        .margin(1)
        .fontSize(30)
    }
    .width('100%')
    .height('100%')
  }
}
