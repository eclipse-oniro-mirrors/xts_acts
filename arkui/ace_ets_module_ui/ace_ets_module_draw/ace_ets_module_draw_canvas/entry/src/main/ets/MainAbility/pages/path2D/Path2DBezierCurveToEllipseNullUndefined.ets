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
struct Path2DBezierCurveToEllipseNullUndefinedTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      // ========== bezierCurveTo tests ==========
      Canvas(this.context1)
        .width('100%')
        .height('50%')
        .backgroundColor(0xAFEEEE)
        .id('path2d_beziercurveto_canvas')
        .onReady(() => {
          this.context1.lineWidth = 1.5;
          // Row 1 - null tests
          // Valid (对照)
          let path1 = new Path2D();
          path1.moveTo(5, 5);
          path1.bezierCurveTo(15, 25, 35, 25, 45, 5);
          this.context1.stroke(path1);

          // cp1x null
          let path2 = new Path2D();
          path2.moveTo(55, 5);
          path2.bezierCurveTo(null, 25, 85, 25, 95, 5);
          this.context1.stroke(path2);

          // cp1y null
          let path3 = new Path2D();
          path3.moveTo(105, 5);
          path3.bezierCurveTo(115, null, 135, 25, 145, 5);
          this.context1.stroke(path3);

          // cp2x null
          let path4 = new Path2D();
          path4.moveTo(155, 5);
          path4.bezierCurveTo(165, 25, null, 25, 195, 5);
          this.context1.stroke(path4);

          // cp2y null
          let path5 = new Path2D();
          path5.moveTo(5, 55);
          path5.bezierCurveTo(15, 75, 35, null, 45, 55);
          this.context1.stroke(path5);

          // x null
          let path6 = new Path2D();
          path6.moveTo(55, 55);
          path6.bezierCurveTo(65, 75, 85, 85, null, 55);
          this.context1.stroke(path6);

          // y null
          let path7 = new Path2D();
          path7.moveTo(105, 55);
          path7.bezierCurveTo(115, 75, 135, 85, 145, null);
          this.context1.stroke(path7);

          // Row 2 - undefined tests
          // cp1x undefined
          let path8 = new Path2D();
          path8.moveTo(155, 55);
          path8.bezierCurveTo(undefined, 75, 185, 85, 195, 55);
          this.context1.stroke(path8);

          // cp1y undefined
          let path9 = new Path2D();
          path9.moveTo(5, 105);
          path9.bezierCurveTo(15, undefined, 35, 115, 45, 105);
          this.context1.stroke(path9);

          // cp2x undefined
          let path10 = new Path2D();
          path10.moveTo(55, 105);
          path10.bezierCurveTo(65, 115, undefined, 115, 95, 105);
          this.context1.stroke(path10);

          // cp2y undefined
          let path11 = new Path2D();
          path11.moveTo(105, 105);
          path11.bezierCurveTo(115, 115, 135, undefined, 145, 105);
          this.context1.stroke(path11);

          // x undefined
          let path12 = new Path2D();
          path12.moveTo(155, 105);
          path12.bezierCurveTo(165, 115, 185, 115, undefined, 105);
          this.context1.stroke(path12);

          // y undefined
          let path13 = new Path2D();
          path13.moveTo(5, 155);
          path13.bezierCurveTo(15, 155, 35, 155, 45, undefined);
          this.context1.stroke(path13);
        })

      // ========== ellipse tests ==========
      Canvas(this.context2)
        .width('100%')
        .height('50%')
        .backgroundColor(0xFFB6C1)
        .id('path2d_ellipse_canvas')
        .onReady(() => {
          this.context2.lineWidth = 1.5;
          // Row 1 - null tests
          // Valid (对照)
          let path1 = new Path2D();
          path1.ellipse(25, 25, 16, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path1);

          // x null
          let path2 = new Path2D();
          path2.ellipse(null, 25, 16, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path2);

          // y null
          let path3 = new Path2D();
          path3.ellipse(75, null, 16, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path3);

          // radiusX null
          let path4 = new Path2D();
          path4.ellipse(125, 25, null, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path4);

          // radiusY null
          let path5 = new Path2D();
          path5.ellipse(175, 25, 16, null, 0, 0, Math.PI * 2);
          this.context2.stroke(path5);

          // rotation null
          let path6 = new Path2D();
          path6.ellipse(225, 25, 16, 12, null, 0, Math.PI * 2);
          this.context2.stroke(path6);

          // startAngle null
          let path7 = new Path2D();
          path7.ellipse(25, 75, 16, 12, 0, null, Math.PI * 2);
          this.context2.stroke(path7);

          // endAngle null
          let path8 = new Path2D();
          path8.ellipse(75, 75, 16, 12, 0, 0, null);
          this.context2.stroke(path8);

          // counterclockwise null
          let path9 = new Path2D();
          path9.ellipse(125, 75, 16, 12, 0, 0, Math.PI * 2, null);
          this.context2.stroke(path9);

          // Row 2 - undefined tests
          // x undefined
          let path10 = new Path2D();
          path10.ellipse(undefined, 125, 16, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path10);

          // y undefined
          let path11 = new Path2D();
          path11.ellipse(175, undefined, 16, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path11);

          // radiusX undefined
          let path12 = new Path2D();
          path12.ellipse(225, 125, undefined, 12, 0, 0, Math.PI * 2);
          this.context2.stroke(path12);

          // radiusY undefined
          let path13 = new Path2D();
          path13.ellipse(25, 175, 16, undefined, 0, 0, Math.PI * 2);
          this.context2.stroke(path13);

          // rotation undefined
          let path14 = new Path2D();
          path14.ellipse(75, 175, 16, 12, undefined, 0, Math.PI * 2);
          this.context2.stroke(path14);

          // startAngle undefined
          let path15 = new Path2D();
          path15.ellipse(125, 175, 16, 12, 0, undefined, Math.PI * 2);
          this.context2.stroke(path15);

          // endAngle undefined
          let path16 = new Path2D();
          path16.ellipse(175, 175, 16, 12, 0, 0, undefined);
          this.context2.stroke(path16);

          // counterclockwise undefined
          let path17 = new Path2D();
          path17.ellipse(225, 175, 16, 12, 0, 0, Math.PI * 2, undefined);
          this.context2.stroke(path17);
        })
    }
    .width('100%')
    .padding(2)
  }
}
