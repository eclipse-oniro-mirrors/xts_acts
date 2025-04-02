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

import { MarqueeDynamicSyncScene } from '@ohos.arkui.UIContext'

@Entry
@Component
struct Frame {
  @State start: boolean = false
  @State setFlag: string = 'init'
  @State getFlag: string = 'init'
  @State requireFlag: string = 'init'
  private scenes: MarqueeDynamicSyncScene[] = []

  build() {
    Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start}) {
      Text('跑马灯1')
        .padding({bottom: 10})
        .backgroundColor('#FFFFCC')
      Marquee({
        start: this.start,
        loop: Number.POSITIVE_INFINITY,
        src: 'ABCDEFGHIJKLMNabcdefghijklmn',
      })
        .key('maquee_frame')
        .fontSize(60)
        .height(80)
        .fontColor('#FFFFFF')
        .fontWeight(FontWeight.Bolder)
        .backgroundColor('#182431')
        .margin({bottom: 20})
        .id('dynamicMarquee')
        .onAppear(() => {
          this.scenes = this.getUIContext().requireDynamicSyncScene('dynamicMarquee') as MarqueeDynamicSyncScene[]
          if (this.scenes) {
            this.requireFlag = 'MarqueerequireDynamicSyncScene succ'
          }
        })

      Column() {
        Button(this.requireFlag).id('MarqueerequireDynamicSyncScene_id')
        Button(this.setFlag).id('MarqueesetGetFrameRateRange_id')
        Button(this.getFlag)
          .key('MarqueegetGetFrameRateRange_id')
          .onClick(() => {
            this.start = true
            this.scenes.forEach((scenes: MarqueeDynamicSyncScene) => {
              scenes.setFrameRateRange({ min: 0, max: 120, expected: 30 })
              this.setFlag = 'MarqueesetFrameRateRange succ'
              this.getFlag = '' + JSON.stringify(scenes.getFrameRateRange())
            })
          })
      }
    }
  }
}