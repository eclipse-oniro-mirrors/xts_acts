'use static';
/*
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
import { Entry,Column,Component,Button,Video,VideoController,FlexDirection,Flex,ImageFit,Row,ItemAlign,FlexAlign,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Log from '../../common/Log';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct VideoOnFullscreenChange {
  @State srcs: Resource = $rawfile('sucai1.mp4');
  @State currentProgressRates: number = 1;
  @State autoPlays: boolean = false;
  controller: VideoController = new VideoController();

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear VideoOnFullscreenChange start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear VideoOnFullscreenChange end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Video({
        src: this.srcs,
        currentProgressRate: this.currentProgressRates,
        controller: this.controller
      })
        .width(600)
        .height(400)
        .autoPlay(this.autoPlays)
        .key("onFullscreenChangeText")
        .onStart((): void => {
          console.error('onStart');
        })
        .onFullscreenChange((): void => {
          console.log('screen is changed')
          console.info('screen is changed')
          console.error('screen is changed')
          console.warn('screen is changed')
          try {
            let backData: events_emitter.EventData = {
              data: {
                "result": "success"
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60227,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("video_101 onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            err = err as BusinessError
            console.info("video_101 onClick emit action state err: " + JSON.stringify((err as BusinessError)?.message))
          }
        })
        .onPause((): void => {
          console.error('onPause');
        })
        .onFinish((): void => {
          console.error('onFinish');
        })
        .onError((): void => {
          console.error('onFinish');
        })
        .onPrepared((e): void => {
          console.error('onPrepared is ' + e.duration);
        })
        .onSeeking((e): void => {
          console.error('onSeeking is ' + e.time);
        })
        .onSeeked((e): void => {
          console.error('onSeekedis ' + e.time);
        })
        .onUpdate((e): void => {
          console.error('onUpdateis ' + e.time);
        })
      Row() {
        Button("FullScreen")
          .key("fullScreen")
          .onClick((e: ClickEvent) => {
            this.controller.requestFullscreen(true);
            console.info("video_101 onClick start to fullScreen");
          });

        Button("ExitFullScreen")
          .key("exitFullScreen")
          .onClick((e: ClickEvent) => {
            this.controller.exitFullscreen()
          });
      }

      Row() {
        Button("start").onClick((e: ClickEvent) => {
          this.controller.start();
        });
        Button("pause").onClick((e: ClickEvent) => {
          this.controller.pause();
        });
        Button("stop").onClick((e: ClickEvent) => {
          this.controller.stop();
        });
      }

    }.width("100%").height("100%")
  }
}

