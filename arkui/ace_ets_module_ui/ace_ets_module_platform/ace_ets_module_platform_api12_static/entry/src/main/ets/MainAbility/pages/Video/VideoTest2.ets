'use static';
/*
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
import { Entry,Column,Component,Button,FlexAlign,VideoController,ImageFit,Video,VerticalAlign,ImageAnalyzerType,ColumnOptions,Row,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

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
        .width('300vp')
        .height('200vp')
        .enableAnalyzer(true)
        .onStart((): void => {
          console.info('onStart')
          this.text = 'onStart'
        })
        .onPause((): void  => {
          console.info('onPause')
        })

      Text(this.text).id('VideoTest2_text')

      Row() {
        Button('start').onClick((e: ClickEvent) => {
          this.controller.start()
        }).margin(5).id('VideoTest2_start')

        Button('pause').onClick((e: ClickEvent) => {
          this.controller.pause()
        }).margin(5)


      }
    }.width('100%')
  }
}