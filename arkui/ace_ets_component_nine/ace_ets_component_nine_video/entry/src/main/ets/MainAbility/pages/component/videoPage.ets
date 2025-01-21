// @ts-nocheck
/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

class MyVideoMutedModifier implements AttributeModifier<VideoAttribute> {
  isMuted: boolean = false
  isAutoPlay: boolean = false
  showControls: boolean = true
  mObjectFit: ImageFit = ImageFit.Cover
  isLoop: boolean = false
  applyNormalAttribute(instance: VideoAttribute): void {
    instance.muted(this.isMuted);
    instance.autoPlay(this.isAutoPlay);
    instance.controls(this.showControls);
    instance.objectFit(this.mObjectFit);
    instance.loop(this.isLoop);
  }
}

@Entry
@Component
struct VideoExample {
  @State message: string = 'video'
  @State mod: MyVideoMutedModifier = new MyVideoMutedModifier()

  @State videoSrc: Resource = $rawfile('video1.mp4')
  @State previewUri: Resource = $r('app.media.bg')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isMuted: boolean = false  //是否静音。默认值：false
  @State isAutoPlay: boolean = false //是否自动播放。默认值：false
  @State showControls: boolean = true //控制视频播放的控制栏是否显示。默认值：true
  @State mObjectFit: ImageFit = ImageFit.Cover //设置视频显示模式。默认值：Cover
  @State isLoop: boolean = false //是否单个视频循环播放。默认值：false
  @State numObjectFit: number = 0
  controller: VideoController = new VideoController()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("Video page state change called:" + JSON.stringify(eventData));
      if (eventData.data.isMuted != null) {
        this.mod.isMuted = eventData.data.isMuted;
        //old test
        this.isMuted = eventData.data.isMuted;
      } else if (eventData.data.isAutoPlay != null) {
        this.mod.isAutoPlay = eventData.data.isAutoPlay;
        //old test
        this.isAutoPlay = eventData.data.isAutoPlay;
      } else if (eventData.data.showControls != null) {
        this.mod.showControls = eventData.data.showControls;
        //old test
        this.showControls = eventData.data.showControls;
      } else if (eventData.data.mObjectFit != null) {
        this.mod.mObjectFit = eventData.data.mObjectFit;
        //old test
        this.mObjectFit = eventData.data.mObjectFit;
      } else if (eventData.data.isLoop != null) {
        this.mod.isLoop = eventData.data.isLoop;
        //old test
        this.isLoop = eventData.data.isLoop;
      }
    }
  }

  onPageShow() {
    console.info('video page1 show called');
    var stateChangeEvent = {
      eventId: 301,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    var stateChangeEvent2 = {
      eventId: 302,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    var stateChangeEvent3 = {
      eventId: 303,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    var stateChangeEvent4 = {
      eventId: 304,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    var stateChangeEvent5 = {
      eventId: 305,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
  }

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(9).width('90%').fontColor(0xCCCCCC)
        Video({
          src: this.videoSrc,
          previewUri: this.previewUri,
          currentProgressRate: this.curRate,
          controller: this.controller
        })
          .width('100%')
          .height(380)
          .key('keykeyvideo')
          // .muted(this.isMuted)
          // .autoPlay(this.isAutoPlay)
          // .controls(this.showControls)
          // .objectFit(this.mObjectFit)
          // .loop(this.isLoop)
          .attributeModifier(this.mod)
          .onStart(() => {
            console.info('onStart')
          })
          .onPause(() => {
            console.info('onPause')
          })
          .onFinish(() => {
            console.info('onFinish')
          })
          .onError(() => {
            console.info('onError')
          })
        Text('muted：是否静音。默认值：false')
          .fontSize(19)
          .fontColor(0x000000)
          .width('90%')
          .margin({ top: 10 })
        Text('autoPlay：是否自动播放。默认值：false')
          .fontSize(19)
          .fontColor(0x000000)
          .width('90%')
          .margin({ top: 5 })
        Text('controls：控制视频播放的控制栏是否显示。默认值：true')
          .fontSize(19)
          .fontColor(0x000000)
          .width('90%')
          .margin({ top: 5 })
        Text('objectFit：设置视频显示模式。默认值：Cover')
          .fontSize(19)
          .fontColor(0x000000)
          .width('90%')
          .margin({ top: 5 })
        Text('loop：是否单个视频循环播放。')
          .fontSize(19)
          .fontColor(0x000000)
          .width('90%')
          .margin({ top: 5 })
        GridRow({columns: 3}) {
          GridCol() {
            Button('muted:' + this.isMuted).onClick(() => {
              this.isMuted = !this.isMuted // 是否静音
              this.mod.isMuted = this.isMuted;
            }).margin(5)
          }
          GridCol() {
            Button('autoPlay:' + this.isAutoPlay).onClick(() => {
              this.isAutoPlay = !this.isAutoPlay // 是否自动播放
              this.mod.isAutoPlay = this.isAutoPlay;
            }).margin(5)
          }
          GridCol() {
            Button('controls:' + this.isAutoPlay).onClick(() => {
              this.showControls = !this.showControls // 控制视频播放的控制栏是否显示
              this.mod.showControls = this.showControls;
            }).margin(5)
          }
          GridCol() {
            Button('objectFit：' + this.numObjectFit).onClick(() => {
              this.numObjectFit = (this.numObjectFit + 1) % 6;
              if (this.numObjectFit == 0) {
                this.mObjectFit = ImageFit.Contain // 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。
              } else if (this.numObjectFit == 1) {
                this.mObjectFit = ImageFit.Cover // 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。
              } else if (this.numObjectFit == 2) {
                this.mObjectFit = ImageFit.Auto // 自适应显示
              } else if (this.numObjectFit == 3) {
                this.mObjectFit = ImageFit.Fill // 	不保持宽高比进行放大缩小，使得图片充满显示边界。
              } else if (this.numObjectFit == 4) {
                this.mObjectFit = ImageFit.ScaleDown //保持宽高比显示，图片缩小或者保持不变。
              } else if (this.numObjectFit == 5) {
                this.mObjectFit = ImageFit.ScaleDown //保持原有尺寸显示。
              }
              this.mod.mObjectFit = this.mObjectFit;
            }).margin(5)
          }
          GridCol() {
            Button('loop:' + this.isLoop).onClick(() => {
              this.isLoop = !this.isLoop // 是否单个视频循环播放
              this.mod.isLoop = this.isLoop;
            }).margin(5)
          }
        }

      }
      .width('100%')
    }
  }
}