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
struct Path2DArcArcToNullUndefinedTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      // ========== arc tests ==========
      Canvas(this.context1)
        .width('100%')
        .height('50%')
        .backgroundColor(0xAFEEEE)
        .id('path2d_arc_canvas')
        .onReady(() => {
          this.context1.lineWidth = 1.5;
          // Row 1 - null tests
          // Valid (对照)
          let path1 = new Path2D();
          path1.arc(25, 25, 18, 0, Math.PI * 2);
          this.context1.stroke(path1);

          // x null
          let path2 = new Path2D();
          path2.arc(null, 25, 18, 0, Math.PI * 2);
          this.context1.stroke(path2);

          // y null
          let path3 = new Path2D();
          path3.arc(75, null, 18, 0, Math.PI * 2);
          this.context1.stroke(path3);

          // radius null
          let path4 = new Path2D();
          path4.arc(125, 25, null, 0, Math.PI * 2);
          this.context1.stroke(path4);

          // startAngle null
          let path5 = new Path2D();
          path5.arc(175, 25, 18, null, Math.PI * 2);
          this.context1.stroke(path5);

          // endAngle null
          let path6 = new Path2D();
          path6.arc(225, 25, 18, 0, null);
          this.context1.stroke(path6);

          // Row 2 - null continued
          // counterclockwise null
          let path7 = new Path2D();
          path7.arc(25, 75, 18, 0, Math.PI * 2, null);
          this.context1.stroke(path7);

          // x undefined
          let path8 = new Path2D();
          path8.arc(undefined, 75, 18, 0, Math.PI * 2);
          this.context1.stroke(path8);

          // y undefined
          let path9 = new Path2D();
          path9.arc(75, undefined, 18, 0, Math.PI * 2);
          this.context1.stroke(path9);

          // radius undefined
          let path10 = new Path2D();
          path10.arc(125, 75, undefined, 0, Math.PI * 2);
          this.context1.stroke(path10);

          // startAngle undefined
          let path11 = new Path2D();
          path11.arc(175, 75, 18, undefined, Math.PI * 2);
          this.context1.stroke(path11);

          // endAngle undefined
          let path12 = new Path2D();
          path12.arc(225, 75, 18, 0, undefined);
          this.context1.stroke(path12);

          // counterclockwise undefined
          let path13 = new Path2D();
          path13.arc(25, 125, 18, 0, Math.PI * 2, undefined);
          this.context1.stroke(path13);
        })

      // ========== arcTo tests ==========
      Canvas(this.context2)
        .width('100%')
        .height('50%')
        .backgroundColor(0xFFB6C1)
        .id('path2d_arcto_canvas')
        .onReady(() => {
          this.context2.lineWidth = 1.5;
          // Row 1 - null tests
          // Valid (对照)
          let path1 = new Path2D();
          path1.moveTo(5, 5);
          path1.arcTo(30, 15, 30, 35, 15);
          this.context2.stroke(path1);

          // x1 null
          let path2 = new Path2D();
          path2.moveTo(55, 5);
          path2.arcTo(null, 15, 80, 35, 15);
          this.context2.stroke(path2);

          // y1 null
          let path3 = new Path2D();
          path3.moveTo(105, 5);
          path3.arcTo(130, null, 130, 35, 15);
          this.context2.stroke(path3);

          // x2 null
          let path4 = new Path2D();
          path4.moveTo(155, 5);
          path4.arcTo(180, 15, null, 35, 15);
          this.context2.stroke(path4);

          // y2 null
          let path5 = new Path2D();
          path5.moveTo(205, 5);
          path5.arcTo(230, 15, 230, null, 15);
          this.context2.stroke(path5);

          // radius null
          let path6 = new Path2D();
          path6.moveTo(5, 55);
          path6.arcTo(30, 65, 30, 85, null);
          this.context2.stroke(path6);

          // Row 2 - undefined tests
          // x1 undefined
          let path7 = new Path2D();
          path7.moveTo(55, 55);
          path7.arcTo(undefined, 65, 80, 85, 15);
          this.context2.stroke(path7);

          // y1 undefined
          let path8 = new Path2D();
          path8.moveTo(105, 55);
          path8.arcTo(130, undefined, 130, 85, 15);
          this.context2.stroke(path8);

          // x2 undefined
          let path9 = new Path2D();
          path9.moveTo(155, 55);
          path9.arcTo(180, 65, undefined, 85, 15);
          this.context2.stroke(path9);

          // y2 undefined
          let path10 = new Path2D();
          path10.moveTo(205, 55);
          path10.arcTo(230, 65, 230, undefined, 15);
          this.context2.stroke(path10);

          // radius undefined
          let path11 = new Path2D();
          path11.moveTo(5, 105);
          path11.arcTo(30, 115, 30, 135, undefined);
          this.context2.stroke(path11);
        })
    }
    .width('100%')
    .padding(2)
  }
}
