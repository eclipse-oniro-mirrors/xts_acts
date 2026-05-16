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
  ButtonType,
  PasteButton,
  PasteIconStyle,
  PasteDescription,
  Row,
  PasteButtonOnClickResult,
  PasteButtonCallback,
  Image,
  $r,
  TextInput,
  SecurityComponentLayoutDirection,
  FontStyle,
  FontWeight,
  BorderStyle,
  Alignment,
  HorizontalAlign,
  ColorMetrics,
  LengthMetrics,
  Color,
  Visibility,
  Button
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct pasteButtonSetUndefined {
  @State isShow: int = 0

  onPageShow() {
    console.info('====>page_pasteButton page show called');
  }

  onPageHide() {
    console.info('====>page_pasteButton page hide called');
  }

  build() {
    Row() {
      Column() {
        Row() {
          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .iconSize(undefined)
              .key('setUndefined0')
          }
          .visibility(this.isShow === 0 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .position(undefined)
              .key('setUndefined1')
          }
          .visibility(this.isShow === 1 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .markAnchor(undefined)
              .key('setUndefined2')
          }
          .visibility(this.isShow === 2 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .offset(undefined)
              .key('setUndefined3')
          }
          .visibility(this.isShow === 3 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontSize(undefined)
              .key('setUndefined4')
          }
          .visibility(this.isShow === 4 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontStyle(undefined)
              .key('setUndefined5')
          }
          .visibility(this.isShow === 5 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontWeight(undefined)
              .key('setUndefined6')
          }
          .visibility(this.isShow === 6 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontFamily(undefined)
              .key('setUndefined7')
          }
          .visibility(this.isShow === 7 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined8-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontColor(undefined)
              .key('setUndefined8-2')
          }
          .visibility(this.isShow === 8 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined9-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .iconColor(undefined)
              .key('setUndefined9-2')
          }
          .visibility(this.isShow === 9 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined10-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .backgroundColor(undefined)
              .key('setUndefined10-2')
          }
          .visibility(this.isShow === 10 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderStyle(undefined)
              .key('setUndefined11')
          }
          .visibility(this.isShow === 11 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderWidth(undefined)
              .key('setUndefined12')
          }
          .visibility(this.isShow === 12 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderColor(undefined)
              .key('setUndefined13')
          }
          .visibility(this.isShow === 13 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderRadius(undefined)
              .key('setUndefined14')
          }
          .visibility(this.isShow === 14 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderRadius({
                topLeft: undefined,
                topRight: undefined,
                bottomLeft: undefined,
                bottomRight: undefined,
              })
              .key('setUndefined15')
          }
          .visibility(this.isShow === 15 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .padding(undefined)
              .key('setUndefined16')
          }
          .visibility(this.isShow === 16 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .textIconSpace(undefined)
              .key('setUndefined17')
          }
          .visibility(this.isShow === 17 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined18-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .width(undefined)
              .key('setUndefined18-2')
          }
          .visibility(this.isShow === 18 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined19-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .height(undefined)
              .key('setUndefined19-2')
          }
          .visibility(this.isShow === 19 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined20-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .size(undefined)
              .key('setUndefined20-2')
          }
          .visibility(this.isShow === 20 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined21-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .constraintSize(undefined)
              .key('setUndefined21-2')
          }
          .visibility(this.isShow === 21 ? Visibility.Visible : Visibility.None)

          Column() {
              PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .align(undefined)
              .key('setUndefined22')
          }
          .visibility(this.isShow === 22 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .alignRules(undefined)
              .key('setUndefined23')
          }
          .visibility(this.isShow === 23 ? Visibility.Visible : Visibility.None)

          Column() {
              PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .id(undefined)
              .key('setUndefined24')
          }
          .visibility(this.isShow === 24 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .chainMode(undefined, undefined)
              .key('setUndefined25')
          }
          .visibility(this.isShow === 25 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined26-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .minFontScale(undefined)
              .key('setUndefined26-2')
          }
          .visibility(this.isShow === 26 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined27-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxFontScale(undefined)
              .key('setUndefined27-2')
          }
          .visibility(this.isShow === 27 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined28-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .minFontSize(undefined)
              .key('setUndefined28-2')
          }
          .visibility(this.isShow === 28 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setUndefined29-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxFontSize(undefined)
              .key('setUndefined29-2')
          }
          .visibility(this.isShow === 29 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxLines(undefined)
              .key('setUndefined30')
          }
          .visibility(this.isShow === 30 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .heightAdaptivePolicy(undefined)
              .key('setUndefined31')
          }
          .visibility(this.isShow === 31 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .focusBox(undefined)
              .key('setUndefined32')
          }
          .visibility(this.isShow === 32 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxFontSize('')
              .key('setNullStr01')
          }
          .visibility(this.isShow === 33 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
                try {
                  let clickData:events_emitter.EventData = {
                    data: {
                      'clickResult': result,
                    }
                  }
                  let clickEvent:events_emitter.InnerEvent = {
                    eventId: 2,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .minFontSize('')
              .key('setNullStr02')
          }
          .visibility(this.isShow === 34 ? Visibility.Visible : Visibility.None)

          Button('点击切换安全控件')
            .width('50%')
            .height(30)
            .offset({x:-100, y:60})
            .onClick(() => {
              this.isShow++
            })
            .id('switchButton')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}