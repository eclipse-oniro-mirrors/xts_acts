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
struct Path2DQuadraticCurveToRectNullUndefinedTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      // ========== quadraticCurveTo tests ==========
      Canvas(this.context1)
        .width('100%')
        .height('50%')
        .backgroundColor(0xAFEEEE)
        .id('path2d_quadraticcurveto_canvas')
        .onReady(() => {
          this.context1.lineWidth = 1.5;
          // Row 1 - null tests
          // Valid (对照)
          let path1 = new Path2D();
          path1.moveTo(5, 5);
          path1.quadraticCurveTo(25, 40, 45, 5);
          this.context1.stroke(path1);

          // cpx null
          let path2 = new Path2D();
          path2.moveTo(55, 5);
          path2.quadraticCurveTo(null, 40, 95, 5);
          this.context1.stroke(path2);

          // cpy null
          let path3 = new Path2D();
          path3.moveTo(105, 5);
          path3.quadraticCurveTo(125, null, 145, 5);
          this.context1.stroke(path3);

          // x null
          let path4 = new Path2D();
          path4.moveTo(155, 5);
          path4.quadraticCurveTo(175, 40, null, 5);
          this.context1.stroke(path4);

          // y null
          let path5 = new Path2D();
          path5.moveTo(205, 5);
          path5.quadraticCurveTo(225, 40, 245, null);
          this.context1.stroke(path5);

          // Row 2 - undefined tests
          // cpx undefined
          let path6 = new Path2D();
          path6.moveTo(5, 55);
          path6.quadraticCurveTo(undefined, 90, 45, 55);
          this.context1.stroke(path6);

          // cpy undefined
          let path7 = new Path2D();
          path7.moveTo(55, 55);
          path7.quadraticCurveTo(75, undefined, 95, 55);
          this.context1.stroke(path7);

          // x undefined
          let path8 = new Path2D();
          path8.moveTo(105, 55);
          path8.quadraticCurveTo(125, 90, undefined, 55);
          this.context1.stroke(path8);

          // y undefined
          let path9 = new Path2D();
          path9.moveTo(155, 55);
          path9.quadraticCurveTo(175, 90, 195, undefined);
          this.context1.stroke(path9);
        })

      // ========== rect tests ==========
      Canvas(this.context2)
        .width('100%')
        .height('50%')
        .backgroundColor(0xFFB6C1)
        .id('path2d_rect_canvas')
        .onReady(() => {
          this.context2.lineWidth = 1.5;
          // Row 1 - null tests
          // Valid (对照)
          let path1 = new Path2D();
          path1.rect(5, 5, 40, 40);
          this.context2.stroke(path1);

          // x null
          let path2 = new Path2D();
          path2.rect(null, 5, 40, 40);
          this.context2.stroke(path2);

          // y null
          let path3 = new Path2D();
          path3.rect(55, null, 40, 40);
          this.context2.stroke(path3);

          // w null
          let path4 = new Path2D();
          path4.rect(105, 5, null, 40);
          this.context2.stroke(path4);

          // h null
          let path5 = new Path2D();
          path5.rect(155, 5, 40, null);
          this.context2.stroke(path5);

          // Row 2 - undefined tests
          // x undefined
          let path6 = new Path2D();
          path6.rect(undefined, 55, 40, 40);
          this.context2.stroke(path6);

          // y undefined
          let path7 = new Path2D();
          path7.rect(55, undefined, 40, 40);
          this.context2.stroke(path7);

          // w undefined
          let path8 = new Path2D();
          path8.rect(105, 55, undefined, 40);
          this.context2.stroke(path8);

          // h undefined
          let path9 = new Path2D();
          path9.rect(155, 55, 40, undefined);
          this.context2.stroke(path9);
        })
    }
    .width('100%')
    .padding(2)
  }
}
