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
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Component,
  Column,
  Text,
  Rating,
  Margin,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  CheckboxGroupResult,
  Alignment,
  TextAlign,
  TextOverflow,
  CheckboxGroup,
  Checkbox,
  Color,
  $r,
  CheckBoxShape,
  Scroll
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct CheckboxGroupExample {
  @State select: boolean = false
  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    console.info("checkboxGroup page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("checkboxGroup page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as ESObject                        //需要先获取并声明类型之后  再访问成员属性
      if (data?.getProperty('select') != null) {
        this.select = data.getProperty('select').toBoolean();
      }
    }
  }

  onPageShow() {
    console.info('checkboxGroup page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 75,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  build() {
    Scroll() {
      Column() {
        CheckboxGroup({ group: 'checkboxGroup' })
          .selectedColor('0xed6f21')
          .key('CheckboxGroup')
          .onChange((itemName: CheckboxGroupResult):void => {
            console.info("TextPicker::dialogResult is" + JSON.stringify(itemName))
          })
        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select(true)
          .selectedColor(0x39a2db)
          .onChange((value: boolean):void => {
            console.info('Checkbox1 change is' + value)
          })
        Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
          .select(false)
          .selectedColor(0x39a2db)
          .onChange((value: boolean):void => {
            console.info('Checkbox2 change is' + value)
          })
        Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
          .select(true)
          .selectedColor(0x39a2db)
          .onChange((value: boolean):void => {
            console.info('Checkbox3 change is' + value)
          })
      }
    }
  }
}