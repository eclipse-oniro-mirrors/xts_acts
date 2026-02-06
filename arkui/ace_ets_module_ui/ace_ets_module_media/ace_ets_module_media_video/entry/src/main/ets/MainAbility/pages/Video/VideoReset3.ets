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
struct VideoReset3 {
  @State videoSrc: Resource = $rawfile('sucai2.mp4')
  controller: VideoController = new VideoController()
  @State text1:string = 'text1'
  @State index:number = 0
  @State text2:string = 'text2'


  @State enabledValue:boolean = true

  build() {
    Column({space:2}) {
      Video({
        src: this.videoSrc,
        controller: this.controller
      })
        .width('80%')
        .height('40%')
        .enabled(this.enabledValue)
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

      Row({space:2}) {
        Text(this.text1).id('VideoReset3_text1')
        Text(this.text2).id('VideoReset3_text2')
      }

      Row({space:2}) {
        Button('start').onClick(() => {
          this.controller.start()
        })
          .id('VideoReset3_start')

        Button('reset').onClick(() => {
          this.controller.reset()
          console.log('testTag:' + 'reset' )
        })
          .id('VideoReset3_reset')


        Button('enabled:' + this.enabledValue)
          .onClick(() => {
          this.enabledValue = !this.enabledValue
        })
          .id('VideoReset3_enabled')

      }
    }.width('100%')
  }
}