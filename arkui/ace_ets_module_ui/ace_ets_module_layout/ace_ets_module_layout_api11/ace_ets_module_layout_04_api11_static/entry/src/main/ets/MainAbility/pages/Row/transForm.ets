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
import { Entry, Component, Row, Column, Text, RotateOptions, FlexAlign, ScaleOptions, Margin } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Matrix4 from '@ohos.matrix4';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct TransformExample {
  @State rotateValue: RotateOptions = {
    x: 1,
    y: 1,
    z: 1,
    centerX: '50%',
    centerY: '50%',
    angle: 300
  } as RotateOptions;
  @State scaleValue: ScaleOptions = { x: 2, y: 0.5 } as ScaleOptions;
  @State transformValue: Matrix4.Matrix4Transit = Matrix4.identity().translate({ x: 100, y: 100, z: 30 });
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("transFormExample page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      if (data['rotateValue'] != null) {
        this.rotateValue = data['rotateValue'] as RotateOptions ;
      }
      if (data['scaleValue'] != null) {
        this.scaleValue = data['scaleValue'] as ScaleOptions;
      }
    }
  };

  onPageShow() {
    console.info('transFormExample page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 45,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 46,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text('rotate')
        .width('90%')
        .fontColor(0xCCCCCC)
        .padding(15)
        .fontSize(30)
      Row()
        .rotate(this.rotateValue)
        .width(100)
        .height(100)
        .backgroundColor(0xAFEEEE)
        .key('rotate')

      Text('translate')
        .width('90%')
        .fontColor(0xCCCCCC)
        .padding(10)
        .fontSize(30)
      Row()
        
        .width(100)
        .height(100)
        .backgroundColor(0xAFEEEE)
        .margin({ bottom: 10 } as Margin)
        .key('rotate2')

      Text('scale')
        .width('90%')
        .fontColor(0xCCCCCC)
        .padding(15)
        .fontSize(30)
      Row()
        .scale(this.scaleValue)
        .width(100)
        .height(100)
        .backgroundColor(0xAFEEEE)
        .key('rotate3')

      Text('Matrix4')
        .width('90%')
        .fontColor(0xCCCCCC)
        .padding(15)
        .fontSize(30)
      Row()
        .width(100)
        .height(100)
        .backgroundColor(0xAFEEEE)
        .transform(Matrix4.identity().translate({ x: 100, y: 100, z: 30 }))
        .key('rotate4')
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }
}
