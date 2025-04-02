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
struct VideoReset14 {
  @State videoSrc: string | Resource = 'https://vd4.bdstatic.com/mda-pm7bte3t6fs50rsh/sc/cae_h264/1702057792414494257/mda-pm7bte3t6fs50rsh.mp4?v_from_s=bdapp-author-nanjing'
  controller: VideoController = new VideoController()
  @State text1:string = 'text1'
  @State index:number = 0
  @State text2:string = 'text2'
  @State timeValue:number = 1


  @State enabledValue:boolean = true

  build() {
    Column({space:5}) {
      Video({
        src: this.videoSrc,
        controller: this.controller
      })
        .width('300vp')
        .height('200vp')
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

      Text(this.text1).id('VideoReset14_text1')
      Text(this.text2).id('VideoReset14_text2')

      Row({space:2}) {
        Button('start').onClick(() => {
          this.controller.start()
        })
          .id('VideoReset14_start')

        Button('reset').onClick(() => {
          this.controller.reset()
          console.log('testTag:' + 'reset' )
        })
          .id('VideoReset14_reset')
      }

      TextInput({placeholder:'time'})
        .id('VideoReset14_textInput')
        .width('300vp')
        .onChange((value)=>{
          this.timeValue = Number(value)
          console.log('testTag:time'+ Number(value));
          this.controller.setCurrentTime(this.timeValue,SeekMode.Accurate)
        })

    }.width('100%')
  }
}