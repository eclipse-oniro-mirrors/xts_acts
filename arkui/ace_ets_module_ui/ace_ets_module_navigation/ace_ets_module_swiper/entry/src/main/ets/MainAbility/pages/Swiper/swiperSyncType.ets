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
import { SwiperDynamicSyncSceneType, SwiperDynamicSyncScene } from '@ohos.arkui.UIContext'

@Entry
@Component
struct sceneTypeFrame {
  private swiperController: SwiperController = new SwiperController()
  private DISPLAY_COUNT: number = 2
  @State backgroundColors: Color[] = [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  private scenes: SwiperDynamicSyncScene[] = []
  private frameRateList: [number,number][][] = [
    [[60,30],[120,60]]
  ]
  private frameRateIndex: number = 0
  private frameRateValue: number = 0
  @State frameRate:ExpectedFrameRateRange = {min:0, max:120, expected: 60}
  @State text1:string = 'setFrameRateRange'

  build() {
    Column({ space: 10 }) {
      Swiper() {
        ForEach(this.backgroundColors, (backgroundColor: Color, index: number) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .fontSize(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(backgroundColor)
        })
      }
      .width('90%')
      .height('40%')
      .id('dynamicSwiper')
      .backgroundColor(Color.Blue)
      .autoPlay(true)
      .onAppear(()=>{
        this.scenes = this.getUIContext().requireDynamicSyncScene('dynamicSwiper') as SwiperDynamicSyncScene[]
        AppStorage.SetOrCreate('requireDynamicSyncScene', this.scenes);
        console.log('scenes length: ' + this.scenes.length)
      })

      Text(this.text1).id('sceneType_swiper')
      Button('set frame').id('sceneType_set')
        .onClick(()=>{
          this.scenes.forEach((scenes: SwiperDynamicSyncScene) => {
            if (scenes.type == SwiperDynamicSyncSceneType.GESTURE) {
              this.frameRateValue = this.frameRateList[this.frameRateIndex][0][0]
              if (this.frameRateValue !== 6666) {
                this.frameRate['expected'] = this.frameRateValue
                scenes.setFrameRateRange(this.frameRate)
                this.text1 += 'Swiper1: ' + this.frameRateValue
              }
            }
            if (scenes.type == SwiperDynamicSyncSceneType.ANIMATION) {
              this.frameRateValue = this.frameRateList[this.frameRateIndex][0][1]
              if (this.frameRateValue !== 6666) {
                this.frameRate['expected'] = this.frameRateValue
                scenes.setFrameRateRange(this.frameRate)
                this.text1 += 'Swiper11: '+ this.frameRateValue
              }
            }
          })

        })
    }
  }
}