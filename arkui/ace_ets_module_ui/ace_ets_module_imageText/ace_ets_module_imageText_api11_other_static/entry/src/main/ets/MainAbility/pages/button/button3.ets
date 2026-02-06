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
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ButtonType
} from '@ohos.arkui.component';
import { State, AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Button3Example {
  @StoragePropRef('buttonTypeValue') buttonTypeValue: ButtonType | undefined = ButtonType.Normal;
  @StoragePropRef('fontSizeValue') fontSizeValue: string | number = '20px';
  @StoragePropRef('fontColorValue') fontColorValue: Color | string | int = Color.Black;
  @StoragePropRef('text') text: string = '';
  @StoragePropRef('onClickValue') onClickValue: boolean = false;

  onPageShow() {
    console.info('Button page show called');
  }

  build() {
    Column() {
      Column() {
        Row() {
          Button('Ok', { type: this.buttonTypeValue, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width('20%')
            .key('button')
            .height('10%')
          Button('ok')
            .type(this.buttonTypeValue)
            .key('button1')
            .backgroundColor(0x317aff)
            .width('20%')
            .height('10%')
        }

        Row() {
          Button('ok')
            .type(this.buttonTypeValue)
            .key('button2')
            .fontSize(this.fontSizeValue)
            .backgroundColor(0x317aff)
            .width('20%')
            .fontColor(this.fontColorValue)
            .onClick((e: ClickEvent) => {
              try {
                let backData: events_emitter.EventData = {
                  data: {
                    "fontColorValue": this.fontColorValue,
                  } as Record<String,RecordData>
                }
                let backEvent: events_emitter.InnerEvent = {
                  eventId: 71,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("button2 start to emit action state")
                events_emitter.emit(backEvent, backData)
              } catch (err) {
                console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })
            .height('10%')
          Button('ok!')
            .type(this.buttonTypeValue)
            .key('button3')
            .fontColor(this.fontColorValue)
            .backgroundColor(0x317aff)
            .width('20%')
            .onClick((e: ClickEvent) => {
              try {
                let backData: events_emitter.EventData = {
                  data: {
                    "fontColorValue": this.fontColorValue,
                  } as Record<String,RecordData>
                }
                let backEvent: events_emitter.InnerEvent = {
                  eventId: 72,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("button3 start to emit action state")
                events_emitter.emit(backEvent, backData)
              } catch (err) {
                console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
              }
            })
            .height('10%')
        }

        Button('button4')
          .key('button4')
          .backgroundColor(0x317aff)
          .width(90)
          .fontColor(this.fontColorValue)
          .onClick((e: ClickEvent) => {
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "fontColorValue": this.fontColorValue,
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 77996,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button4 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("button4 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
          .height('10%')

        Button('Click')
          .backgroundColor(0x2788D9)
          .width(200)
          .fontSize(20)
          .onClick((event: ClickEvent) => {
            console.info(this.text = 'Click Point:' + '\n  screenX:' + event.windowX + '\n  screenY:' + event.windowY
              + '\n  x :' + event.x + '\n  y:' + event.y + '\ntarget:' + '\n  component globalPosition：（'
              + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y + '）\n  width:'
              + event.target.area.width + '\n  height：' + event.target.area.height);
            this.onClickValue = true;
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onClickValue,
                  "event": JSON.stringify(event)
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 4,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("click to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("click action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
          .key('buttonClick')
          .id('buttonClick')
          .height(100)
      }.height('100%').padding({ left: 35, right: 35, top: 35 } as Padding)
    }.height('100%')
  }
}