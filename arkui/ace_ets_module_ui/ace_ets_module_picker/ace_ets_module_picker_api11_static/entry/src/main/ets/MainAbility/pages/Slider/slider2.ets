'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import Log from '../../common/Log';
import Utils from '../../common/Utils';
import events_emitter from '@ohos.events.emitter';
import RectValue from '../../common/Rect';
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  Slider,
  SliderChangeMode,
  SliderStyle,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  FlexAlign,
  Rating,
  Alignment,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SliderMoving {
  @State outSetValue: double = 40;
  @State move: SliderChangeMode = SliderChangeMode.Moving;

  slide() {
    let rect: RectValue = Utils.getComponentRect("Slider")
    Utils.drag(rect.left, rect.top, rect.right, rect.bottom, 20)
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SliderMoving start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SliderMoving end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("slider-Moving")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("MovingText")

      Slider({
        value: this.outSetValue,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet
      })
        .key("Slider")
        .blockColor(Color.Blue)
        .trackColor(Color.Gray)
        .selectedColor(Color.Blue)
        .showSteps(true)
        .showTips(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          console.info("Slider emit action state err11: ")
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Mode": 0 as double
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60307,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("Slider start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("Slider emit action state err: " + JSON.stringify((err as Error).message))
          }
        })
        .onClick((e:ClickEvent)=>{
          this.slide()
        })

    }.width("100%").height("100%")
  }
}

