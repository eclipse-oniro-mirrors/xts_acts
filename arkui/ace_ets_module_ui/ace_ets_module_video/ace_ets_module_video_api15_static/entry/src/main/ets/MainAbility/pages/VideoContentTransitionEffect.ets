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
import events_emitter from '@ohos.events.emitter';
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
  Resource,
  Row,
  Text,
  Video,
  VideoController,
  ContentTransitionEffect
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { AsyncCallback, Callback } from '@ohos.base';

@Entry
@Component
struct VideoContentTransitionEffect {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State transitionIndex: number = 0
  @State transitionStr: string[] = ['undefined', 'IDENTITY', 'OPACITY']
  private videoController: VideoController = new VideoController()
  @State showFirstFrame: boolean = false
  @State contentTransition : ContentTransitionEffect | undefined = undefined
  @State str:string = ''

  build() {
    Column() {
      Text(this.str).id('VideoContentTransitionEffect_text')
      Row() {
        Button('ShowFirstFrame')
          .onClick((e: ClickEvent)=>{
            this.showFirstFrame = this.showFirstFrame ? false : true
          })
        Button('ContentTransitionEffect')
          .id('VideoContentTransitionEffect_btn')
          .onClick((e: ClickEvent)=>{
            this.transitionIndex = (this.transitionIndex + 1) % 3
            if (this.transitionIndex == 0) {
              this.contentTransition = undefined
              this.str = 'UNDEFINED'
            } else if (this.transitionIndex == 1) {
              this.contentTransition = ContentTransitionEffect.IDENTITY
              this.str = 'IDENTITY'
            } else {
              this.contentTransition = ContentTransitionEffect.OPACITY
              this.str = 'OPACITY'
            }
          })
      }

      Video({
        src: 'https://vd3.bdstatic.com/mda-pmh5hr95fg6u8u0k/hd/cae_h264/1702877143957184120/mda-pmh5hr95fg6u8u0k.mp4',
        previewUri: 'https://c-ssl.duitang.com/uploads/blog/202011/23/20201123022532_78a5b.jpeg',
        controller: this.videoController,
        posterOptions: {
          showFirstFrame: this.showFirstFrame,
          contentTransitionEffect: this.contentTransition
        }
      })
        .width('100%')
        .height('50%')
        .controls(true)
    }
  }
}
