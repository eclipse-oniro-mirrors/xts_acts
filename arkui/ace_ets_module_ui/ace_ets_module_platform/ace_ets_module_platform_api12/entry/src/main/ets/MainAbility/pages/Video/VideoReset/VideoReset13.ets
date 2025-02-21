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
@Entry
@Component
struct VideoReset13 {
  @State videoSrc: string | Resource = 'https://vd4.bdstatic.com/mda-pm7bte3t6fs50rsh/sc/cae_h264/1702057792414494257/mda-pm7bte3t6fs50rsh.mp4?v_from_s=bdapp-author-nanjing'
  controller: VideoController = new VideoController()
  @State text1:string = 'text1'
  @State index:number = 0
  @State text2:string = 'text2'

  @State autoPlayValue: boolean = false
  @State loopValue: boolean = false

  build() {
    Column({space:5}) {
      Video({
        src: this.videoSrc,
        controller: this.controller
      })
        .width('300vp')
        .height('200vp')
        .autoPlay(this.autoPlayValue)
        .onPrepared(()=>{
          console.log('testTag:' + 'onPrepared')
        })
        .onStart(() => {
          this.text1 = 'onStart' + (++this.index)
          console.log('testTag:' + 'onStart')
        })
        .onUpdate((event) => {
          this.text2 = '' + event.time
          console.log('testTag:' + 'onUpdate' + event.time)
        })
        .onPause(()=>{
          console.log('testTag:' + 'onPause')
        })

      Text(this.text1).id('VideoReset13_text1')
      Text(this.text2).id('VideoReset13_text2')

      Row({space:2}) {
        Button('start').onClick(() => {
          this.controller.start()
        })
          .id('VideoReset13_start')

        Button('reset').onClick(() => {
          this.controller.reset()
          console.log('testTag:' + 'reset' )
        })
          .id('VideoReset13_reset')

        Button('pause').onClick(() => {
          this.controller.pause()
          console.log('testTag:' + 'pause' )
        })
          .id('VideoReset13_pause')
      }

      Row({space:2}) {
        Button('autoPlay:' + this.autoPlayValue)
          .onClick(() => {
          this.autoPlayValue = !this.autoPlayValue
        })
          .id('VideoReset13_autoPlay')
      }

    }.width('100%')
  }
}