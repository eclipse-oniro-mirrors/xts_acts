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
struct VideoTest2 {
  @State videoSrc: Resource = $rawfile('sucai2.mp4')
  @State showControls: boolean = true
  controller: VideoController = new VideoController()
  @State text: string = ''

  build() {
    Column() {
      Video({
        src: this.videoSrc,
        controller: this.controller,
        imageAIOptions: {
          types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
        }
      })
        .width('200vp')
        .height('100vp')
        .enableAnalyzer(true)
        .onStart(() => {
          console.info('onStart')
          this.text = 'onStart'
        })
        .onPause(() => {
          console.info('onPause')
        })

      Text(this.text).id('VideoTest2_text').height(25)

      Row() {
        Button('start').onClick(() => {
          this.controller.start()
        }).margin(5).id('VideoTest2_start').height(25)

        Button('pause').onClick(() => {
          this.controller.pause()
        }).margin(5).height(25)
      }
    }
    .width('100%')
    .height('100%')
  }
}