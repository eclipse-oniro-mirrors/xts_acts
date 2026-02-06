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
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  $r,
  Button,
  Canvas,
  CanvasPattern,
  CanvasRenderingContext2D,
  Color,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ImageBitmap,
  ItemAlign,
  OffscreenCanvas,
  OffscreenCanvasRenderingContext2D,
  RenderingContextSettings,
  Row,
  Scroll,
  Text
} from '@ohos.arkui.component';

@Entry
@Component
struct CanvasRenderer1 {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private offCanvas: OffscreenCanvas = new OffscreenCanvas(600, 600)
  private img: ImageBitmap = new ImageBitmap("resource/media/icon.png");

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          let offContext = this.offCanvas.getContext("2d", this.settings)
          let offctx = offContext
          offctx.imageSmoothingEnabled = true
          offctx.imageSmoothingQuality = 'high'
          offctx.drawImage(this.img, 0, 0, 400, 200)

          let image = this.offCanvas.transferToImageBitmap()
          this.context.transferFromImageBitmap(image as ImageBitmap) 
        })

      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          let offContext = this.offCanvas.getContext("2d", this.settings)
          let offctx = offContext
          offctx.imageSmoothingEnabled = true
          offctx.imageSmoothingQuality = 'medium'
          offctx.drawImage(this.img, 0, 300, 400, 500)

          let image = this.offCanvas.transferToImageBitmap()
          this.context.transferFromImageBitmap(image as ImageBitmap) 
        })

      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          let offContext = this.offCanvas.getContext("2d", this.settings)
          let offctx = offContext
          offctx.imageSmoothingEnabled = true
          offctx.imageSmoothingQuality = 'low'
          offctx.drawImage(this.img, 0, 600, 400, 800)

          let image = this.offCanvas.transferToImageBitmap()
          this.context.transferFromImageBitmap(image as ImageBitmap) 
        })
    }
    .width('100%')
    .height('100%')
  }
}