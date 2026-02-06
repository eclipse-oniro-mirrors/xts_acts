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
import {
  Entry,
  Column,
  Component,
  Button,
  FlexAlign,
  VideoController,
  ImageFit,
  Video,
  VerticalAlign,
  ImageAnalyzerType,
  ColumnOptions,
  Row,
  RowOptions,
  ClickEvent,
  SeekMode,
  PlaybackSpeed,
  Resource,
  Text,
  $rawfile,
  $r,
  ImageAnalyzerConfig
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct VideoReset6 {
  @State videoSrc: Resource = $rawfile('sucai2.mp4')
  controller: VideoController = new VideoController()
  @State text1:string = 'text1'
  @State index:number = 0
  @State text2:string = 'text2'
  @State text3:string = 'text3'

  @State autoPlayValue: boolean = false
  @State loopValue: boolean = false

  build() {
    Column({space:2} as ColumnOptions) {
      Video({
        src: this.videoSrc,
        controller: this.controller
      })
        .width('80%')
        .height('40%')
        .autoPlay(this.autoPlayValue)
        .onPrepared(():void =>{
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
        .onFinish(()=>{
          this.text3 = 'onFinish'
          console.log('testTag:' + 'onFinish')
        })

      Row({space:2} as RowOptions) {
        Text(this.text1).id('VideoReset6_text1')
        Text(this.text2).id('VideoReset6_text2')
        Text(this.text3).id('VideoReset6_text3')
      }


      Row({space:2} as RowOptions) {
        Button('start').onClick((e:ClickEvent) => {
          this.controller.start()
        })
          .id('VideoReset6_start')

        Button('reset').onClick((e:ClickEvent) => {
          this.controller.reset()
          console.log('testTag:' + 'reset' )
        })
          .id('VideoReset6_reset')
      }

      Row({space:2} as RowOptions) {
        Button('autoPlay:' + this.autoPlayValue)
          .onClick((e:ClickEvent) => {
          this.autoPlayValue = !this.autoPlayValue
        })
          .id('VideoReset6_autoPlay')
      }

    }.width('100%')
  }
}