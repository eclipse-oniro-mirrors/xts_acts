/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  Column,
  Component,
  ClickEvent,
  SaveButton,
  SaveIconStyle,
  SaveDescription,
  Row,
  SaveButtonOnClickResult,
  HorizontalAlign,
  Visibility,
  Button
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct saveDescription {
  @State isShow: int = 0

  build() {
    Row(){
      Column(){
        Row() {
          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.DOWNLOAD_FILE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription1')
          }
          .visibility(this.isShow === 0 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription2')
          }
          .visibility(this.isShow === 1 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_IMAGE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription3')
          }
          .visibility(this.isShow === 2 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_FILE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription4')
          }
          .visibility(this.isShow === 3 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD_AND_SHARE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription5')
          }
          .visibility(this.isShow === 4 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.RECEIVE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription6')
          }
          .visibility(this.isShow === 5 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.CONTINUE_TO_RECEIVE})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription7')
          }
          .visibility(this.isShow === 6 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.SAVE_TO_GALLERY})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription8')
          }
          .visibility(this.isShow === 7 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.EXPORT_TO_GALLERY})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription9')
          }
          .visibility(this.isShow === 8 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.QUICK_SAVE_TO_GALLERY})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription10')
          }
          .visibility(this.isShow === 9 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.RESAVE_TO_GALLERY})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription11')
          }
          .visibility(this.isShow === 10 ? Visibility.Visible : Visibility.None)

          Column() {
            SaveButton({ icon: SaveIconStyle.LINES, text: SaveDescription.SAVE_ALL})
              .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    } as Record<string, RecordData>
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_saveDescription onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_saveDescription emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .key('keyDescription12')
          }
          .visibility(this.isShow === 11 ? Visibility.Visible : Visibility.None)

          Button('点击切换安全控件')
            .width('50%')
            .height(40)
            .offset({x:-100, y:50})
            .onClick(() => {
              this.isShow++
            })
            .id('switchButton')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}
