/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct videoApiNullUndefined {
  @State videoSrc: Resource = $rawfile('video.mp4');
  controller: VideoController = new VideoController();
  config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT]
  }
  private aiController: ImageAnalyzerController = new ImageAnalyzerController();
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  }

  build() {
    Column() {
      Video({
        src: this.videoSrc,
        controller: this.controller,
        imageAIOptions: this.options
      })
        .id('videoApiNullUndefinedFirst')
        .width(180)
        .height(50)
        .controls(true)
        .objectFit(null)
        .onError(null)
        .enableAnalyzer(true)
        .analyzerConfig(null)
        .enableShortcutKey(true)

      Row() {
        Button('start').onClick(() => {
          this.controller.start();
        }).id('videoStartVideo').width(65).height(20)
        Button('Null').onClick(() => {
          this.controller.setCurrentTime(null)
          this.controller.setCurrentTime(null,null)
        }).id('videoSetCurrentTimeNull').width(65).height(20)
        Button('Undefined').onClick(() => {
          this.controller.setCurrentTime(undefined)
          this.controller.setCurrentTime(undefined,undefined)
        }).id('videoSetCurrentTimeUndefined').width(65).height(20)
      }

      Row() {
        Button('False').onClick(() => {
          this.controller.requestFullscreen(false);
        }).id('videoRequestFullscreenFalse').width(65).height(20)
      }
      Video({
        src: this.videoSrc,
        controller: this.controller,
        imageAIOptions: this.options
      })
        .id('videoApiNullUndefinedSecond')
        .width(180)
        .height(50)
        .controls(false)
        .objectFit(undefined)
        .onError(undefined)
        .enableAnalyzer(false)
        .analyzerConfig(undefined)
        .enableShortcutKey(false)
    }.width('100%').height('100%')
  }
}
