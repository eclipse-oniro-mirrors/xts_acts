'use static';
/**
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

import {
  Entry, Text, Column, Component, Button, ClickEvent, Video, Resource, $rawfile, Row, VideoController,
  SeekMode, ImageFit
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct VideoUndefined {
  @State videoSrc: Resource | string = $rawfile('videoTest.mp4');
  controller: VideoController = new VideoController();
  @State eventValue: string = 'value';
  @State isOnUpdate: boolean = false;
  @State isOnPrepared: boolean = false;
  @State isOnFullscreenChange: boolean = false;
  @State isOnFinish: boolean = false;
  @State isOnPause: boolean = false;
  @State isOnStart: boolean = false;
  @State isOnStop: boolean = false;
  @State isLoop: boolean = false;
  @State isMuted: boolean = false;
  @State isAutoPlay: boolean = false;
  @State isControls: boolean = false;
  @State isObjectFit: boolean = false;

  build() {
    Column() {
      Text('action Video')
      Video({
        src: this.videoSrc,
        controller: this.controller,
      })
        .id('video_action')
        .width('80%')
        .height('30%')
        .onUpdate(this.isOnUpdate ? () => {
          this.eventValue = 'onUpdateValue';
        } : undefined)
        .onPrepared(this.isOnPrepared ? () => {
          this.eventValue = 'onPreparedValue';
        } : undefined)
        .onFullscreenChange(this.isOnFullscreenChange ? () => {
          this.eventValue = 'onFullscreenChangeValue';
        } : undefined)
        .onFinish(this.isOnFinish ? () => {
          this.eventValue = 'onFinishValue';
        } : undefined)
        .onPause(this.isOnPause ? () => {
          this.eventValue = 'onPauseValue';
        } : undefined)
        .onStart(this.isOnStart ? () => {
          this.eventValue = 'onStartValue';
        } : undefined)
        .onStop(this.isOnStop ? () => {
          this.eventValue = 'onStopValue';
        } : undefined)
        .loop(this.isLoop ? true : undefined)
        .muted(this.isMuted ? true : undefined)
        .autoPlay(this.isAutoPlay ? true : undefined)
        .controls(this.isControls ? false : undefined)
        .objectFit(this.isObjectFit ? ImageFit.Contain : undefined)

      Row() {
        Text(this.eventValue)
          .id('eventValue')
        Button('resetValue').onClick((event: ClickEvent) => {
          this.eventValue = 'value';
        }).margin(5).id('reset')
      }

      Row() {
        Button('0').onClick((event: ClickEvent) => {
          this.controller.setCurrentTime(5, SeekMode.Accurate);
          this.controller.reset();
        }).margin(5).id('onUpdate')
        Button('1').onClick((event: ClickEvent) => {
          if (this.videoSrc == 'videoError.mp4') {
            this.videoSrc = $rawfile('videoTest.mp4');
          } else {
            this.videoSrc = 'videoError.mp4';
          }
        }).id('onPrepared')
        Button('2').onClick((event: ClickEvent) => {
          this.controller.requestFullscreen(true);
          this.controller.exitFullscreen();
        }).margin(5).id('onFullscreenChange')
        Button('3').onClick((event: ClickEvent) => {
          this.controller.setCurrentTime(8, SeekMode.Accurate);
          this.controller.start();
        }).margin(5).id('onFinish')
        Button('4').onClick((event: ClickEvent) => {
          this.controller.pause();
        }).margin(5).id('onPause')
        Button('5').onClick((event: ClickEvent) => {
          this.controller.reset();
          this.controller.start();
        }).margin(5).id('onStart')
        Button('6').onClick((event: ClickEvent) => {
          this.controller.stop();
        }).margin(5).id('onStop')
      }

      Row() {
        Button('0' + this.isOnUpdate).onClick((event: ClickEvent) => {
          this.isOnUpdate = !this.isOnUpdate;
        }).margin(5).id('onUpdate_action')
        Button('1' + this.isOnPrepared).onClick((event: ClickEvent) => {
          this.isOnPrepared = !this.isOnPrepared;
        }).margin(5).id('onPrepared_action')
        Button('2' + this.isOnFullscreenChange).onClick((event: ClickEvent) => {
          this.isOnFullscreenChange = !this.isOnFullscreenChange;
        }).margin(5).id('onFullscreenChange_action')
        Button('3' + this.isOnFinish).onClick((event: ClickEvent) => {
          this.isOnFinish = !this.isOnFinish;
        }).margin(5).id('onFinish_action')
      }

      Row() {
        Button('4' + this.isOnPause).onClick((event: ClickEvent) => {
          this.isOnPause = !this.isOnPause;
        }).margin(5).id('onPause_action')
        Button('5' + this.isOnStart).onClick((event: ClickEvent) => {
          this.isOnStart = !this.isOnStart;
        }).margin(5).id('onStart_action')
        Button('6' + this.isOnStop).onClick((event: ClickEvent) => {
          this.isOnStop = !this.isOnStop;
        }).margin(5).id('onStop_action')
        Button('7' + this.isLoop).onClick((event: ClickEvent) => {
          this.isLoop = !this.isLoop;
        }).margin(5).id('loop_action')
      }

      Row() {
        Button('8' + this.isMuted).onClick((event: ClickEvent) => {
          this.isMuted = !this.isMuted;
        }).margin(5).id('muted_action')
        Button('9' + this.isAutoPlay).onClick((event: ClickEvent) => {
          this.isAutoPlay = !this.isAutoPlay;
        }).margin(5).id('autoPlay_action')
        Button('10' + this.isControls).onClick((event: ClickEvent) => {
          this.isControls = !this.isControls;
        }).margin(5).id('controls_action')
        Button('11' + this.isObjectFit).onClick((event: ClickEvent) => {
          this.isObjectFit = !this.isObjectFit;
        }).margin(5).id('objectFit_action')
      }
    }
    .width('100%')
    .height('100%')
  }
}