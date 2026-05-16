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
  BaseGestureEvent,
  Column,
  Component,
  Entry,
  GestureControl,
  GestureJudgeResult,
  GestureRecognizer,
  SwipeGesture,
  SwipeRecognizer,
  Text
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct SwipeRecognizerExample {
  @State value: string = ''

  build() {
    Column() {
      Column() {
        Text(this.value).key('value')
      }
      .key('SwipeRecognizer')
      .height('100%')
      .width('100%')
      .gesture(SwipeGesture())
      .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>): GestureJudgeResult => {
        if (current) {
          if (current.getType() == GestureControl.GestureType.SWIPE_GESTURE) {
            let target = current as SwipeRecognizer;
            this.value = 'SwipeGesture\ndirection:' + target.getDirection() + '\nfingers:' +
            target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit() + '\nspeed:' +
            Math.round(target.getVelocityThreshold());
          }
        }
        return GestureJudgeResult.CONTINUE;
      })
    }.width('100%')
  }
}