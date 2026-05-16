/*
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

import { SwiperDynamicSyncSceneType, SwiperDynamicSyncScene } from '@ohos.arkui.UIContext';

@Entry
@Component
struct setGetFrameRateRange {
  @State ANIMATION:ExpectedFrameRateRange = {min:0, max:120, expected: 90}
  @State GESTURE:ExpectedFrameRateRange = {min:0, max:120, expected: 30}
  private scenes: SwiperDynamicSyncScene[] = []
  @State setFlag: string = 'init'
  @State getFlag: string = 'init'
  @State requireFlag: string = 'init'

  build() {
    Column({ space: 5 }) {
      Text("动画"+ JSON.stringify(this.ANIMATION))
      Text("跟手"+ JSON.stringify(this.GESTURE))
      Row(){
        Swiper() {
          Text("one")
          Text("two")
          Text("three")
        }
        .width('100%')
        .height('300vp')
        .id('dynamicSwiper_id')
        .backgroundColor(Color.Blue)
        .autoPlay(true)
        .onAppear(()=>{
          this.scenes = this.getUIContext().requireDynamicSyncScene("dynamicSwiper_id") as SwiperDynamicSyncScene[]
          if(this.scenes){
            this.requireFlag = 'requireDynamicSyncScene succ'
          }
        })
      }
      Button(this.requireFlag).id('requireDynamicSyncScene_id')
      Button(this.setFlag).id('setGetFrameRateRange_id')
      Button(this.getFlag).id('getGetFrameRateRange_id')
        .onClick(()=>{
          this.scenes.forEach((scenes: SwiperDynamicSyncScene) => {
            if (scenes.type == undefined) {
              scenes.setFrameRateRange(this.ANIMATION)
              this.setFlag = 'setFrameRateRange succ'
              this.getFlag = '' + JSON.stringify(scenes.getFrameRateRange())
            }
            if (scenes.type == SwiperDynamicSyncSceneType.ANIMATION) {
              scenes.setFrameRateRange(this.ANIMATION)
              this.setFlag = 'setFrameRateRange succ'
              this.getFlag = '' + JSON.stringify(scenes.getFrameRateRange())
            }
            if (scenes.type == SwiperDynamicSyncSceneType.GESTURE) {
              scenes.setFrameRateRange(this.GESTURE)
              this.setFlag = 'setFrameRateRange succ'
              this.getFlag = '' + JSON.stringify(scenes.getFrameRateRange())
            }
          });
        })
    }
  }
}