'use static';
/*
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
import emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '../../../../../hypium/index';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  ArrowPosition,
  Resource,
  Font,
  FontStyle,
  $r,
  OnSelectCallback,
  Select,
  Margin
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import testsuite from '../../../../src/test/List.test';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct SelectExample {
  @State font: Font = {
    size: 30,
    weight: 400,
    family: 'serif',
    style: FontStyle.Normal
  } as Font
  @State fontColor: int = 0xCCCCCC as int
  @State spaceValue: number = 8
  @State spaceValueString: string = '50.00vp'
  @State arrowPosition: ArrowPosition = ArrowPosition.END
  @State spaceValueResource: Resource = $r('app.string.Test_Values')

  private stateChangCallBack: (eventData:emitter.EventData) => void  = (eventData: emitter.EventData) => {
    console.info("selectTest stateChangCallBack before:" + JSON.stringify(eventData));
    if (eventData != null) {

      const data = eventData.data as Record<String,RecordData>
      if (data['spaceValue'] != null) {
        this.spaceValue = data['spaceValue'] as number ;
        console.info("select page state change called after spaceValue:" + this.spaceValue);
      }
      if (data['arrowPosition'] != null) {
        this.arrowPosition = data['arrowPosition'] as ArrowPosition ;
        console.info("select page state change called after arrowPosition:" + this.arrowPosition);
      }
      if (data['spaceValueString'] != null) {
        this.spaceValueString = data['spaceValueString'] as string;
        console.info("select page state change called after spaceValueString:" + this.spaceValueString);
      }
      if (data['spaceValueResource'] != null) {
        this.spaceValueResource = data['spaceValueResource'] as Resource;
        console.info("select page state change called after spaceValueResource:" + this.spaceValueResource);
      }
    }
  }
  aboutToAppear() {
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 181,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Select([{ value: 'aaa', icon: "/images/img.png" },
        { value: 'bbb', icon: "/images/img.png" },
        { value: 'ccc', icon: "/images/img.png" },
        { value: 'ddd', icon: "/images/img.png" }])
        .selected(2)
        .value('TTT')
        .font(this.font)
        .fontColor(this.fontColor)
        .selectedOptionFont({
          size: 40,
          weight: 500,
          family: 'serif',
          style: FontStyle.Normal
        })
        .optionFont({
          size: 30,
          weight: 400,
          family: 'serif',
          style: FontStyle.Normal
        })
        .key('selectTest')
        .onSelect((index: int, text?: undefined | string) => {
          console.info("Select:" + index)
        } as OnSelectCallback)
        .space(this.spaceValue)
        .arrowPosition(this.arrowPosition)

      .margin({ bottom: 40 } as Margin)

      Select([{ value: 'aaa', icon: "/images/img.png" },
        { value: 'bbb', icon: "/images/img.png" },
        { value: 'ccc', icon: "/images/img.png" },
        { value: 'ddd', icon: "/images/img.png" }])
        .selected(2)
        .value('TTT')
        .font(this.font)
        .fontColor(this.fontColor)
        .selectedOptionFont({
          size: 40,
          weight: 500,
          family: 'serif',
          style: FontStyle.Normal
        })
        .optionFont({
          size: 30,
          weight: 400,
          family: 'serif',
          style: FontStyle.Normal
        })
        .key('selectTest2')
        .onSelect((index: int, text?: undefined | string) => {
          console.info("Select:" + index)
        } as OnSelectCallback)
        .space(this.spaceValueString)
        .arrowPosition(this.arrowPosition)
      .margin({ bottom: 40 } as Margin)

      Select([{ value: 'aaa', icon: "/images/img.png" },
        { value: 'bbb', icon: "/images/img.png" },
        { value: 'ccc', icon: "/images/img.png" },
        { value: 'ddd', icon: "/images/img.png" }])
        .selected(2)
        .value('TTT')
        .font(this.font)
        .fontColor(this.fontColor)
        .selectedOptionFont({
          size: 40,
          weight: 500,
          family: 'serif',
          style: FontStyle.Normal
        })
        .optionFont({
          size: 30,
          weight: 400,
          family: 'serif',
          style: FontStyle.Normal
        })
        .key('selectTest3')
        .onSelect((index: int, text?: undefined | string) => {
          console.info("Select:" + index)
        } as OnSelectCallback)
        .space(this.spaceValueResource)
        .arrowPosition(this.arrowPosition)
    }

  }
}
