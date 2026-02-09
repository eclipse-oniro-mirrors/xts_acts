'use static';
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
import { AnimatorResult, AnimatorOptions } from '@ohos.animator';
import { DrawModifier } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import {  DrawContext } from "@kit.ArkUI";
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {
  Row,
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  Flex,
  FlexOptions,
  Margin,
  FlexWrap,
  ItemAlign,
  FlexDirection
} from '@ohos.arkui.component'

import {
  State,
  // StateDecoratedVariable,
  AppStorage
} from '@ohos.arkui.stateManagement'

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
    const uiContext = AppStorage.get<UIContext>('uiContext');
    context.canvas.drawRect({
      left: uiContext!.vp2px(halfWidth - 50 * this.scaleX),
      top: uiContext!.vp2px(halfHeight - 50 * this.scaleY),
      right: uiContext!.vp2px(halfWidth + 50 * this.scaleX),
      bottom: uiContext!.vp2px(halfHeight + 50 * this.scaleY)
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
    const uiContext = AppStorage.get<UIContext>('uiContext');
    context.canvas.drawRect({
      left: uiContext!.vp2px(halfWidth - 30 * this.scaleX),
      top: uiContext!.vp2px(halfHeight - 30 * this.scaleY),
      right: uiContext!.vp2px(halfWidth + 30 * this.scaleX),
      bottom: uiContext!.vp2px(halfHeight + 30 * this.scaleY)
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
    const uiContext = AppStorage.get<UIContext>('uiContext');
    context.canvas.drawCircle(uiContext!.vp2px(halfWidth), uiContext!.vp2px(halfHeight), uiContext!.vp2px(20 * radiusScale));
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
    const uiContext = AppStorage.get<UIContext>('uiContext');
    context.canvas.drawCircle(uiContext!.vp2px(halfWidth), uiContext!.vp2px(halfHeight), uiContext!.vp2px(20 * radiusScale));
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
  private count: number = 0;

  create() {
    let self = this;

    this.drawAnimator = this.getUIContext().createAnimator({
      duration: 1000,
      easing: 'ease',
      delay: 0,
      fill: 'forwards',
      direction: 'normal',
      iterations: 1,
      begin: 0,
      end: 2
    } as AnimatorOptions) as AnimatorResult;

    this.drawAnimator!.onFrame= (value: number):void => {
      console.log('frame value =', value);
      const tempModifier = self.modifier as MyFullDrawModifier | MyFrontDrawModifier;
      tempModifier.scaleX = Math.abs(value - 1);
      tempModifier.scaleY = Math.abs(value - 1);
      self.modifier.invalidate();

    }

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
              .onClick((e:ClickEvent) => {
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