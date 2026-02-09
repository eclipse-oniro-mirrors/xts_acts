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

import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, LoadingProgressStyle, FlexDirection, ItemAlign, FlexAlign, Flex, FlexOptions, Text,
  PatternLock, PatternLockController, Alignment, TextAlign, TextOverflow, LoadingProgress, Color, ClickEvent, Button} from '@ohos.arkui.component'
import { State,  AppStorage } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct PatternLockExample {
  @State passwords: Array<int> = new Array<int>();
  @State message: string = 'please input password';
  @State sideLength: number = 150;
  @State circleRadius: number = 7;
  @State pathStrokeWidth: number = 17;
  @State backgroundColor1: string = "#FF008000";
  @State autoReset: boolean = true;
  private patternLockController: PatternLockController = new PatternLockController();
  @State onActionCalled: boolean = false;

  onPageShow() {
    console.info('[PatternLock] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 152,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

  }

  private stateChangCallBack: (eventData: events_emitter.EventData)=>void = (eventData: events_emitter.EventData) => {
    console.info("[PatternLock] page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("[PatternLock] page state change called:" + JSON.stringify(eventData));
      if (((eventData.data) as ESObject).getProperty('sideLength') != null) {
        this.sideLength = ((eventData.data) as ESObject).getProperty('sideLength').toNumber();
      }
      if (((eventData.data) as ESObject).getProperty('circleRadius') != null) {
        this.circleRadius = ((eventData.data) as ESObject).getProperty('circleRadius').toNumber();
      }
      if (((eventData.data) as ESObject).getProperty('pathStrokeWidth') != null) {
        this.pathStrokeWidth = ((eventData.data) as ESObject).getProperty('pathStrokeWidth').toNumber();
      }
      if (((eventData.data) as ESObject).getProperty('backgroundColor') != null) {
        this.backgroundColor1 = ((eventData.data) as ESObject).getProperty('backgroundColor').toString();
      }
      if (((eventData.data) as ESObject).getProperty('autoReset') != null) {
        this.autoReset = ((eventData.data) as ESObject).getProperty('autoReset').toBoolean();
      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.message).textAlign(TextAlign.Center)
      PatternLock(this.patternLockController)
        .sideLength(this.sideLength)
        .circleRadius(this.circleRadius)
        .pathStrokeWidth(this.pathStrokeWidth)
        .backgroundColor(`${this.backgroundColor1}`)
        .autoReset(this.autoReset)
        .key('PatternLock')
        .onPatternComplete((input: Array<int>): void => {
          console.log('PatternLock onPatternComplete')
          if (input == null || input == undefined || input.length < 5) {
            this.message = 'The password length needs to be greater than 5.';
            console.log('The password length needs to be greater than 5');
            return
          }
          if (this.passwords.length > 0) {
            if (this.passwords.toString() == input.toString()) {
              this.passwords = input;
              this.message = 'Set password successfully: ' + this.passwords.toString();
              console.log('Set password successfully: ' + this.passwords.toString());

            } else {
              this.message = 'Inconsistent passwords, please enter again.';
              console.log('Inconsistent passwords, please enter again');
            }
          } else {
            this.passwords = input;
            this.message = "Please enter again.";
            console.log('Please enter again');
          }
        })
      Button('reset button').margin(30).onClick((e: ClickEvent) => {
        this.patternLockController.reset();
        this.passwords = [];
        this.message = 'Please input password';
        this.onActionCalled = true;
        try {
          let backData: events_emitter.EventData = {
            data: {
              "ACTION": this.onActionCalled,
            } as Record<String,RecordData>
          } as events_emitter.EventData
          let backEvent: events_emitter.InnerEvent = {
            eventId: 153,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("reset button start to emit action state");
          events_emitter.emit(backEvent, backData);


        } catch (err) {
          console.info("reset button emit action state err: " + JSON.stringify((err as Error)?.message));
        }
      }).key('button1')
    }
    .width('100%')
    .height('100%')
  }
}