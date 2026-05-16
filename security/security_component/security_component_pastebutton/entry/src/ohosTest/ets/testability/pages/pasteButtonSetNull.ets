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

import events_emitter from '@ohos.events.emitter';
import { ColorMetrics, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct pasteButtonSetNull {
  @State isShow: number = 0

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
              .iconSize(null)
              .key('setNull0')
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
              .position(null)
              .key('setNull1')
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
              .markAnchor(null)
              .key('setNull2')
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
              .offset(null)
              .key('setNull3')
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
              .fontSize(null)
              .key('setNull4')
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
              .fontStyle(null)
              .key('setNull5')
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
              .fontWeight(null)
              .key('setNull6')
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
              .fontFamily(null)
              .key('setNull7')
          }
          .visibility(this.isShow === 7 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull8-1')

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
              .fontColor(null)
              .key('setNull8-2')
          }
          .visibility(this.isShow === 8 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull9-1')

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
              .iconColor(null)
              .key('setNull9-2')
          }
          .visibility(this.isShow === 9 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull10-1')

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
              .backgroundColor(null)
              .key('setNull10-2')
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
              .borderStyle(null)
              .key('setNull11')
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
              .borderWidth(null)
              .key('setNull12')
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
              .borderColor(null)
              .key('setNull13')
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
              .borderRadius(null)
              .key('setNull14')
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
                topLeft: null,
                topRight: null,
                bottomLeft: null,
                bottomRight: null,
              })
              .key('setNull15')
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
              .padding(null)
              .key('setNull16')
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
              .textIconSpace(null)
              .key('setNull17')
          }
          .visibility(this.isShow === 17 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull18-1')

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
              .width(null)
              .key('setNull18-2')
          }
          .visibility(this.isShow === 18 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull19-1')

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
              .height(null)
              .key('setNull19-2')
          }
          .visibility(this.isShow === 19 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull20-1')

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
              .size(null)
              .key('setNull20-2')
          }
          .visibility(this.isShow === 20 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull21-1')

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
              .constraintSize(null)
              .key('setNull21-2')
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
              .align(null)
              .key('setNull22')
          }
          .visibility(this.isShow === 22 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull23-1')

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
              .alignRules(null)
              .key('setNull23-2')
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
              .id(null)
              .key('setNull24')
          }
          .visibility(this.isShow === 24 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull25-1')

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
              .chainMode(null, null)
              .key('setNull25-2')
          }
          .visibility(this.isShow === 25 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull26-1')

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
              .minFontScale(null)
              .key('setNull26-2')
          }
          .visibility(this.isShow === 26 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull27-1')

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
              .maxFontScale(null)
              .key('setNull27-2')
          }
          .visibility(this.isShow === 27 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull28-1')

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
              .minFontSize(null)
              .key('setNull28-2')
          }
          .visibility(this.isShow === 28 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull29-1')

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
              .maxFontSize(null)
              .key('setNull29-2')
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
              .maxLines(null)
              .key('setNull30')
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
              .heightAdaptivePolicy(null)
              .key('setNull31')
          }
          .visibility(this.isShow === 31 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNull32-1')

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
              .focusBox(null)
              .key('setNull32-2')
          }
          .visibility(this.isShow === 32 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().key('setNullStr01-1')

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
              .minFontSize('')
              .key('setNullStr01-2')
          }
          .visibility(this.isShow === 33 ? Visibility.Visible : Visibility.None)

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