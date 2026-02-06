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
struct VideoContentTransitionEffect {
  @State videoMuted: boolean = false;
  @State flag: boolean = true
  index: number = 0
  transitionIndex: number = 0
  transitionStr: string[] = ['undefined', 'IDENTITY', 'OPACITY']
  private videoController: VideoController = new VideoController()
  @State showFirstFrame: boolean = false
  @State contentTransition : ContentTransitionEffect | undefined = undefined
  @State str:string = ''

  build() {
    Column() {
      Text(this.str).height(20).id('VideoContentTransitionEffectStr')
      Button('ShowFirstFrame')
        .onClick(()=>{
          this.showFirstFrame = this.showFirstFrame ? false : true
        })
        .height(40)
        .width(120)
      Button('ContentTransitionEffect')
        .id('VideoContentTransitionEffect')
        .onClick(()=>{
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
        .height(40)
        .width(150)
      Video({
        src: 'https://vd3.bdstatic.com/mda-pmh5hr95fg6u8u0k/hd/cae_h264/1702877143957184120/mda-pmh5hr95fg6u8u0k.mp4',
        previewUri: 'https://c-ssl.duitang.com/uploads/blog/202011/23/20201123022532_78a5b.jpeg',
        controller: this.videoController,
        posterOptions: {showFirstFrame: this.showFirstFrame, contentTransitionEffect: this.contentTransition}
      })
        .controls(true)
        .muted(false)
        .height(100)
        .width(180)
        .onPause(() => {
          this.videoMuted = true
        })
        .objectFit(ImageFit.Fill)
    }
    .width('100%')
  }
}
