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

import { MovingPhotoView, MovingPhotoViewController, MovingPhotoViewAttribute } from '@ohos.multimedia.movingphotoview'

const PHOTO_SELECT_EVENT_ID: number = 80001

@Entry
@Component
struct MovingPhotoViewDemo {
  @State isMuted: boolean = false
  @State text: string = 'start'
  @State text2: string = 'stop'
  controller: MovingPhotoViewController = new MovingPhotoViewController()



  build() {
    Column() {


      Text(this.text).key('MovingPhotoViewText')
      Text(this.text2).key('MovingPhotoViewText2')
      Row() {
        Column() {
          MovingPhotoView({
            movingPhoto: undefined,
            controller: this.controller
          })
            .width(100)
            .height(100)
            .muted(this.isMuted)
            .objectFit(ImageFit.Contain)
            .onStart(() => {
              console.log('onStart')
              this.text = 'start'
            })
            .onFinish(() => {
              console.log('onFinish')
            })
            .onStop(() => {
              console.log('onStop')
              this.text2 = 'onStop'
            })
            .onError(() => {
              console.log('onError')
            })
        }
      }
      .height(100)

      Row() {
        Button('start')
          .key('MovingPhotoViewStart')
          .onClick(() => {
            this.controller.startPlayback()
            this.text = 'start'
          })
          .margin(5)
        Button('stop')
          .key('MovingPhotoViewStop')
          .onClick(() => {
            this.controller.stopPlayback()
            this.text = 'stop'
          })
          .margin(5)
        Button('mute')
          .onClick(() => {
            this.isMuted = !this.isMuted
          })
          .margin(5)
      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .height('15%')
    }
  }

}
