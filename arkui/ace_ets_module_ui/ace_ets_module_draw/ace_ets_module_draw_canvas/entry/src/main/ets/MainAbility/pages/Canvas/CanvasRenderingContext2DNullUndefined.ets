/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct CanvasRenderingContext2DNullUndefinedTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private img: ImageBitmap = new ImageBitmap('resources/base/media/icon.png');

  build() {
    Column() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor(0xD5D5D5)
        .id('canvas_canvas2d_nullundefined')
        .onReady(() => {
          // ========== fill tests ==========
          this.context.fillStyle = '#00ff00';

          // Valid fill (对照)
          let path1 = new Path2D();
          path1.rect(10, 10, 40, 40);
          this.context.fill(path1);

          // path null
          let path2 = new Path2D();
          path2.rect(60, 10, 40, 40);
          this.context.fill(null);

          // path undefined
          let path3 = new Path2D();
          path3.rect(110, 10, 40, 40);
          this.context.fill(undefined);

          // fillRule null
          let path4 = new Path2D();
          path4.rect(10, 60, 40, 40);
          this.context.fill(path4, null);

          // fillRule undefined
          let path5 = new Path2D();
          path5.rect(60, 60, 40, 40);
          this.context.fill(path5, undefined);

          // ========== drawImage tests ==========
          this.context.fillStyle = '#0000ff';

          // Valid drawImage (对照)
          this.context.drawImage(this.img, 10, 110);

          // image null
          this.context.drawImage(null, 70, 110);

          // image undefined
          this.context.drawImage(undefined, 110, 110);

          // dx null
          this.context.drawImage(this.img, null, 150);

          // dx undefined
          this.context.drawImage(this.img, undefined, 170);

          // dy null
          this.context.drawImage(this.img, 150, null);

          // dy undefined
          this.context.drawImage(this.img, 170, undefined);

          // dw null
          this.context.drawImage(this.img, 10, 200, null, 30);

          // dw undefined
          this.context.drawImage(this.img, 50, 200, undefined, 30);

          // dh null
          this.context.drawImage(this.img, 90, 200, 30, null);

          // dh undefined
          this.context.drawImage(this.img, 110, 200, 30, undefined);

          // sx null
          this.context.drawImage(this.img, null, 210, 40, 40, 150, 210, 40, 40);

          // sx undefined
          this.context.drawImage(this.img, undefined, 210, 40, 40, 180, 210, 40, 40);

          // sy null
          this.context.drawImage(this.img, 10, null, 40, 40, 10, 210, 40, 40);

          // sy undefined
          this.context.drawImage(this.img, 10, undefined, 40, 40, 50, 210, 40, 40);

          // sw null
          this.context.drawImage(this.img, 10, 210, null, 40, 90, 210, 40, 40);

          // sw undefined
          this.context.drawImage(this.img, 10, 210, undefined, 40, 130, 210, 40, 40);

          // sh null
          this.context.drawImage(this.img, 10, 210, 40, null, 170, 210, 40, 40);

          // sh undefined
          this.context.drawImage(this.img, 10, 210, 40, undefined, 210, 210, 40, 40);
        })
    }
    .width('100%')
    .height('100%')
    .padding(5)
  }
}
