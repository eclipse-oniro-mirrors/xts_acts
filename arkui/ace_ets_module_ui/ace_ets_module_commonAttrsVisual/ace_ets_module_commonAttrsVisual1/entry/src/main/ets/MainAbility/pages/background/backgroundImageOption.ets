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
import image from '@ohos.multimedia.image'

@Entry
@Component
struct backgroundImageOption {
  @State imagePixelMap: image.PixelMap | undefined = undefined

  async aboutToAppear() {
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'))
  }

  build() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }){
      Column({ space: '3vp' }) {
        Text()
          .id('repeat1')
          .size({ width: 120, height: '20%' })
          .backgroundImage(this.imagePixelMap, {syncLoad: true, repeat: ImageRepeat.XY})
        Text()
          .id('repeat2')
          .size({ width: 120, height: '20%' })
          .backgroundImage($r('app.media.icon'), {syncLoad: false, repeat: ImageRepeat.Y})
        Text()
          .id('repeat3')
          .size({ width: 120, height: '20%' })
          .backgroundImage($r('app.media.icon'), {syncLoad: true, repeat: ImageRepeat.X})
        Text()
          .id('repeat4')
          .size({ width: 120, height: '20%' })
          .backgroundImage($r('app.media.icon'), {syncLoad: true, repeat: ImageRepeat.NoRepeat})
      }
    }
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array?.buffer?.slice(0, unit8Array?.buffer?.byteLength))
    let createPixelMap: image.PixelMap = await imageSource?.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource?.release()
    return createPixelMap
  }
}
