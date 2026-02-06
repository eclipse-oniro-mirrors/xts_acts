'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { image } from '@kit.ImageKit'
import { Entry, Component, ImageRotateOrientation, ImageFit, Resource, $r, Column, Image, Color, ImageRepeat, Padding, Button, ClickEvent} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ImageOrientation {
  @State orientation: ImageRotateOrientation = ImageRotateOrientation.UP
  @State autoResize: boolean = false
  @State pixmap: image.PixelMap | undefined = undefined
  @State resource: Resource = $r('app.media.orientation')
  @State rotateDegree: number = 0
  @State fit: ImageFit = ImageFit.Cover

  @State orientationIdx: int = 0
  @State fitsIdx: int = 0
  @State orientationArr: Array<ImageRotateOrientation> = [
    ImageRotateOrientation.AUTO,//0
    ImageRotateOrientation.UP,//1
    ImageRotateOrientation.RIGHT,//2
    ImageRotateOrientation.DOWN,//3
    ImageRotateOrientation.LEFT,//4
  ]
  @State fitsArr: Array<ImageFit> = [
    ImageFit.Contain,
    ImageFit.Cover,
    ImageFit.Auto,
    ImageFit.Fill,
    ImageFit.ScaleDown,
    ImageFit.None,
    ImageFit.TOP_START,
    ImageFit.TOP,
    ImageFit.TOP_END,
    ImageFit.START,
    ImageFit.CENTER,
    ImageFit.END,
    ImageFit.BOTTOM_START,
    ImageFit.BOTTOM,
    ImageFit.BOTTOM_END,
  ]

  build() {
    Column() {
      Image(this.resource)
        .autoResize(this.autoResize)
        .height('50%')
        .width('50%')
        .border({ width: 1, color: Color.Red })
        .objectFit(this.fitsArr[this.fitsIdx])
        .orientation(this.orientationArr[this.orientationIdx])
        .padding({ left: 10, right: 10, top: 20, bottom: 20 } as Padding)
        .rotate({ angle: this.rotateDegree })
        .objectRepeat(ImageRepeat.XY)
        .key('imageOrientation')


      Button(`改变rotate角度 ${this.rotateDegree}`).onClick((e : ClickEvent) => {
        this.rotateDegree += 30
      }).height('5%')

      Button(`切换autoResize ${this.autoResize}`).onClick((e: ClickEvent) => {
        this.autoResize = !this.autoResize
      }).height('5%')

      Button(`点击切换不同的orientation`).onClick((e: ClickEvent) => {
        this.orientationIdx = (this.orientationIdx + 1) % this.orientationArr.length
      }).id('changeOrientation').height('5%')

      Button(`点击切换ImageFit`).onClick((e: ClickEvent) => {
        this.fitsIdx = (this.fitsIdx + 1) % this.fitsArr.length
      }).height('5%')

    }
    .width('100%')
    .height('100%')
  }
}