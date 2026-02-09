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
import events_emitter from '@ohos.events.emitter';
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
  ButtonType,
  PatternLockController,
  PatternLock
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
@Entry
@Component
struct FocusableExample {
  @State textOne: string = '';
  @State textTwo: string = '';
  @State textThree: string = 'The third button cannot be focused';
  @State oneButtonColor: string = '#FF0000';
  @State twoButtonColor: string = '#FFC0CB';
  @State threeButtonColor: string = '#87CEFA';
  @State focusable1: boolean = false;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button(this.textOne)
        .backgroundColor(this.oneButtonColor)
        .width(300)
        .height(70)
        .fontColor(Color.Black)
        .focusable(this.focusable1)
        .onFocus(() => {
          this.textOne = 'First Button onFocus'
          this.oneButtonColor = '#AFEEEE'
        })
        .onBlur(() => {
          this.textOne = 'First Button onBlur'
          this.oneButtonColor = '#FFC0CB'
        })
      Button(this.textTwo)
        .backgroundColor(this.twoButtonColor)
        .width(300)
        .height(70)
        .fontColor(Color.Black)
        .focusable(this.focusable1)
        .onFocus(() => {
          this.textTwo = 'Second Button onFocus'
          this.twoButtonColor = '#AFEEEE'
        })
        .onBlur(() => {
          this.textTwo = 'Second Button onBlur'
          this.twoButtonColor = '#FFC0CB'
        })
      Button(this.textThree)
        .backgroundColor(this.threeButtonColor)
        .width(300)
        .height(70)
        .fontColor(Color.Black)
        .focusable(this.focusable1)
        .onFocus(() => {
          this.textThree = 'Third Button onFocus'
          this.threeButtonColor = '#AFEEEE'
        })
        .onBlur(() => {
          this.textThree = 'Third Button onBlur'
          this.threeButtonColor = '#FFC0CB'
        })
    }.width('100%')
    .margin({ top: 20 } as Margin)
  }

  private stateChangCallBack:(eventData: events_emitter.EventData) => void =  (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("focus page state change called:" + JSON.stringify(eventData));
      if ((eventData.data as ESObject)?.getProperty('focusable')!= null) {
        this.focusable1 = (eventData.data as ESObject).getProperty('focusable').toBoolean();
      }
    }
  }

  onPageShow() {
    console.info('focus page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 101,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }


}