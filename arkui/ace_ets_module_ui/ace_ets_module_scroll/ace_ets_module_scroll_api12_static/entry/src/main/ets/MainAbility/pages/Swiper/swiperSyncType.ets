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
import { SwiperDynamicSyncSceneType, SwiperDynamicSyncScene, DynamicSyncScene } from '@ohos.arkui.UIContext'
import {
  Entry,
  Component,
  Column,
  SwiperController,
  Color,
  ExpectedFrameRateRange,
  ColumnOptions,
  Swiper,
  Text,
  Button,
  ForEach,
  TextAlign,
  ClickEvent,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct sceneTypeFrame {
  private swiperController: SwiperController = new SwiperController()
  private DISPLAY_COUNT: number = 2
  @State backgroundColors: Color[] = [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  private scenes: SwiperDynamicSyncScene[] = new Array<SwiperDynamicSyncScene>()
  private frameRateList: [int, int][][] = new Array<Array<[int, int]>>(
    [[60, 30], [120, 60]]
  )
  private frameRateIndex: int = 0
  private frameRateValue: int = 0
  @State frameRate: ExpectedFrameRateRange = { min: 0, max: 120, expected: 60 } as ExpectedFrameRateRange
  @State text1: string = 'setFrameRateRange'

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Swiper() {
        ForEach(this.backgroundColors, (backgroundColor: Color, index: int) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .fontSize(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(backgroundColor)
        })
      }
      .width('100%')
      .height('60%')
      .id("dynamicSwiper")
      .backgroundColor(Color.Blue)
      .autoPlay(true, undefined)
      .onAppear(() => {
        let result: Array<DynamicSyncScene> = this.getUIContext().requireDynamicSyncScene("dynamicSwiper");
        let array: Array<SwiperDynamicSyncScene> = result.map((item: DynamicSyncScene) => { return (item as SwiperDynamicSyncScene) });
        this.scenes = array
      })

      Text(this.text1).id('sceneType_swiper')
      Button("set frame").id('sceneType_set')
        .onClick((e: ClickEvent) => {
          this.scenes.forEach((scenes: SwiperDynamicSyncScene) => {
            if (scenes.type == SwiperDynamicSyncSceneType.GESTURE) {
              this.frameRateValue = this.frameRateList[this.frameRateIndex.toInt()][0][0]
              if (this.frameRateValue !== 6666) {
                this.frameRate.expected = this.frameRateValue
                scenes.setFrameRateRange(this.frameRate)
                this.text1 += 'Swiper1: ' + this.frameRateValue
              }
            }
            if (scenes.type == SwiperDynamicSyncSceneType.ANIMATION) {
              this.frameRateValue = this.frameRateList[this.frameRateIndex.toInt()][0][1]
              if (this.frameRateValue !== 6666) {
                this.frameRate.expected = this.frameRateValue
                scenes.setFrameRateRange(this.frameRate)
                this.text1 += 'Swiper11: ' + this.frameRateValue
              }
            }
          })

        })
    }
  }
}