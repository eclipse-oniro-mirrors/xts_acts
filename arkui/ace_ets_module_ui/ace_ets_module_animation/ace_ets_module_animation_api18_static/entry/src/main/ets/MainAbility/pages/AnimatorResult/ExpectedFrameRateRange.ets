'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { UIContext } from '@ohos.arkui.UIContext';
import emitter from '@ohos.events.emitter';
import {
  $r,
  Circle,
  ClickEvent,
  Column,
  Component,
  Entry,
  ExpectedFrameRateRange,
  KeyframeAnimateParam,
  KeyframeState,
  Margin,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ExpectedFrameRateRange {
  @State myScale: number = 1.0;
  @State expectedNumber: int = 90;
  @State minNumber: int = 60;
  @State maxNumber: int = 120;
  uiContext: UIContext | undefined = undefined;

  aboutToAppear() {
    this.uiContext = this.getUIContext();
  }

  build() {
    Column() {
      Circle()
        .id('circleId')
        .width(100)
        .height(100)
        .fill('#46B1E3')
        .margin(100)
        .scale({ x: this.myScale, y: this.myScale })
        .onClick(() => {
          if (!this.uiContext) {
            console.info('no uiContext, keyframe failed');
            return;
          }
          this.myScale = 1;
          this.uiContext!.keyframeAnimateTo(
            {
              iterations: 5,
              expectedFrameRateRange: {
                max: this.maxNumber,
                expected: this.expectedNumber,
                min: this.minNumber,
              },
              onFinish: () => {
                try {
                  let backData: emitter.EventData = {
                    data: {
                      'min': this.minNumber,
                      'expected': this.expectedNumber,
                      'max': this.maxNumber,
                    } as Record<String,RecordData>
                  }
                  let backEvent: emitter.InnerEvent = {
                    eventId: 51,
                    priority: emitter.EventPriority.LOW
                  } as emitter.InnerEvent
                  console.info('onFinish start to emit action state')
                  emitter.emit(backEvent, backData)
                } catch (err) {
                  console.info('onFinish emit action state err: ' + JSON.stringify((err as Error)?.message))
                }
              },
            } as KeyframeAnimateParam
            ,
            [
              {
                duration: 1000,
                event: () => {
                  this.myScale = 1.5;
                }
              } as KeyframeState,
              {
                duration: 2000,
                event: () => {
                  this.myScale = 0.8;
                }
              } as KeyframeState
            ] as Array<KeyframeState>
          );
        })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}