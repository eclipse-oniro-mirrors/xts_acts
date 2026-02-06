'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
import {
  $r,
  $rawfile,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  PlaybackInfo,
  PlaybackSpeed,
  PreparedInfo,
  Resource,
  Row,
  Text,
  Video,
  VideoController
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { AsyncCallback, Callback } from '@ohos.base';
import { RecordData } from '@ohos.base';


@Entry
@Component
struct videoCallbackTest {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()

  build() {
    Column() {
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      })
        .width('100%')
        .height('50%')
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart((): void => {
          let eventData: emitter.EventData = {
            data: {
              "action": 'onStart'
            } as Record<String,RecordData>
          } as emitter.EventData
          let event: emitter.InnerEvent = {
            eventId: 50101,
            priority: emitter.EventPriority.LOW
          }
          emitter.emit(event, eventData)
        })
        .onPause((): void => {
        })
        .onFinish((): void => {
          console.info(' onFinish')
        })
        .onStop((): void => {
          console.info(' ETS  onStop')
          let eventData2: emitter.EventData = {
            data: {
              "action": 'onStop'
            } as Record<String,RecordData>
          } as emitter.EventData
          let event2: emitter.InnerEvent = {
            eventId: 50102,
            priority: emitter.EventPriority.LOW
          }
          emitter.emit(event2, eventData2)
        })
        .onPrepared((e: PreparedInfo): void => {
          if (e != undefined) {
            console.info(' onPrepared is ' + e.duration)
          }
        } as Callback<PreparedInfo>)
        .onSeeking((e: PlaybackInfo): void => {
          if (e != undefined) {
            console.info(' onSeeking is ' + e.time)
          }
        } as Callback<PlaybackInfo>)
        .onSeeked((e: PlaybackInfo): void => {
          if (e != undefined) {
            console.info(' onSeeked is ' + e.time)
          }
        } as Callback<PlaybackInfo>)
        .onUpdate((e: PlaybackInfo): void => {
          if (e != undefined) {
            console.info(' onUpdate is ' + e.time)
          }
        } as Callback<PlaybackInfo>)

      Row() {
        Button('start').key('start').onClick((e: ClickEvent) => {
          this.controller.start() // 开始播放
        }).margin(5)
        Button('pause').key('pause').onClick((e: ClickEvent) => {
          this.controller.pause() // 暂停播放
        }).margin(5)
        Button('stop').key('stop').onClick((e: ClickEvent) => {
          this.controller.stop() // 结束播放
        }).margin(5)
      }
    }
  }
}

interface DurationObject {
  duration: number;
}

interface TimeObject {
  time: number;
}