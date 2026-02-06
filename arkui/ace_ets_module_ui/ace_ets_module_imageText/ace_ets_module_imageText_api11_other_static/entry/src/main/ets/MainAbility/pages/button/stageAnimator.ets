'use static';
/*
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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { AnimatorResult, AnimatorOptions } from '@ohos.animator';

@Entry
@Component
struct stageAnimator {
  private TAG: string = '[AnimatorTest]';
  private backAnimator: AnimatorResult | undefined = undefined;
  private flag: boolean = false;
  @State wid: number = 100;
  @State hei: number = 100;

  create() {
    let _this = this
    this.backAnimator = AppStorage.get<UIContext>('uiContent')!.createAnimator({
      duration: 1500,
      easing: "friction",
      delay: 0,
      fill: "forwards",
      direction: "normal",
      iterations: 3,
      begin: 200,
      end: 400
    } as AnimatorOptions)

    this.backAnimator!.onFinish = () => {
      _this.flag = true
      console.info(_this.TAG, 'backAnimator onfinish')
    }
    this.backAnimator!.onRepeat = () => {
      console.info(_this.TAG, 'backAnimator repeat')
    }
    this.backAnimator!.onCancel = () => {
      console.info(_this.TAG, 'backAnimator cancel')
    }
    this.backAnimator!.onFrame = (value: number) => {
      _this.wid = value
      _this.hei = value
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('animator-play')
        .width(100)
        .height(70)
        .fontSize(30)
        .fontColor(Color.Black)
        .onClick((e: ClickEvent) => {
          this.create();
          this.flag = false
          this.backAnimator!.play()
        })
        .key("animator")
    }.width("100%").height("100%")
  }
}
