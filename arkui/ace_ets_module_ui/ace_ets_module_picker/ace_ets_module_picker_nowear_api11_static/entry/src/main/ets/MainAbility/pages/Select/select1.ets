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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  Font,
  FontStyle,
  Select,
  OnSelectCallback, ResourceColor, Margin, ArrowPosition
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import  emitter  from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';


@Entry
@Component
struct select1 {
  @State value: string = '10';
  @State font: Font = {
    size: 30,
    weight: 400,
    family: 'serif',
    style: FontStyle.Normal
  } as Font
  @State fontColor: ResourceColor = 0xCCCCCC

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("select page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      if (data['value'] != null) {
        console.log('-----this.value = ' + this.value)
        this.value = data['value'] as string;
        console.log('-----this.value = ' + this.value)
      }
      if (data['font'] != null) {
        console.log('-----data[font] = ' + data['font'])
        this.font = data['font'] as Font;
        console.log('-----this.font = ' + this.font.family)
      }
      if (data['fontColor'] != null) {
        console.log('-----data[fontColor] = ' + data['fontColor'])
        this.fontColor = data['fontColor'] as ResourceColor;
        console.log('-----this.fontColor = ' + this.fontColor)
      }
    }
  };

  aboutToAppear() {
    console.info('select page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 191,
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
        .value(this.value)
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
        .key('select')
        .onSelect((index: int, text?: string | undefined) => {
          console.info("Select:" + index)
        } as OnSelectCallback)
    }
  }
}