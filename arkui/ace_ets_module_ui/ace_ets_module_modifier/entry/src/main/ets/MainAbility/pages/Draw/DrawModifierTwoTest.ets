/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { drawing } from '@kit.ArkGraphics2D';

let drawCount: number = 0;

class MyFrontDrawModifier extends DrawModifier {
  public scaleX: number = 1;
  public scaleY: number = 1;
  public uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super();
    this.uiContext = uiContext;
  }

  drawFront(context: DrawContext): void {
    drawCount++;
    console.log('mzj drawFront: ' + drawCount);
    // 点按钮，变更前：drawCount为2，变更后drawCount为1
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 0,
      green: 0,
      blue: 255
    });
    context.canvas.attachBrush(brush);
    const halfWidth = context.size.width / 2;
    const halfHeight = context.size.width / 2;
    const radiusScale = (this.scaleX + this.scaleY) / 2;
    context.canvas.drawCircle(this.uiContext.vp2px(halfWidth),
        this.uiContext.vp2px(halfHeight), this.uiContext.vp2px(20 * radiusScale));
  }
}

@Entry
@Component
struct DrawModifierTwo {
  public modifier: MyFrontDrawModifier = new MyFrontDrawModifier(this.getUIContext());
  @State public testWidth: number = 100;
  @State public drawCount: number = 100;

  build() {
    Column() {
      Button('changeModifier')
        .id('btn_changeModifier')
        .height('5%')
        .onClick(() => {
          this.testWidth++;
          this.modifier.scaleX += 0.1;
          this.modifier.scaleY += 0.1;
        })
      Button('get drawCount')
        .id('btn_drawCount')
        .height('5%')
        .onClick(() => {
          this.drawCount = drawCount
        })
      Text(this.drawCount + '')
        .id('text_drawCount')
        .height('5%')
      Column() {
        Row()
          .width(100)
          .height('60%')
          .margin(10)
          .backgroundColor(Color.Gray)
          .drawModifier(this.modifier)
        Row() {
          Text('hello world')
            .width(this.testWidth)
            .height('20%')
        }
      }
      .width(300)
      .height('30%')
    }
    .height('100%')
  }
}