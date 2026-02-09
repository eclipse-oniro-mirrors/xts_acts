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
  Component,
  Column,
  Text,
  TapGesture,
  BaseGestureEvent,
  GestureRecognizer,
  GestureJudgeResult,
  GestureControl,
  TapRecognizer
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
@Entry
@Component
struct TapRecognizerExample {
  @State message: string = '';
  build() {
    Column() {
      Text(this.message)
        .key('TapRecognizer')

        .width('100%')
        .height('100%')
        .gesture(TapGesture())
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          others: Array<GestureRecognizer>):GestureJudgeResult => {
          if (current) {
            if (current.getType() == GestureControl.GestureType.TAP_GESTURE) {
              let target = current as TapRecognizer;
              this.message = 'TapGesture\ncount:' + target.getTapCount() + '\nfingers:' +
              target.getFingerCount() + '\nisFingerCountLimited:' + target.isFingerCountLimit();
            }
          }
          return GestureJudgeResult.CONTINUE;
        })
    }
  }
}