'use static';
/*
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Rating,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  ImageAnalyzerController,
  ImageAIOptions,
  Image,
  Button,
  Resource,
  ImageAnalyzerType
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
@Entry
@Component
struct imageAddApi2 {
  @State imagePixelMap: image.PixelMap | string = ''
  private aiController: ImageAnalyzerController = new ImageAnalyzerController()
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.OBJECT_LOOKUP, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  } as ImageAIOptions

  onPageShow() {
    this.imagePixelMap = this.getPixmapFromMedia($r('app.media.icon'))
  }

  build() {
    Column() {
      Image($r('app.media.icon'), this.options)
        .enableAnalyzer(true)
        .width(200)
        .height(200)
        .key('imageAddApi2')
      Button('getTypes')
        .width(80)
        .height(80)
        .onClick((e:ClickEvent) => {
          this.aiController.getImageAnalyzerSupportTypes()
        })
    }
  }
  private getPixmapFromMedia(resource: Resource) {
    let unit8Array = await AppStorage.get<common.Context>('applicationContext')?.resourceManager?.getMediaContent(resource.id)!
    let data: ArrayBuffer = unit8Array
      .buffer
      .slice(0, unit8Array.buffer.byteLength)
    let imageSource = image.createImageSource(data)
    let createPixelMap: image.PixelMap = await (imageSource?.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    }) as Promise<image.PixelMap>)
    await (imageSource?.release() as Promise<void>)
    return createPixelMap
  }
}