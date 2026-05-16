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
import events_emitter from '@ohos.events.emitter';

// xxx.ets
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
        .onStart(() => {
          let eventData: events_emitter.EventData = {
            data: {
              "action": 'onStart'
            }
          }
          let event: events_emitter.InnerEvent = {
            eventId: 50101,
            priority: events_emitter.EventPriority.LOW
          }
          events_emitter.emit(event, eventData)
        })
        .onPause(() => {
        })
        .onFinish(() => {
          console.info(' onFinish')
        })
        .onError(() => {
          console.info(' onError')
        })
        .onStop(() => {
          console.info(' ETS  onStop')
          let eventData2: events_emitter.EventData = {
            data: {
              "action": 'onStop'
            }
          }
          let event2: events_emitter.InnerEvent = {
            eventId: 50102,
            priority: events_emitter.EventPriority.LOW
          }
          events_emitter.emit(event2, eventData2)
        })
        .onPrepared((e?: DurationObject) => {
          if (e != undefined) {
            console.info(' onPrepared is ' + e.duration)
          }
        })
        .onSeeking((e?: TimeObject) => {
          if (e != undefined) {
            console.info(' onSeeking is ' + e.time)
          }
        })
        .onSeeked((e?: TimeObject) => {
          if (e != undefined) {
            console.info(' onSeeked is ' + e.time)
          }
        })
        .onUpdate((e?: TimeObject) => {
          if (e != undefined) {
            console.info(' onUpdate is ' + e.time)
          }
        })

      Row() {
        Button('start').key('start').onClick(() => {
          this.controller.start() // 开始播放
        }).margin(5)
        Button('pause').key('pause').onClick(() => {
          this.controller.pause() // 暂停播放
        }).margin(5)
        Button('stop').key('stop').onClick(() => {
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