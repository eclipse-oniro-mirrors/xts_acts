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
struct Path2DLineToMoveToNullUndefinedTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      // ========== lineTo tests ==========
      Canvas(this.context1)
        .width('100%')
        .height('50%')
        .backgroundColor(0xAFEEEE)
        .id('path2d_lineto_canvas')
        .onReady(() => {
          this.context1.lineWidth = 1.5;
          // Row 1
          // Valid (对照)
          let path1 = new Path2D();
          path1.moveTo(5, 5);
          path1.lineTo(45, 45);
          this.context1.stroke(path1);

          // x null
          let path2 = new Path2D();
          path2.moveTo(55, 5);
          path2.lineTo(null, 45);
          this.context1.stroke(path2);

          // y null
          let path3 = new Path2D();
          path3.moveTo(105, 5);
          path3.lineTo(145, null);
          this.context1.stroke(path3);

          // x undefined
          let path4 = new Path2D();
          path4.moveTo(155, 5);
          path4.lineTo(undefined, 45);
          this.context1.stroke(path4);

          // y undefined
          let path5 = new Path2D();
          path5.moveTo(205, 5);
          path5.lineTo(245, undefined);
          this.context1.stroke(path5);
        })

      // ========== moveTo tests ==========
      Canvas(this.context2)
        .width('100%')
        .height('50%')
        .backgroundColor(0xFFB6C1)
        .id('path2d_moveto_canvas')
        .onReady(() => {
          this.context2.lineWidth = 1.5;
          // Row 1
          // Valid (对照) - draws triangle
          let path1 = new Path2D();
          path1.moveTo(5, 5);
          path1.lineTo(45, 5);
          path1.lineTo(25, 45);
          path1.closePath();
          this.context2.stroke(path1);

          // x null
          let path2 = new Path2D();
          path2.moveTo(null, 5);
          path2.lineTo(95, 5);
          path2.lineTo(75, 45);
          path2.closePath();
          this.context2.stroke(path2);

          // y null
          let path3 = new Path2D();
          path3.moveTo(105, null);
          path3.lineTo(145, 5);
          path3.lineTo(125, 45);
          path3.closePath();
          this.context2.stroke(path3);

          // x undefined
          let path4 = new Path2D();
          path4.moveTo(undefined, 5);
          path4.lineTo(195, 5);
          path4.lineTo(175, 45);
          path4.closePath();
          this.context2.stroke(path4);

          // y undefined
          let path5 = new Path2D();
          path5.moveTo(205, undefined);
          path5.lineTo(245, 5);
          path5.lineTo(225, 45);
          path5.closePath();
          this.context2.stroke(path5);
        })
    }
    .width('100%')
    .padding(2)
  }
}
