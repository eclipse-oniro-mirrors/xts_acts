/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import drawing from '@ohos.graphics.drawing';
import { UIContext } from '@kit.ArkUI';

class MyFullDrawModifier extends DrawModifier {
  public scaleX: number = 1;
  public scaleY: number = 1;
  public scaleTStr: string = '1';
  public uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super();
    this.uiContext = uiContext;
  }

  drawOverlay(context: DrawContext): void {
    this.scaleTStr = 'drawOverlay'
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 255,
      green: 255,
      blue: 0
    });
    console.info('create drawOverlay');
    context.canvas.attachBrush(brush);
    const halfWidth = context.size.width / 2;
    const halfHeight = context.size.width / 2;
    context.canvas.drawRect({
      left: this.uiContext.vp2px(halfWidth - 30 * this.scaleX),
      top: this.uiContext.vp2px(halfHeight - 30 * this.scaleY),
      right: this.uiContext.vp2px(halfWidth + 30 * this.scaleX),
      bottom: this.uiContext.vp2px(halfHeight + 30 * this.scaleY)
    });
  }
}

@Entry
@Component
struct DrawModifierExample2 {
  @State text4: string = '';
  private fullModifier: MyFullDrawModifier = new MyFullDrawModifier(this.getUIContext());

  build() {
    Column() {
      Text(this.text4).key('DrawModifierDrawOverlay')
      Row() {
        Text('test text')
          .width(100)
          .height(100)
          .margin(10)
          .backgroundColor(Color.Gray)
          .drawModifier(this.fullModifier)
      }
      Row() {
        Button('create')
          .width(100)
          .height(100)
          .margin(10)
          .key('DrawModifierDrawOverlay')
          .onClick(() => {
            this.text4 = this.fullModifier.scaleTStr
          })

      }
    }
    .width('100%')
    .height('100%')
  }
}