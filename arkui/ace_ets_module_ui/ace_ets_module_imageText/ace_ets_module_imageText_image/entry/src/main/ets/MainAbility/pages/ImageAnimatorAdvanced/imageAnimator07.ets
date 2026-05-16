/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct imageAnimator07 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {}
  xComponentController: XComponentController = new XComponentController()

  build() {
    Column() {
      ImageAnimator()
        .images([
          {
            src: $r('app.media.icon_jpg')
          },
          {
            src: $r('app.media.icon_png')
          },
          {
            src: $r('app.media.icon_bmp')
          },
          {
            src: $r('app.media.icon_svg')
          },
          {
            src: $r('app.media.icon_gif')
          }
        ])
        .fillMode(FillMode.None)
        .width(340)
        .height(240)
        .onStart(() => {
          console.info('imageAnimator07 Start')
        })
        .onPause(() => {
          console.info('imageAnimator07 Pause')
        })
        .onRepeat(() => {
          console.info('imageAnimator07 Repeat')
        })
        .onCancel(() => {
          console.info('imageAnimator07 Cancel')
        })
        .onFinish(() => {
          console.info('imageAnimator07 Finish')
        })
        .id('imageAnimator07')
    }
    .backgroundColor(Color.Black)
  }
}