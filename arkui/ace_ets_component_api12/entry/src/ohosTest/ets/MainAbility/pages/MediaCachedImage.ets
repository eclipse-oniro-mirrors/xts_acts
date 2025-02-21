/*
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

interface msgObj {
  width: number;
  height: number
} 
 
@Entry
@Component
struct MediaCachedImage_textcase {
  @State myWidth: number = 0
  @State myHeight: number = 0

  onPageShow() {
    console.info('MediaCachedImage page show called');
  }

  onBuildDone() {
    console.info('MediaCachedImage page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`MediaCachedImage page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        MediaCachedImage("/resources/rawfile/hand.png")
          .matchTextDirection(false)
          .fitOriginalSize(false)
          .fillColor(0xCCCCCC)
          .objectFit(ImageFit.Cover)
          .objectRepeat(ImageRepeat.NoRepeat)
          .interpolation(ImageInterpolation.None)
          .renderMode(ImageRenderMode.Original)
          .autoResize(false)
          .syncLoad(false)
          .sourceSize({ width: px2vp(200), height: px2vp(100) })
          .alt("/resources/rawfile/person.png")
          .key('image1')
        MediaCachedImage("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Contain)
          .objectRepeat(ImageRepeat.X)
          .interpolation(ImageInterpolation.High)
          .renderMode(ImageRenderMode.Template)
          .key('image2')
          .height(180)
          .width(180)
          .onComplete((msg: msgObj) => {
            this.myWidth = msg.width
            this.myHeight = msg.height
            console.info('Width ----' + this.myWidth)
            console.info('height ----' + this.myHeight)
          })
          .onError(() => {
            console.info('load MediaCachedImage fail')
          })
        MediaCachedImage("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Fill)
          .objectRepeat(ImageRepeat.Y)
          .interpolation(ImageInterpolation.Low)
          .key('image3')
        MediaCachedImage("/resources/rawfile/hand.png")
          .objectFit(ImageFit.None)
          .objectRepeat(ImageRepeat.XY)
          .interpolation(ImageInterpolation.Medium)
          .key('image4')
        MediaCachedImage("/resources/rawfile/hand.png")
          .objectFit(ImageFit.ScaleDown)
          .key('image5')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(4)
    }
  }
}