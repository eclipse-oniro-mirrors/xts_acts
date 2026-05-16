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
struct Path2DAddPathNullUndefinedTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .backgroundColor(0xAFEEEE)
        .id('path2d_addpath_canvas')
        .onReady(() => {
          this.context.lineWidth = 1.5;

          // Valid path (对照)
          let basePath = new Path2D();
          basePath.rect(10, 10, 50, 50);
          let path1 = new Path2D();
          path1.rect(70, 10, 50, 50);
          basePath.addPath(path1);
          this.context.stroke(basePath);

          // null path
          let basePath2 = new Path2D();
          basePath2.rect(10, 70, 50, 50);
          basePath2.addPath(null);
          this.context.stroke(basePath2);

          // undefined path
          let basePath3 = new Path2D();
          basePath3.rect(70, 70, 50, 50);
          basePath3.addPath(undefined);
          this.context.stroke(basePath3);

          // null transform
          let basePath4 = new Path2D();
          basePath4.rect(10, 130, 50, 50);
          let path4 = new Path2D();
          path4.rect(70, 130, 50, 50);
          basePath4.addPath(path4, null);
          this.context.stroke(basePath4);

          // undefined transform
          let basePath5 = new Path2D();
          basePath5.rect(10, 190, 50, 50);
          let path5 = new Path2D();
          path5.rect(70, 190, 50, 50);
          basePath5.addPath(path5, undefined);
          this.context.stroke(basePath5);
        })
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
