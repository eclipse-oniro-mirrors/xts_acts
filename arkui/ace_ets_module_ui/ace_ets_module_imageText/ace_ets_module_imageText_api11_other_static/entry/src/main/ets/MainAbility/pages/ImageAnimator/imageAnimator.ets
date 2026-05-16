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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
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
  TextOverflow,
  AnimationStatus,
  FillMode,
  ImageAnimator,
  $rawfile
} from '@ohos.arkui.component';
import { State, AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ImageAnimatorExample {
  @StoragePropRef('state') state: AnimationStatus = AnimationStatus.Initial
  @StoragePropRef('reverse') reverse: boolean = false
  @StoragePropRef('iterations') iterations: int = 1
  @StoragePropRef('fixedSize') fixedSize: boolean = true
  @StoragePropRef('fillMode') fillMode: FillMode = FillMode.None
  @StoragePropRef('duration') duration: int = 2000
  @StoragePropRef('duration1') duration1: int = 0
  // ImageFrameIno constructor parameter
  @StoragePropRef('widthT') widthT: number = 20;
  @StoragePropRef('heightT') heightT: number = 20;
  @StoragePropRef('top') top: number = 20;
  @StoragePropRef('left') left: number = 20;
  @StoragePropRef('message1') message1: string = "ani"
  @StoragePropRef('message2') message2: string = "ani"
  @StoragePropRef('message3') message3: string = "ani"
  @StoragePropRef('message4') message4: string = "ani"
  @StoragePropRef('message5') message5: string = "ani"

  onPageShow() {
    console.info('imageAnimator onPageShow')
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      ImageAnimator()
        .images([
          {
            src: $rawfile('img1.png'),
            width: this.widthT,
            height: this.heightT,
            top: this.top,
            left: this.left,
            duration: this.duration1
          },
          {
            src: $rawfile('img2.png'),
            width: 30,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img3.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          }
        ])
        .duration(this.duration)
        .state(this.state)
        .reverse(this.reverse)
        .fixedSize(this.fixedSize)
        .fillMode(this.fillMode)
        .iterations(this.iterations)
        .width(340)
        .height('50%')
        .key('imageAnimator')
        .onStart(() => {
          console.info('Start123456')
          this.message1 = 'start'
        })
        .onPause(() => {
          console.info('Pause')
          this.message2 = 'pause'
        })
        .onRepeat(() => {
          console.info('Repeat')
          this.message3 = 'onRepeat'
        })
        .onCancel(() => {
          console.info('Cancel')
          this.message4 = 'onCancel'
        })
        .onFinish(() => {
          console.info('Finish')
          this.state = AnimationStatus.Stopped
          this.message5 = 'onFinish'
        })
        .width('100%')
        .height('50%')

      Row() {
        Button('start').width('30%').onClick((e: ClickEvent) => {
          this.state = AnimationStatus.Running
        }).key('start').id('start')
        Button('pause').width('30%').onClick((e: ClickEvent) => {
          this.state = AnimationStatus.Paused // 显示当前帧图片
        }).key('pause').id('pause')
        Button('stop').width('30%').onClick((e: ClickEvent) => {
          this.state = AnimationStatus.Stopped // 显示动画的起始帧图片
        })
      }.height('5%')

      Row() {
        Button('reverse').width('30%').onClick((e: ClickEvent) => {
          this.reverse = !this.reverse
        }).key('reverse').id('reverse')
        Button('once').width('30%').onClick((e: ClickEvent) => {
          this.iterations = 1
        })
        Button('infinite').width('30%').onClick((e: ClickEvent) => {
          this.iterations = -1 // 无限循环播放
        }).key('infinite').id('infinite')
      }.height('5%')

      Row() {
        Text(this.message1).key('t1').width('45%')
        Text(this.message2).key('t2').width('45%')
      }.height('5%')

      Row() {
        Text(this.message3).key('t3').width('45%')
        Text(this.message4).key('t4').width('45%')
      }.height('5%')

      Text(this.message5).key('t5').height('5%')
    }.width('100%').height('100%')
  }
}
