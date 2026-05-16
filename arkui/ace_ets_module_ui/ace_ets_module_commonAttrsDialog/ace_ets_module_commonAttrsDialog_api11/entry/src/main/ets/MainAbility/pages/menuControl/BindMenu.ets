/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct BindMenu {
  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Menu1')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Text('Menu2')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
    }.width(100)
  }

  build() {
    Column() {
      Row() {
        Text('placeholder')
          .width("40%")
          .height('100%')
          .id('BindMenu_placeholder')
        Text('click for Menu')
          .width("60%")
          .height('100%')
          .borderWidth(1)
          .borderColor(Color.Green)
          .textAlign(TextAlign.Center)
          .bindMenu([
            {
              value: 'Menu1',
              action: () => {
              }
            },
            {
              value: 'Menu2',
              action: () => {
              }
            },
          ], {
            title: "Title",
            offset: { x: -5, y: 5 },
            placement: Placement.Right,
            onAppear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onAppear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50000,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
            },
            onDisappear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onDisappear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50001,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
            }
          })
          .key('BindMenu_bindMenu1')
      }
      .width("90%")
      .height(50)
      .margin(10)

      Row() {
        Text('placeholder')
          .width("40%")
          .height('100%')
        Text('LongPress for contextMenu')
          .width("60%")
          .height('100%')
          .borderWidth(1)
          .borderColor(Color.Green)
          .textAlign(TextAlign.Center)
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, {
            offset: { x: 5, y: 5 },
            placement: Placement.Right,
            onAppear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onAppear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 60002,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
            },
            onDisappear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onDisappear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 60003,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
            }
          })
          .key('BindMenu_bindContextMenu1')
      }
      .width("90%")
      .height(50)
      .margin(10)
    }
    .width('100%')
  }
}