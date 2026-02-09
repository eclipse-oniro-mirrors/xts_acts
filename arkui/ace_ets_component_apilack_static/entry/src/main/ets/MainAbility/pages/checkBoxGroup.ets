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

import prompt from '@ohos.prompt'
import events_emitter from '@ohos.events.emitter';
import Log from '../common/Log';
import {
  Entry,
  Component,
  Flex,
  CheckboxGroupResult,
  Checkbox,
  Text,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Scroll,
  Column,
  CheckboxGroup
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CheckBoxGroupSelectAll {
  @State isSelect: boolean = true;

  onPageShow() {
    console.info('[CheckBoxGroup] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 60203,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  aboutToAppear():void {
    Log.showInfo(TAG, `aboutToAppear CheckBoxGroupSelectAll start`)
  }

  aboutToDisappear():void {
    Log.showInfo(TAG, `aboutToDisAppear CheckBoxGroupSelectAll end`)
  }

  showToast(message: string) {
    prompt.showToast({
      message: message,
      duration: 2000
    });
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("checkBoxGroup-SelectAll")
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
        .key("selectAllText")

      Scroll() {
        Column() {
          CheckboxGroup({ group: 'checkboxGroup' })
            .selectedColor(0xed6f21)
            .key('CheckboxGroup')
            .selectAll(this.isSelect)
            .onChange((itemName: CheckboxGroupResult) => {
              console.info("TextPicker::dialogResult is" + JSON.stringify(itemName))
              this.showToast(itemName.status.valueOf() == 0 ? "selectAll true" : "selectAll false");
            })
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .key("CheckboxOne")
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is' + value)
            })
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              console.info('Checkbox2 change is' + value)
            })
          Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              console.info('Checkbox3 change is' + value)
            })
        }
      }

    }.width("100%").height("100%")
  }

  private stateChangCallBack:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[CheckBoxGroup] page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("[CheckBoxGroup] page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['isSelect'] != null) {
        this.isSelect = data['isSelect'] as boolean
      }
    }
  }
}

