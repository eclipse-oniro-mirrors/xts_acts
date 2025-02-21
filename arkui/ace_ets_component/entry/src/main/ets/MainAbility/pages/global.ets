// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

@Entry
@Component
struct GlobalExample {

  private settings: RenderingContextSettings = new RenderingContextSettings (true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offContext: OffscreenCanvasRenderingContext2D  = new OffscreenCanvasRenderingContext2D(300, 300, this.settings);
  private img: ImageBitmap = new ImageBitmap("/images/bg.jpg")
  
  onPageShow() {
    console.info("global page called")
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Canvas(this.context)
        .width('100%').height('40%').backgroundColor('#00ffff')
        .onReady(() => {
          this.offContext.imageSmoothingEnabled = false
          this.testImageBitmapSize();
          this.testOffscreenCanvas();
          this.testImageData();
        })
    }.width('100%').height('100%')
  }

  testImageBitmapSize() {
    let width = this.img.width;
    let height = this.img.height;
    this.offContext.imageSmoothingEnabled = false;
    this.offContext.drawImage(this.img, 30, 950, 160, 100);
    console.log("imagebitmap_width=" + width);
    console.log("imagebitmap_height=" + height);
  }

  testOffscreenCanvas() {
    this.offContext.drawImage(this.img, 0, 0, 100, 100);
    var bitmap = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(bitmap);
  }

  testImageData() {
    var imageData = this.offContext.createImageData(100, 100);
    var imgData = imageData.data;
    console.log("imageData_width=" + imageData.width);
    console.log("imageData_height=" + imageData.height);
  }
}