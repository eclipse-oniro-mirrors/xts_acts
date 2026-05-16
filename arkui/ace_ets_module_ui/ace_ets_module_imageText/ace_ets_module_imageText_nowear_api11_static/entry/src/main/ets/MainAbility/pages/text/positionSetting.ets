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
import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
  Alignment,
  Direction,
  ColumnOptions,
  Color,
  Row,
  Stack,
  RowOptions,
  Image,
  BorderStyle,
  Position
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PositionSetting {
  @State alignT: Alignment = Alignment.TopStart;
  @State directionT: Direction = Direction.Rtl;
  @State position1: Position = {x: 25, y: 15} as Position;
  @State position2: Position = {x: '50%', y: '70%'} as Position;
  @State anchor: Position = {x: 25, y: 25} as Position;
  @State offsetT: Position = {x: 10, y: 15} as Position;
  @State opacityValue: double = 1;

  build() {
    Column() {
      Column({space: 10} as ColumnOptions) {
        Text('opacity(1)').fontSize(20).fontColor(Color.Black).width('90%').opacity(this.opacityValue).key("opacity")
        Text('top start')
          .align(this.alignT)
          .height(50)
          .width('90%')
          .fontSize(20)
          .backgroundColor(Color.Red)
          .key('textAlign')

        Text('direction').fontSize(20).fontColor(Color.Black).width('90%')
        Row() {
          Text('1').height(50).width('25%').fontSize(20).backgroundColor(Color.Red)
          Text('2').height(50).width('25%').fontSize(20).backgroundColor(Color.Red)
          Text('3').height(50).width('25%').fontSize(20).backgroundColor(Color.Red)
          Text('4').height(50).width('25%').fontSize(20).backgroundColor(Color.Red)
        }
        .width('90%')
        .direction(this.directionT)
        .key('rowDirection')

        Text('position').fontSize(20).fontColor(Color.Black).width('90%')
        Row({ space: 20 } as RowOptions) {
          Text('1')
            .size({ width: '45%', height: '50' })
            .backgroundColor(Color.Red)
            .border({ width: 1 })
            .fontSize(20)
          Text(`2 position(${this.position1.x}, ${this.position1.y})`)
            .size({ width: '60%', height: '30' })
            .backgroundColor(Color.Red).border({ width: 1 })
            .fontSize(20).align(Alignment.Start)
            .position({ x: this.position1.x, y: this.position1.y } as Position)
            .key('position1')
          Text('3')
            .size({ width: '45%', height: '50' })
            .backgroundColor(Color.Red)
            .border({ width: 1 }).fontSize(20)
          Text(`4 position(${this.position2.x}, ${this.position2.y})`)
            .size({ width: '50%', height: '50' })
            .backgroundColor(Color.Red)
            .border({ width: 1 }).fontSize(20)
            .position({ x: this.position2.x, y: this.position2.y } as Position)
            .key('position2')
        }.width('90%').height(100).border({ width: 1, style: BorderStyle.Dashed })

        Text('markAnchor').fontSize(20).fontColor(Color.Black).width('90%')
        Stack({ alignContent: Alignment.TopStart }) {
          Row()
            .size({ width: '100', height: '100' })
            .backgroundColor(Color.Red)
          Image('/images/ic_health_heart.png')
            .size({ width: 25, height: 25 })
            .markAnchor({ x: this.anchor.x, y: this.anchor.y } as Position)
            .key('markAnchor')
          Image('/images/ic_health_heart.png')
            .size({ width: 25, height: 25 })
            .markAnchor({ x: 25, y: 25 } as Position)
            .position({ x: '100%', y: '100%' } as Position)
        }.margin({ top: 25 } as Margin).border({ width: 1, style: BorderStyle.Dashed })

        Text('offset').fontSize(20).fontColor(Color.Black).width('90%')
        Row() {
          Text('1').size({ width: '15%', height: '100' }).backgroundColor(Color.Red).border({ width: 1 }).fontSize(20)
          Text(`2\noffset(${this.offsetT.x}, ${this.offsetT.y})`)
            .size({ width: 170, height: '50' }).backgroundColor(Color.Red).border({ width: 1 })
            .fontSize(20).align(Alignment.Start)
            .offset({ x: this.offsetT.x, y: this.offsetT.y } as Position)
            .key('offset')
          Text('3').size({ width: '15%', height: '50' }).backgroundColor(Color.Red).border({ width: 1 }).fontSize(20)
          Text('4\noffset(-10%, 20%)')
            .size({ width: 170, height: '50' }) .backgroundColor(Color.Red).border({ width: 1 }).fontSize(20)
            .offset({ x: '-10%', y: '50%' } as Position)
        }.width('90%').height(100).border({ width: 1, style: BorderStyle.Dashed })
      }
    }
    .width('100%').margin({ top: 5 } as Margin)
  }
  onPageShow() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 25,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }
  stateChangCallBack:(eventData: events_emitter.EventData) => void =  (eventData: events_emitter.EventData) =>  {
    let eventD = eventData.data as Record<String,RecordData>
    if (eventData != null && eventD != null) {
      if (eventD!['textAlign']) {
        this.alignT = Alignment.BottomEnd;
      } else if (eventD!['directionT']!= null) {
        console.info('directionTdirectionTdirectionT',eventD!['directionT'])
        this.directionT =  eventD!['directionT'] as Direction;
        console.info('directionTdirectionTdirectionT22',this.directionT)
      } else if (eventD!['position1']!= null) {
        this.position1 = eventD!['position1'] as Position;
        this.position2 = eventD!['position2'] as Position;

      } else if (eventD!['anchor']!= null) {
        this.anchor = eventD!['anchor'] as Position;
      } else if (eventD!['offsetT']!= null) {
        this.offsetT = eventD!['offsetT'] as Position;
      } else if (eventD!['opacityValue']!= null) {
        console.info('opacityValueopacityValue',eventD!['directionT'])
        this.opacityValue = eventD!['opacityValue'] as double;
        console.info('opacityValueopacityValue', this.opacityValue)
      }
    }
  }
}