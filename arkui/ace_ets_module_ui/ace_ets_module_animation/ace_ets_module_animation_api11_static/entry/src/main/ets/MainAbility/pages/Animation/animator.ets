'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { Callback, MessageManager } from '../../utils/MessageManager';
import { AnimatorOptions, AnimatorResult, SimpleAnimatorOptions } from '@ohos.animator';
import {
  Alignment,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Curve,
  Entry,
  ExpectedFrameRateRange,
  FillMode,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  ItemAlign,
  List,
  ListItem,
  Margin,
  PlayMode,
  Row,
  Scroll,
  ScrollDirection,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component'
import { AppStorage, Link, State, StorageLink, Watch } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import curves from '@ohos.curves';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AnimatorOnframe {
  @State test003Width: number = 50
  @State test003onFinish: string = '0'
  @State test004Width: number = 50
  @State test004onRepeat: string = '0'
  @State test005Width: number = 50
  @State test005onCancel: string = '0'
  private test003Animator: AnimatorResult | undefined = undefined
  private test004Animator: AnimatorResult | undefined = undefined
  private test005Animator: AnimatorResult | undefined = undefined

  aboutToAppear() {
    this.create003animator()
    this.create004animator()
    this.create005animator()
    console.log(`aboutToAppear AnimatorOnframe start`)
  }

  create003animator() {
    this.test003Animator = this.getUIContext().createAnimator(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000 as Int)
        .delay(1000 as Int)
        .fill(FillMode.Forwards)
        .easing('ease')
        .iterations(2 as Int)
        .direction(PlayMode.Normal)
    )
    if (this.test003Animator) {
      this.test003Animator!.setExpectedFrameRateRange({
        min: 30,
        expected: 60,
        max: 120
      })
      this.test003Animator!.onFrame = (value: number) => {
        this.test003Width = 50 + value
      }
      this.test003Animator!.onFinish = () => {
        this.test003onFinish = '1'
      }
    }
  }

  create004animator() {
    this.test004Animator = this.getUIContext().createAnimator(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('ease')
        .iterations(3)
        .direction(PlayMode.Normal)
    )
    if (this.test004Animator) {

      this.test004Animator!.onFrame = (value: number) => {
        this.test004Width = 50 + value
      }

      this.test004Animator!.onRepeat = () => {
        this.test004onRepeat = '1'
      }
    }
  }

  create005animator() {
    this.test005Animator = this.getUIContext().createAnimator(
      new SimpleAnimatorOptions(100, 200)
        .duration(1000)
        .delay(1000)
        .fill(FillMode.Forwards)
        .easing('ease')
        .iterations(-1)
        .direction(PlayMode.Normal)
    )
    if (this.test005Animator) {

      this.test005Animator!.onFrame = (value: number) => {
        this.test005Width = 50 + value
      }

      this.test005Animator!.onCancel = () => {
        this.test005onCancel = '1'
      }
    }
  }

  aboutToDisappear() {
    hilog.info(0x0000, TAG, '%{public}s', 'aboutToDisAppear AnimatorOnframe end');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("animator-Onframe")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor('#FFCCCCCC')
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onframeText")
      Text(this.test003Width + '')
        .width(this.test003Width)
        .height('10%')
        .fontSize(10)
        .backgroundColor(Color.Green)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
        .lineHeight(25)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test003')
      Text('animator-Test004:' + this.test004onRepeat)
        .width(this.test004Width)
        .height('10%')
        .fontSize(10)
        .backgroundColor(Color.Yellow)
        .align(Alignment.TopStart)
        .fontColor('0xCCCCCC')
        .lineHeight(25)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test004')
      Text('animator-Test005:' + this.test005onCancel)
        .width(this.test005Width)
        .height('10%')
        .fontSize(10)
        .backgroundColor(Color.Pink)
        .align(Alignment.TopStart)
        .fontColor(Color.Black)
        .lineHeight(25)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('Test005')
      Button('Play')
        .onClick((e: ClickEvent) => {
          console.log('test click start ')
          this.test003Animator?.play()
          this.test004Animator?.play()
          this.test005Animator?.play()
        })
        .height('5%')
        .key('Play')
      Button('Cancel')
        .onClick((e: ClickEvent) => {
          this.test005Animator?.cancel()
        })
        .key('Cancel')
        .height('5%')
    }
    .width("100%")
    .height("100%")
  }
}

