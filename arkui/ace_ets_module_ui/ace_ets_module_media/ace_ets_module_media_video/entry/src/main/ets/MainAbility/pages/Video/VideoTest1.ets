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

@Entry
@Component
struct VideoTest1 {
  @State videoSrc: Resource = $rawfile('test2.mp4')
  @State showControls: boolean = true
  controller: VideoController = new VideoController()
  config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT]
  }
  @State text:string = ''

  build() {
    Column({space:5}) {
      Text(this.text).id('VideoTest1_text')

      Video({
        src: this.videoSrc,
        controller: this.controller
      })
        .width('200vp')
        .height('100vp')
        .enableAnalyzer(true)
        .analyzerConfig(this.config)
        .onStart(() => {
          console.info('onStart')
        })
        .onStop(() => {
          this.text = 'onStop'
        })

      Row() {
        Button('start').onClick(() => {
          this.controller.start()
        })
          .height(25)
          .margin(5)
          .id('VideoTest1_start')

        Button('stop').onClick(() => {
          this.controller.stop()
        })
          .height(25)
          .margin(5)
          .id('VideoTest1_stop')
      }
    }
    .height('100%')
    .width('100%')
  }
}