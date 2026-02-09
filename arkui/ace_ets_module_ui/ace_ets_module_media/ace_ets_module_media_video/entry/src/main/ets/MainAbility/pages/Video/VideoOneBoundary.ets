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
struct VideoOneBoundary {
  @State videoSrc: Resource|string = $rawfile('VID_1.mp4');
  @State previewUri: Resource = $r('app.media.icon');
  @State curRate: PlaybackSpeed|string|undefined = undefined;
  @State isAutoPlay: boolean = false;
  @State showControls: boolean = true;
  @State str : string = 'hello'
  controller: VideoController = new VideoController();

  build() {
    Column({space:3}) {
      Row() {
        Text(this.str).height(25).id('VideoOneBoundaryText')
      }
      Row() {
        Button('start').onClick(() => {
          this.controller.start()
        }).width(65).height(25).id('VideoOneBoundaryStart')
      }
      Row() {
        Button('setTime_0').onClick(() => {
          this.controller.setCurrentTime(0);
          this.str = '0'
        })
          .width(80)
          .height(25)
          .id('setCurrentTime_0')
        Button('setTime_-1').onClick(() => {
          this.controller.setCurrentTime(-1);
          this.str = '-1'
        })
          .width(80)
          .height(25)
          .id('setCurrentTime_-1')
      }
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller,
      })
        .width(180)
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
          console.log('etsVideo:onPrepared')
        })
        .onAppear(() => {
          console.log('etsVideo:onAppear')
        })
    }
    .width('100%')
    .height('100%')
  }
}