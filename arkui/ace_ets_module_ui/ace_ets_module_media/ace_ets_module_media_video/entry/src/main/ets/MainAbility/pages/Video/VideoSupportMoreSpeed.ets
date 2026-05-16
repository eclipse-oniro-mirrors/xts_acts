/**
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

@Entry
@Component
struct VideoSupportMoreSpeed {
  @State videoSrc: Resource|string = $rawfile('VID_1.mp4');
  @State previewUri: Resource = $r('app.media.icon');
  @State curRate: PlaybackSpeed|string|undefined = undefined;
  @State isAutoPlay: boolean = false;
  @State showControls: boolean = true;
  @State str : string = 'hello'
  controller: VideoController = new VideoController();

  build() {
    Column() {
      Row() {
        Button('start').onClick(() => {
          this.controller.start()
        }).width(65).height(25).id('VideoSupportMoreSpeedStart')
        Text(this.str).width(65).height(25).id('VideoSupportMoreSpeedText')
      }
      Row() {
        Button('p_0.5').onClick(() => {
          this.curRate = PlaybackSpeed.SPEED_FORWARD_0_50_X
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_p_0.5')
        Button('p_1.5').onClick(() => {
          this.curRate = PlaybackSpeed.SPEED_FORWARD_1_50_X
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_p_1.5')
        Button('p_3').onClick(() => {
          this.curRate = PlaybackSpeed.SPEED_FORWARD_3_00_X
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_p_3')
      }
      Row() {
        Button('p_0.25').onClick(() => {
          this.curRate = PlaybackSpeed.SPEED_FORWARD_0_25_X
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_p_0.25')
        Button('p_0.125').onClick(() => {
          this.curRate = PlaybackSpeed.SPEED_FORWARD_0_125_X
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_p_0.125')
        Button('n_0.5').onClick(() => {
          this.curRate = 0.5
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_n_0.5')
      }
      Row() {
        Button('n_1.5').onClick(() => {
          this.curRate = 1.5
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_n_1.5')
        Button('n_3').onClick(() => {
          this.curRate = 3
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_n_3')
        Button('n_0.25').onClick(() => {
          this.curRate = 0.25
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_n_0.25')
      }
      Row() {
        Button('n_0.125').onClick(() => {
          this.curRate = 0.125
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_n_0.125')
        Button('s_0.5').onClick(() => {
          this.curRate = '0.5'
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_s_0.5')
        Button('s_1.5').onClick(() => {
          this.curRate = '1.5'
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_s_1.5')
      }
      Row() {
        Button('s_3').onClick(() => {
          this.curRate = '3'
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_s_3')
        Button('s_0.25').onClick(() => {
          this.curRate = '0.25'
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_s_0.25')
        Button('s_0.125').onClick(() => {
          this.curRate = '0.125'
          this.str= this.curRate.toString()
        }).width(65).height(25).id('VideoSupportMoreSpeed_s_0.125')
      }
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller,
      })
        .width(100)
        .height(40)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)
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
        .onStop(() => {
          console.info('onStop')
        })
        .onPrepared(()=>{
          console.log("etsVideo:onPrepared")
        })
        .onAppear(() => {
          console.log("etsVideo:onAppear")
        })
    }
    .width('100%')
    .height('100%')
  }
}
