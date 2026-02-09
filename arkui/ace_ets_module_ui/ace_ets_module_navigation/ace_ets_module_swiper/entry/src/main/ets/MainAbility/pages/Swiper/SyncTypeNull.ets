/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { SwiperDynamicSyncScene } from '@ohos.arkui.UIContext'

@Entry
@Component
struct sceneTypeFrameNull {
  @State backgroundColors: Color[] = [Color.Green, Color.Blue, Color.Yellow]
  private scenes: SwiperDynamicSyncScene[] = []

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
      .id('syncSceneSwiper')
      .backgroundColor(Color.Blue)
      .autoPlay(true)
      .onAppear(()=>{
        this.scenes = this.getUIContext().requireDynamicSyncScene('Swiper') as SwiperDynamicSyncScene[]
        AppStorage.SetOrCreate('requireDynamicSyncScene', this.scenes);
        console.log('scenes length: ' + this.scenes.length)
      })
    }
  }
}