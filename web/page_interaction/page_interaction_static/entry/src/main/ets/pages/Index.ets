'use static'

/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Button, ClickEvent, Column, Component, Entry, Text } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  @State str: string = ''
  message: string = 'var';

  changeValue() {
    this.stateVar += '~'
  }

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      if (eventData != null) {
        console.info('valueChangeCallBack:' + JSON.stringify(eventData));
        const data = eventData.data as Record<string, RecordData>;
        if (data != null && data['ACTION'] != null) {
          let strValue: string = String(data['ACTION']);
          this.str = strValue;
        }
      }
      console.log('valueChangeCallBack str: ' + this.str)
    }

  aboutToAppear() {
    console.log('aboutToAppear')
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF').key('Router')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
          this.changeValue();
          this.getUIContext().getRouter().pushUrl({
            url: this.str,
          });
        })
      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';

  build() {
    Text(this.stateVar).fontSize(50)
  }
}