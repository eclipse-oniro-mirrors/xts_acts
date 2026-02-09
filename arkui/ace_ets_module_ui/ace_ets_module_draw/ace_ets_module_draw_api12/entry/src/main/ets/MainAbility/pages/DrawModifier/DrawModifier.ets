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
import drawing from '@ohos.graphics.drawing';
import animator, { AnimatorResult } from '@ohos.animator';

class MyFullDrawModifier extends DrawModifier {
  public scaleX: number = 1;
  public scaleY: number = 1;
  public scaleZ: number = 1;

  public scaleXStr: string = '1';
  public scaleYStr: string = '1';
  public scaleZStr: string = '1';

  drawBehind(context: DrawContext): void {
    this.scaleXStr = 'drawBehind'
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 255,
      green: 0,
      blue: 0
    });
    context.canvas.attachBrush(brush);
    const halfWidth = context.size.width / 2;
    const halfHeight = context.size.width / 2;
    context.canvas.drawRect({
      left: vp2px(halfWidth - 50 * this.scaleX),
      top: vp2px(halfHeight - 50 * this.scaleY),
      right: vp2px(halfWidth + 50 * this.scaleX),
      bottom: vp2px(halfHeight + 50 * this.scaleY)
    });
  }

  drawContent(context: DrawContext): void {
    this.scaleYStr = 'drawContent'
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 0,
      green: 255,
      blue: 0
    });
    context.canvas.attachBrush(brush);
    const halfWidth = context.size.width / 2;
    const halfHeight = context.size.width / 2;
    context.canvas.drawRect({
      left: vp2px(halfWidth - 30 * this.scaleX),
      top: vp2px(halfHeight - 30 * this.scaleY),
      right: vp2px(halfWidth + 30 * this.scaleX),
      bottom: vp2px(halfHeight + 30 * this.scaleY)
    });
  }

  drawFront(context: DrawContext): void {
    this.scaleZStr = 'drawFront'
    this.scaleZ = 2
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
    context.canvas.drawCircle(vp2px(halfWidth), vp2px(halfHeight), vp2px(20 * radiusScale));
  }
}

class MyFrontDrawModifier extends DrawModifier {
  public scaleX: number = 1;
  public scaleY: number = 1;

  drawFront(context: DrawContext): void {
    this.scaleX = 2
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 0,
      green: 255,
      blue: 0
    });
    context.canvas.attachBrush(brush);
    const halfWidth = context.size.width / 2;
    const halfHeight = context.size.width / 2;
    const radiusScale = (this.scaleX + this.scaleY) / 2;
    context.canvas.drawCircle(vp2px(halfWidth), vp2px(halfHeight), vp2px(20 * radiusScale));
  }
}

@Entry
@Component
struct DrawModifierExample {
  @State text: string = '';
  @State text2: string = '';
  @State text3: string = '';
  private fullModifier: MyFullDrawModifier = new MyFullDrawModifier();
  private frontModifier: MyFrontDrawModifier = new MyFrontDrawModifier();
  private drawAnimator: AnimatorResult | undefined = undefined;
  @State modifier: DrawModifier = new MyFrontDrawModifier();
  private count = 0;

  create() {
    let self = this;
    this.drawAnimator = animator.create({
      duration: 1000,
      easing: 'ease',
      delay: 0,
      fill: 'forwards',
      direction: 'normal',
      iterations: 1,
      begin: 0,
      end: 2
    });
    this.drawAnimator.onFrame = (value: number) => {
      console.log('frame value =', value);
      const tempModifier = self.modifier as MyFullDrawModifier | MyFrontDrawModifier;
      tempModifier.scaleX = Math.abs(value - 1);
      tempModifier.scaleY = Math.abs(value - 1);
      self.modifier.invalidate();
    };
  }

  build() {
    Column() {
      Text(this.text).key('DrawModifier')
      Text(this.text2).key('DrawModifier2')
      Text(this.text3).key('DrawModifier3')
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
          .key('DrawModifierBt')
          .onClick(() => {
            this.text = this.fullModifier.scaleXStr
            this.text2 = this.fullModifier.scaleYStr
            this.text3 = this.fullModifier.scaleZStr
          })

      }
    }
    .width('100%')
    .height('100%')
  }
}