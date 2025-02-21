/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
struct FocusControlExample {
  @State inputValue: string = ''
  @State touchOnFocusName: string = 'OnTouchGrpBtn'
  @State touchOnFocusName1: string = 'OnTouchBtn1'
  @State touchOnFocusName2: string = 'OnTouchBtn2'
  @State touchOnFocusName3: string = 'OnTouchBtn3'
  @State touchOnFocusName4: string = 'OnTouchBtn4'

  build() {
    Scroll() {
      Row({ space: 20 }) {
        Column({ space: 20 }) {
          Column({ space: 5 }) {
            Button(this.touchOnFocusName)
              .width(165)
              .height(40)
              .key('OnTouchGrpBtn')
              .fontColor(Color.White)
              .focusable(true)
              .onFocus(() => {
                try {
                  this.touchOnFocusName = 'Focus' + this.touchOnFocusName
                  console.info("onFocus value changed " + this.touchOnFocusName)
                  var eventData = {
                    data: {
                      "value": this.touchOnFocusName,
                    }
                  }
                  var event = {
                    eventId: 60232,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("OnTouchGrpBtn start to emit action state")
                  events_emitter.emit(event, eventData)
                } catch (err) {
                  console.info("OnTouchGrpBtn emit action state err: " + JSON.stringify(err.message))
                }
              })
              .focusOnTouch(true)           //该Button组件点击后可获焦
            Row({ space: 5 }) {
              Button(this.touchOnFocusName1)
                .width(80)
                .height(40)
                .key('OnTouchBtn1')
                .fontColor(Color.White)
                .focusable(true)
                .onFocus(() => {
                  try {
                    this.touchOnFocusName1 = 'Focus' + this.touchOnFocusName1
                    console.info("onFocus value changed " + this.touchOnFocusName1)
                    var eventData = {
                      data: {
                        "value": this.touchOnFocusName1,
                      }
                    }
                    var event = {
                      eventId: 60233,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("OnTouchBtn1 start to emit action state")
                    events_emitter.emit(event, eventData)
                  } catch (err) {
                    console.info("OnTouchBtn1 emit action state err: " + JSON.stringify(err.message))
                  }
                })
                .focusOnTouch(true)
              Button(this.touchOnFocusName2)
                .width(80)
                .height(40)
                .key('OnTouchBtn2')
                .fontColor(Color.White)
                .focusable(true)
                .onFocus(() => {
                  try {
                    this.touchOnFocusName2 = 'Focus' + this.touchOnFocusName2
                    console.info("onFocus value changed " + this.touchOnFocusName2)
                    var eventData = {
                      data: {
                        "value": this.touchOnFocusName2,
                      }
                    }
                    var event = {
                      eventId: 60234,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("OnTouchBtn2 start to emit action state")
                    events_emitter.emit(event, eventData)
                  } catch (err) {
                    console.info("OnTouchBtn2 emit action state err: " + JSON.stringify(err.message))
                  }
                })
                .focusOnTouch(true)           //该Button组件点击后可获焦
            }
            Row({ space: 5 }) {
              Button(this.touchOnFocusName3)
                .width(80)
                .height(40)
                .key('OnTouchBtn3')
                .fontColor(Color.White)
                .focusable(true)
                .onFocus(() => {
                  this.touchOnFocusName3 = 'Focus' + this.touchOnFocusName3
                  console.info("onFocus value changed " + this.touchOnFocusName3)
                })
                .onClick(() => {
                  try {
                    var eventData = {
                      data: {
                        "value": this.touchOnFocusName3,
                      }
                    }
                    var event = {
                      eventId: 60235,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("OnTouchBtn3 start to emit action state")
                    events_emitter.emit(event, eventData)
                  } catch (err) {
                    console.info("OnTouchBtn3 emit action state err: " + JSON.stringify(err.message))
                  }
                })

              Button(this.touchOnFocusName4)
                .width(80)
                .height(40)
                .key('OnTouchBtn4')
                .fontColor(Color.White)
                .focusable(true)
                .onFocus(() => {
                  this.touchOnFocusName4 = 'Focus' + this.touchOnFocusName4
                  console.info("onFocus value changed " + this.touchOnFocusName4)
                })
                .onClick(() => {
                  try {
                    console.info("onClick event " + this.touchOnFocusName4)
                    var eventData = {
                      data: {
                        "value": this.touchOnFocusName4,
                      }
                    }
                    var event = {
                      eventId: 60236,
                      priority: events_emitter.EventPriority.LOW
                    }
                    console.info("OnTouchBtn4 start to emit action state")
                    events_emitter.emit(event, eventData)
                  } catch (err) {
                    console.info("OnTouchBtn4 emit action state err: " + JSON.stringify(err.message))
                  }
              })
            }
          }.borderWidth(2).borderColor(Color.Red).borderStyle(BorderStyle.Dashed)
          .tabIndex(1)                      //该Column组件为按TAB键走焦的第一个获焦的组件
          Column({ space: 5 }) {
            Button('Group2')
              .width(165)
              .height(40)
              .fontColor(Color.White)
            Row({ space: 5 }) {
              Button()
                .width(80)
                .height(40)
                .fontColor(Color.White)
              Button()
                .width(80)
                .height(40)
                .fontColor(Color.White)
                .groupDefaultFocus(true)      //该Button组件上级Column组件获焦时获焦
            }
            Row({ space: 5 }) {
              Button()
                .width(80)
                .height(40)
                .fontColor(Color.White)
              Button()
                .width(80)
                .height(40)
                .fontColor(Color.White)
            }
          }.borderWidth(2).borderColor(Color.Green).borderStyle(BorderStyle.Dashed)
          .tabIndex(2)                      //该Column组件为按TAB键走焦的第二个获焦的组件
        }
        Column({ space: 5 }) {
          TextInput({placeholder: 'input', text: this.inputValue})
            .onChange((value: string) => {
              this.inputValue = value
            })
            .fontColor(Color.Blue)
            .focusable(true)
            .key('defaultFocusText')
            .onFocus(() => {
              try {
                this.inputValue = 'defaultFocus'
                console.info("onFocus value changed " + this.inputValue)
                var eventData = {
                  data: {
                    "value": this.inputValue,
                  }
                }
                var event = {
                  eventId: 60237,
                  priority: events_emitter.EventPriority.LOW
                }
                console.info("defaultFocus test start to emit action start")
                events_emitter.emit(event, eventData)
              } catch (err) {
                console.info("defaultFocus test emit action state err: " + JSON.stringify(err.message))
              }
            })
            .defaultFocus(true)             //该TextInput组件为页面的初始默认焦点
          Button('Group3')
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 }) {
            Button()
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button()
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
          Button()
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 }) {
            Button()
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button()
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
          Button()
            .width(165)
            .height(40)
            .fontColor(Color.White)
          Row({ space: 5 }) {
            Button()
              .width(80)
              .height(40)
              .fontColor(Color.White)
            Button()
              .width(80)
              .height(40)
              .fontColor(Color.White)
          }
        }.borderWidth(2).borderColor(Color.Orange).borderStyle(BorderStyle.Dashed)
        .tabIndex(3)                      //该Column组件为按TAB键走焦的第三个获焦的组件
      }.alignItems(VerticalAlign.Top)
    }
  }
}