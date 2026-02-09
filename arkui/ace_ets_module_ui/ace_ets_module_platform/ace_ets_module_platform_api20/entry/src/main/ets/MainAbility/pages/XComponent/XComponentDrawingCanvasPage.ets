/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import drawing from '@ohos.graphics.drawing'

@Entry
@Component
struct XComponentDrawingCanvasPage {
  private xcController1: XComponentController = new XComponentController()
  private xcController2: XComponentController = new XComponentController()
  private mCanvas1: DrawingCanvas | null = null
  private mCanvas2: DrawingCanvas | null = null
  @State xc_text1: string = '-'
  @State xc_text2: string = '-'
  @State xc_text3: string = '-'
  @State xc_text4: string = '-'
  @State xc_text5: string = '-'
  @State xc_text6: string = '-'

  aboutToDisappear(){}
  build() {
    Column() {
      Row({space: 5}) {
        Text(this.xc_text1).id('XComponent1_lock1')
        Text(this.xc_text3).id('XComponent1_lock3')
        Text(this.xc_text4).id('XComponent2_lock1')
        Text(this.xc_text6).id('XComponent2_lock3')
      }
      XComponent({ type: XComponentType.SURFACE, controller: this.xcController1 })
        .width('50%')
        .height('40%')
        .backgroundColor(Color.Yellow)
        .borderWidth(1)

      XComponent({ type: XComponentType.TEXTURE, controller: this.xcController2 })
        .width('50%')
        .height('40%')
        .backgroundColor(Color.Yellow)
        .borderWidth(1)

      Button('绘制')
        .onClick(()=>{
          let mCanvas1 = this.xcController1.lockCanvas();
          let mCanvas2 = this.xcController2.lockCanvas();
          let mCanvas3 = this.xcController1.lockCanvas();
          let mCanvas4 = this.xcController2.lockCanvas();
          if (mCanvas1) {
            this.xc_text1 = 'ok'
            this.mCanvas1 = mCanvas1;
            this.mCanvas1.drawColor(255, 255, 0, 255);
            const brush = new drawing.Brush();
            brush.setColor({
              alpha: 255,
              red: 0,
              green: 255,
              blue: 0
            });
            this.mCanvas1.attachBrush(brush);
            this.mCanvas1.drawRect({
              left: 20,
              right: 100,
              top: 20,
              bottom: 100
            });
            this.mCanvas1.detachBrush();
            this.xcController1.unlockCanvasAndPost(this.mCanvas1)
          }
          if (mCanvas2) {
            this.xc_text4 = 'ok'
            this.mCanvas2 = mCanvas2;
            this.mCanvas2.drawColor(255, 255, 0, 255);
            const brush = new drawing.Brush();
            brush.setColor({
              alpha: 255,
              red: 255,
              green: 0,
              blue: 0
            });
            this.mCanvas2.attachBrush(brush);
            this.mCanvas2.drawRect({
              left: 20,
              right: 100,
              top: 20,
              bottom: 100
            });
            this.mCanvas2.detachBrush();
            this.xcController2.unlockCanvasAndPost(this.mCanvas2)
          }
          AppStorage.SetOrCreate('XComponentDrawingCanvasPage_mCanvas3', mCanvas3);
          AppStorage.SetOrCreate('XComponentDrawingCanvasPage_mCanvas4', mCanvas4);
          let mCanvas5 = this.xcController1.lockCanvas();
          let mCanvas6 = this.xcController2.lockCanvas();
          if (mCanvas5) {
            this.xc_text3 = 'ok'
          }
          if (mCanvas6) {
            this.xc_text6 = 'ok'
          }
        })
        .id('XComponentDrawingCanvas_btn')
    }
    .height('100%')
    .width('100%')
  }
}