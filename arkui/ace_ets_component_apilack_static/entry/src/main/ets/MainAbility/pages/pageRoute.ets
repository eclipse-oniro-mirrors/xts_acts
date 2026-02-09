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

import {
  $rawfile,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  Image,
  ImageFit,
  ItemAlign,
  Margin,
  Slider,
  SliderStyle,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PageRouteExample {
  @State private angle: number = 1;
  @State private imageSize: number = 2;
  @State private speed: number = 5;
  @State private interval: number = 0;
  @State private state: string = '';

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Image($rawfile('test.png'))
        .width(100)
        .height(100)
        .objectFit(ImageFit.Contain)
        .margin({ top: 50, bottom: 150, right: 10 } as Margin)
        .rotate({
          x: 0,
          y: 0,
          z: 2,
          angle: this.angle
        })// 组件以(1,1,1)为旋转轴，中心点顺时针旋转 300度
        .scale({ x: this.imageSize, y: this.imageSize })
      Text('speed ' + this.speed)
        .fontSize(20).fontWeight(FontWeight.Bold)
      Slider({
        value: this.speed,
        min: 1,
        max: 50,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor(Color.Orange)
        .onChange((value: number) => {
          this.speed = value
        })
      Button('Next', { type: ButtonType.Capsule, stateEffect: true })
        .backgroundColor(0x317aff)
        .width(90)
        .key('next')
        .onClick((e: ClickEvent) => {
          console.info('to next page')
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/index'
          })
        })
    }
    .width('100%')
    .height('100%')
  }

  speedChange() {
    let that = this
    this.interval = setInterval(() => {
      that.angle += that.speed
    }, 15)
  }

  onPageHide() {
    console.info('current page will be hidden, value changed')
    this.state = 'onPageHide'
    try {
      let eventData: events_emitter.EventData = {
        data: {
          "value": this.state,
        } as Record<String,RecordData>
      }
      let eventt: events_emitter.InnerEvent = {
        eventId: 10,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("page start to emit action state")
      events_emitter.emit(eventt, eventData)
    } catch (err: Error) {
      console.info("page emit action state err: " + JSON.stringify((err as Error)?.message))
    }
  }

  onPageShow() {
    this.speedChange()
  }
}