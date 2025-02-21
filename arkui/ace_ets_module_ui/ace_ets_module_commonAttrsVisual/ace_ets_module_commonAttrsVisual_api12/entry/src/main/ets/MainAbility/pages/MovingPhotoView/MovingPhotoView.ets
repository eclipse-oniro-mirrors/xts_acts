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

import { MovingPhotoView, MovingPhotoViewController, MovingPhotoViewAttribute } from '@ohos.multimedia.movingphotoview';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let data: photoAccessHelper.MovingPhoto

@Entry
@Component
struct MovingPhotoView1 {
  controller: MovingPhotoViewController = new MovingPhotoViewController()
  @State src: photoAccessHelper.MovingPhoto | undefined = undefined
  @State ImageFit: ImageFit | undefined | null = ImageFit.Contain
  @State start: string = "Init";
  @State stop: string = "Init";
  @State pause: string = "Init";
  @State finish: string = "Init";
  @State error: string = "Init";
  @State play: string = "Init";
  @State stopPlay: string = "Init";
  @State flag: boolean = false;

  build() {
    NavDestination() {
      Column() {
        Stack({ alignContent: Alignment.BottomStart }) {
          MovingPhotoView({
            movingPhoto: data,
            controller: this.controller
          })
            .id('MovingPhotoView')
            .width(200)
            .height(200)
            .muted(this.flag)
            .objectFit(this.ImageFit)
            .onStart(() => {
              this.start = "onStart succ"
            })
            .onStop(() => {
              this.stop = "onStop succ"
            })
            .onPause(() => {
              this.pause = "onPause succ"
            })
            .onFinish(() => {
              this.finish = "onFinish succ"
            })
            .onError(() => {
              this.error = "onError succ"
            })
        }

        Button('Play').id('MovingPhotoView_playButton')
          .onClick(() => {
            this.controller.startPlayback()
            this.play = "startPlayback succ"
          })
        Button('Stop').id('MovingPhotoView_stopButton')
          .onClick(() => {
            this.controller.stopPlayback()
            this.stopPlay = "stopPlayback succ"
          })
        Button('true').id('MovingPhotoView_true')
          .onClick(() => {
            this.flag = true
          })
        Text(this.start).id('MovingPhotoView_start')
        Text(this.stop).id('MovingPhotoView_stop')
        Text(this.pause).id('MovingPhotoView_pause')
        Text(this.finish).id('MovingPhotoView_finish')
        Text(this.error).id('MovingPhotoView_error')
        Text(this.play).id('MovingPhotoView_play')
        Text(this.stopPlay).id('MovingPhotoView_stopPlay')
      }
    }
  }
}