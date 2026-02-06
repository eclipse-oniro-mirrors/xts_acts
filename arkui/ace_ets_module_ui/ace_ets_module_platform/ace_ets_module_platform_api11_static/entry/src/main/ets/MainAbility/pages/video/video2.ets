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
import { Entry,Column,Component,Button,Video,VideoController,ImageFit,Row,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';

interface EventMessage {
  progressRates: number
  isStared: number
  isStopped: number
}

@Entry
@Component
struct VideoCreateComponent {
  @State srcs: string = "/images/trailer.mp4";
  @State previewUris: string = "/images/img.jpeg";
  @State currentProgressRates: number = 1;
  @State autoPlays: boolean = true;
  @State controlsss: boolean = true;
  myVideoController: VideoController = new VideoController();
  @State startStaus: boolean = true;

  onPageShow() {
    console.info('[list] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 235,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[stateChangCallBack] video stateChangCallBack");
    if (eventData != null) {
      console.info("[stateChangCallBack] state change called:" + JSON.stringify(eventData));
    if ((eventData.data as EventMessage)?.progressRates != null) {
      this.currentProgressRates = (eventData.data as EventMessage).progressRates;
      console.info("currentProgressRates " + this.currentProgressRates)
    }
    if ((eventData.data as EventMessage)?.isStared != null) {
      this.myVideoController.start();
    }
    if ((eventData.data as EventMessage)?.isStopped != null) {
      this.myVideoController.stop();
    }
  }
}

  build() {
    Column() {
      Video({
        src: this.srcs,
        previewUri: this.previewUris,
        currentProgressRate: this.currentProgressRates,
        controller: this.myVideoController
      })
        .key("video")
        .width(700)
        .height(500)
        .autoPlay(this.autoPlays)
        .controls(this.controlsss)

      Row() {
        Button("start").onClick((e: ClickEvent) => {
          this.myVideoController.start();
        });
        Button("pause").onClick((e: ClickEvent) => {
          this.myVideoController.pause();
        });
        Button("stop").onClick((e: ClickEvent) => {
          this.myVideoController.stop();
        });
      }

      Row() {
        Button("setCurrentTime").onClick((e: ClickEvent) => {
          this.myVideoController.setCurrentTime(9, SeekMode.Accurate);
        });
      }
    }
  }
}
