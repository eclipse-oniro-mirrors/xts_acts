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
import emitter from '@ohos.events.emitter';
import {
  Builder,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragEvent,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  ForEach,
  ItemAlign,
  List,
  ListItem,
  Margin,
  Padding,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { jsonx } from 'std/core'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct DragExample {
  @State numbers: string[] = ['one', 'two', 'three', 'four', 'five', 'six'];
  @State text: string = '';
  @State bool: boolean = false;
  @State bool1: boolean = false;
  @State appleVisible: Visibility = Visibility.Visible;
  @State orangeVisible: Visibility = Visibility.Visible;
  @State bananaVisible: Visibility = Visibility.Visible;
  @State mangoVisible: Visibility = Visibility.Visible;
  @State strawberryVisible: Visibility = Visibility.Visible;
  @State select: number = 0;
  @State currentIndex: number = 0;

  @Builder
  pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width('50%')
        .height(60)
        .fontSize(16)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
    }
  }

  build() {
    Column() {
      Text('There are three Text elements here')
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(5)
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Text('apple')
          .width('25%')
          .height(35)
          .fontSize(16)
          .key('apple')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .visibility(this.appleVisible)
          .onDragStart((event: DragEvent, extraParams?: String | undefined): CustomBuilder => {
            this.bool = true
            this.text = 'apple'
            this.appleVisible = Visibility.Hidden
            console.log('apple onDragStart onAction')
            try {
              let backData: emitter.EventData = {
                data: {
                  "ACTION": 'onDragStart onAction'
                } as Record<String,RecordData>
              }
              let backEvent: emitter.InnerEvent = {
                eventId: 86,
                priority: emitter.EventPriority.LOW
              }
              console.info("apple start to emit action state")
              emitter.emit(backEvent, backData)
            } catch (err: Error) {
              console.info("apple emit action state err: " + JSON.stringify((err as Error)?.message))
            }
            return this.pixelMapBuilder
          })
        Text('orange')
          .width('25%')
          .height(35)
          .fontSize(16)
          .key('orange')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .visibility(this.orangeVisible)
          .onDragStart((event: DragEvent, extraParams?: String | undefined): CustomBuilder => {
            this.bool = true
            this.text = 'orange'
            this.orangeVisible = Visibility.Hidden
            return this.pixelMapBuilder
          })
        Text('banana')
          .width('25%')
          .height(35)
          .fontSize(16)
          .key('banana')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .visibility(this.bananaVisible)
          .onDragStart((event: DragEvent, extraParams?: String | undefined): CustomBuilder => {
            console.log('Text onDragStarts, ' + extraParams)
            this.bool = true
            this.text = 'banana'
            this.bananaVisible = Visibility.Hidden
            return this.pixelMapBuilder
          })
        Text('mango')
          .width('25%')
          .height(35)
          .fontSize(16)
          .key('mango')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .visibility(this.mangoVisible)
          .onDragStart((event: DragEvent, extraParams?: String | undefined): CustomBuilder => {
            this.bool = true
            this.text = 'mango'
            this.mangoVisible = Visibility.Hidden
            return this.pixelMapBuilder
          })
        Text('strawberry')
          .width('25%')
          .height(35)
          .fontSize(16)
          .key('strawberry')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .visibility(this.strawberryVisible)
          .onDragStart((event: DragEvent, extraParams?: String | undefined): CustomBuilder => {
            this.bool = true
            this.text = 'strawberry'
            this.strawberryVisible = Visibility.Hidden
            return this.pixelMapBuilder
          })
      }.border({ width: 1 }).width('90%').padding({ top: 10, bottom: 10 } as Padding).margin(10)

      Text('This is a List element')
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(15)
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.numbers, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(80)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Blue)
          }
          .key('listItem')
          .onDragStart((event: DragEvent, extraParams?: String | undefined): CustomBuilder => {
            console.log('ListItem onDragStarts, ' + extraParams)
            this.bool1 = true
            this.text = this.numbers[JSON.parseJsonElement(extraParams!).getInteger("selectedIndex")]
            this.select = JSON.parseJsonElement(extraParams!).getInteger("selectedIndex")
            return this.pixelMapBuilder
          })
        }, (item: string) => item)
      }
      // .editMode(true)
      .height('50%')
      .width('90%')
      .border({ width: 1 })
      .divider({
        strokeWidth: 2,
        color: Color.Blue,
        startMargin: 20,
        endMargin: 20
      })
      .onDragEnter((event: DragEvent, extraParams?: string): void => {
        console.log('List onDragEnter, ' + extraParams + ',' + event.getWindowX() + ',' + event.getWindowY())
        try {
          let backData: emitter.EventData = {
            data: {
              "pointX": event.getWindowX(),
              "pointY": event.getWindowY()
            } as Record<String,RecordData>
          }
          let backEvent: emitter.InnerEvent = {
            eventId: 87,
            priority: emitter.EventPriority.LOW
          }
          console.info("onDragEnter start to emit action state")
          emitter.emit(backEvent, backData)
        } catch (err: Error) {
          console.info("onDragEnter emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })
      .onDragMove((event: DragEvent, extraParams?: string) => {
        console.log('List onDragMove, ' + extraParams)
        try {
          let backData: emitter.EventData = {
            data: {
              "ACTION": "onDragMove onAction"
            } as Record<String,RecordData>
          }
          let backEvent: emitter.InnerEvent = {
            eventId: 88,
            priority: emitter.EventPriority.LOW
          }
          console.info("onDragMove start to emit action state")
          emitter.emit(backEvent, backData)
        } catch (err: Error) {
          console.info("onDragMove emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })
      .onDragLeave((event: DragEvent, extraParams?: string) => {
        console.log('List onDragLeave, ' + extraParams)
        try {
          let backData: emitter.EventData = {
            data: {
              "ACTION": 'onDragLeave onAction'
            } as Record<String,RecordData>
          }
          let backEvent: emitter.InnerEvent = {
            eventId: 89,
            priority: emitter.EventPriority.LOW
          }
          console.info("onDragLeave start to emit action state")
          emitter.emit(backEvent, backData)
        } catch (err: Error) {
          console.info("onDragLeave emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })
      .onDrop((event: DragEvent, extraParams?: string) => {
        console.log('onDrop onAction')
        try {
          let backData: emitter.EventData = {
            data: {
              "ACTION": 'onDrop onAction'
            } as Record<String,RecordData>
          }
          let backEvent: emitter.InnerEvent = {
            eventId: 90,
            priority: emitter.EventPriority.LOW
          }
          console.info("onDrop start to emit action state")
          emitter.emit(backEvent, backData)
        } catch (err: Error) {
          console.info("onDrop emit action state err: " + JSON.stringify((err as Error)?.message))
        }
        if (this.bool) {
          this.numbers.splice(JSON.parseJsonElement(extraParams!).getInteger("insertIndex"), 0, this.text)
          this.bool = false
        } else if (this.bool1) {
          this.numbers.splice(JSON.parseJsonElement(extraParams!).getInteger("selectedIndex"), 1)
          this.numbers.splice(JSON.parseJsonElement(extraParams!).getInteger("insertIndex"), 0, this.text)
          this.bool = false
          this.bool1 = false
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding({ top: 20 } as Padding)
    .margin({ top: 20 } as Margin)
  }
}
