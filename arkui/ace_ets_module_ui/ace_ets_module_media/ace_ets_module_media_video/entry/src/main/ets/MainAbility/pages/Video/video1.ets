/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct VideoComponentBC1 {
  @State videoSrc: Resource = $rawfile('sucai1.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()
  @State onStart: string = 'onStart'
  @State onPause: string = 'onPause'
  @State onFinish: string = 'onFinish'
  @State onError: string = 'onError'
  @State onPrepared: string = 'onPrepared'
  @State onSeeking: string = 'onSeeking'
  @State onSeeked: string = 'onSeeked'
  @State onUpdate: string = 'onUpdate'


  build() {
    Column() {
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      })
        .width('100%')
        .height(300)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
        .onStart(() => {
          this.onStart = 'onStart_Doing'
        })
        .onPause(() => {
          this.onPause = 'onPause_Doing'
        })
        .onFinish(() => {
          this.onFinish = 'onFinish_Doing'
        })
          // 播放失败不好整
        .onError(() => {
          this.onError = 'onError_Doing'
        })
          // 视频准备完成时触发该事件，通过duration可以获取视频时长
        .onPrepared((e?: DurationObject) => {
          if (e != undefined) {
            this.onPrepared = `onPrepared_Doing`
          }
        })
          // 操作进度条过程时上报时间信息
        .onSeeking((e?: TimeObject1) => {
          if (e != undefined) {
            this.onSeeking = `onSeeking_Doing`
          }
        })
          // 操作进度条完成后，上报播放时间信息
        .onSeeked((e?: TimeObject1) => {
          if (e != undefined) {
            this.onSeeked = `onSeeked_Doing`
          }
        })
          // 播放进度变化时触发该事件
        .onUpdate((e?: TimeObject1) => {
          if (e != undefined) {
            this.onUpdate = `onUpdate_Doing`
          }
        })


      Column(){Text(this.onStart).fontSize(16).key('onStart')}
      Column(){Text(this.onPause).fontSize(16).key('onPause')}
      Column(){Text(this.onFinish).fontSize(16).key('onFinish')}
      Column(){Text(this.onError).fontSize(16)}
      Column(){Text(this.onPrepared).fontSize(16).key('onPrepared')}
      Column(){Text(this.onSeeking).fontSize(16)}
      Column(){Text(this.onSeeked).fontSize(16)}
      Column(){Text(this.onUpdate).fontSize(16).key('onUpdate')}
      Row() {
        Button('src').onClick(() => {
          this.videoSrc = $rawfile('sucai2.mp4') // 切换视频源
        }).margin(5).key('srcbutton')
        Button('previewUri').onClick(() => {
          this.previewUri = $r('app.media.icon') // 切换视频预览海报
        }).margin(5)
        Button('controls').onClick(() => {
          this.showControls = !this.showControls // 切换是否显示视频控制栏
        }).margin(5)
      }

      Row() {
        Button('start').onClick(() => {
          this.controller.start() // 开始播放
        }).margin(5).key('start')
        Button('pause').onClick(() => {
          this.controller.pause() // 暂停播放
        }).margin(5).key('pause')
        Button('stop').onClick(() => {
          this.controller.stop() // 结束播放
        }).margin(5)
        Button('setTime').onClick(() => {
          this.controller.setCurrentTime(5, SeekMode.Accurate) // 精准跳转到视频的5s位置
        }).margin(5)
      }

      Row() {
        Button('rate 0.75').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_0_75_X // 0.75倍速播放
        }).margin(5)
        Button('rate 1').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_1_00_X // 原倍速播放
        }).margin(5)
        Button('rate 2').onClick(() => {
          this.curRate = PlaybackSpeed.Speed_Forward_2_00_X // 2倍速播放
        }).margin(5)
      }
    }
  }
}

interface DurationObject {
  duration: number;
}

interface TimeObject1 {
  time: number;
}