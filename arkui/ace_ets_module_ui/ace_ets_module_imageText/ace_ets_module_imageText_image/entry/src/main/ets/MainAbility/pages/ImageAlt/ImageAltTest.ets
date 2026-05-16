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
import { image } from '@kit.ImageKit';
@Entry
@Component
struct ImageAltTestPage {
  @State imagePixelMap: image.PixelMap | undefined = undefined;
  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await this.getUIContext().getHostContext()?.resourceManager?.getMediaContent(resource.id);
    let imageSource = image.createImageSource(unit8Array?.buffer.slice(0, unit8Array.buffer.byteLength));
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    });
    await imageSource.release();
    return createPixelMap;
  }
  aboutToAppear() {
    this.getPixmapFromMedia($r('app.media.icon')).then(val => {
      this.imagePixelMap = val;
      return val;
    })
  }
  build() {
    Column() {
      Image('common/pages/apple')
        .width(80).height(80).margin(10)
        .id('image001')
        .alt({
          placeholder:  'images/test1.jpg',
          error:  'images/test1.jpg'
        })
      Image('common/pages/apple')
        .width(80).height(80).margin(10)
        .id('image002')
        .alt({
          placeholder: undefined,
          error: undefined
        })
      Image('common/pages/apple')
        .width(80).height(80).margin(10)
        .id('image003')
        .alt({
          placeholder: null,
          error: null
        })
      Image('common/pages/apple')
        .width(80).height(80).margin(10)
        .id('image004')
        .alt({
          placeholder: this.imagePixelMap,
          error: this.imagePixelMap
        })
    }.width('100%').height('100%')
  }
}