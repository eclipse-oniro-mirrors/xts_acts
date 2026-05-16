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
struct Antialias {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private contextTrue: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private contextFalse: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private contextUndefined: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      Canvas(this.contextTrue)
        .id('Antialias_canvas_true')
        .width('100%')
        .height(60)
        .backgroundColor('rgb(213,213,213)')
        .onReady(() => {
          this.contextTrue.antialias = true;
          this.contextTrue.strokeStyle = 'rgb(0,0,0)';
          this.contextTrue.lineWidth = 2;
          this.contextTrue.font = 'normal bold 30vp monospace';
          this.contextTrue.fillText('Antialias True', 10, 30);
          AppStorage.setOrCreate('Antialias_true_value', this.contextTrue.antialias);
        })

      Canvas(this.contextFalse)
        .id('Antialias_canvas_false')
        .width('100%')
        .height(60)
        .backgroundColor('rgb(213,213,213)')
        .onReady(() => {
          this.contextFalse.antialias = false;
          this.contextFalse.strokeStyle = 'rgb(0,0,0)';
          this.contextFalse.lineWidth = 2;
          this.contextFalse.font = 'normal bold 30vp monospace';
          this.contextFalse.fillText('Antialias False', 10, 30);
          AppStorage.setOrCreate('Antialias_false_value', this.contextFalse.antialias);
        })

      Canvas(this.contextUndefined)
        .id('Antialias_canvas_undefined')
        .width('100%')
        .height(60)
        .backgroundColor('rgb(213,213,213)')
        .onReady(() => {
          this.contextUndefined.strokeStyle = 'rgb(0,0,0)';
          this.contextUndefined.lineWidth = 2;
          this.contextUndefined.font = 'normal bold 30vp monospace';
          this.contextUndefined.fillText('Antialias Undefined', 10, 30);
          AppStorage.setOrCreate('Antialias_undefined_value', this.contextUndefined.antialias);
        })
    }
    .width('100%')
    .height('100%')
  }
}
