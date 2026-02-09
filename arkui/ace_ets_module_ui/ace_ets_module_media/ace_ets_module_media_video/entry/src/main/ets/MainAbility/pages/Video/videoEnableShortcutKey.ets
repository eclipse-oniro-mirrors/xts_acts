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

// xxx.ets
@Entry
@Component
struct videoEnableShortcutKey {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State isLoop: boolean = false
  @State showControls: boolean = true
  @State enableShortcutKey: boolean = true
  @State content: string = 'init'
  @State content2: string = '0'
  controller: VideoController = new VideoController()

  build() {
    Column() {
      Text(this.content).key('videoEnableShortcutKey_text')
      Text(this.content2).key('videoEnableShortcutKey_text2')
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      })
        .width('100%')
        .height('50%')
        .autoPlay(this.isAutoPlay)
        .loop(this.isLoop)
        .controls(this.showControls)
        .enableShortcutKey(this.enableShortcutKey)
        .focusable(true)
        .defaultFocus(true) // Video聚焦时快捷键才生效
        .key('videoEnableShortcutKey_video')
        .onStart(() => {
          this.content = 'onStart'
        })
        .onPause(() => {
          this.content = 'onPause'
        })
        .onUpdate((e?: TimeObject) => {
          if (e != undefined) {
            console.info('onUpdate is ' + e.time)
            this.content2 = e.time.toString()
          }
        })

      Row() {
        Button('reset').key('videoEnableShortcutKey_reset').onClick(() => {
          this.controller.reset() // 重置
        })
      }

      Row() {
        Button('change_1').key('videoEnableShortcutKey_showControls').onClick(() => {
          this.showControls = !this.showControls
          this.content = 'init'
        })
        Button('change_2').key('videoEnableShortcutKey_enableShortcutKey').onClick(() => {
          this.enableShortcutKey = !this.enableShortcutKey
          this.content = 'init'
        })
      }
    }
  }
}

interface TimeObject {
  time: number;
}
