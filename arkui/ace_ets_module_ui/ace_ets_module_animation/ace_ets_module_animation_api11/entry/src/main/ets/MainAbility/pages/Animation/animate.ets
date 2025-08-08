/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../utils/MessageManager';

@Entry
@Component
struct Animation3Example {
  @State show: string = "btShow";
  @State btn1: boolean = false;
  @State duration: number = 100;
  @State curve: string = 'Ease';
  @State iteration: number = 1;
  @State tempo: number = 1000;
  @State playmode: PlayMode = PlayMode.Normal;
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'duration') {
        this.duration = message.value
      }
      if (message.name == 'curve') {
        this.curve = message.value
      }
      if (message.name == 'iteration') {
        this.iteration = message.value
      }
      if (message.name == 'tempo') {
        this.tempo = message.value
      }
      if (message.name == 'playmode') {
        this.playmode = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Button(this.show)
        .backgroundColor(0x317aff)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button1')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "duration": this.duration,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 51,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1 animateTo START")
          console.info("button1 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button1 duration test animateTo START")
          })
        })
      Button(this.show)
        .backgroundColor(0x317aff)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button11')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "duration": this.duration,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 151,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1 animateTo START")
          console.info("button1 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button1 duration test animateTo START")
          })
        })
      Button(this.show)
        .backgroundColor(0x317aff)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button12')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "curve": this.curve,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 152,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1 animateTo START")
          console.info("button1 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button1 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button2')
        .onClick(() => {
          try {
            let backDataOne: events_emitter.EventData = {
              data: {
                "curve": this.curve,
              }
            }
            let backEventOne: events_emitter.InnerEvent = {
              eventId: 52,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            events_emitter.emit(backEventOne, backDataOne)
          } catch (err) {
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button2 animateTo START")
          console.info("button2 curve value is : " + this.curve)
          animateTo({ curve: this.curve }, () => {
            console.info("button2 curve test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button3')
        .onClick(() => {
          try {
            let backDataTwo: events_emitter.EventData = {
              data: {
                "iterations": this.iteration,
              }
            }
            let backEventTwo: events_emitter.InnerEvent = {
              eventId: 53,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button3 start to emit action state")
            events_emitter.emit(backEventTwo, backDataTwo)
          } catch (err) {
            console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button3 animateTo START")
          console.info("button3 iteration value is : " + this.iteration)
          animateTo({ iterations: this.iteration }, () => {
            console.info("button3 iterations test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button13')
        .onClick(() => {
          try {
            let backDataTwo: events_emitter.EventData = {
              data: {
                "iterations": this.iteration,
              }
            }
            let backEventTwo: events_emitter.InnerEvent = {
              eventId: 153,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button3 start to emit action state")
            events_emitter.emit(backEventTwo, backDataTwo)
          } catch (err) {
            console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button3 animateTo START")
          console.info("button3 iteration value is : " + this.iteration)
          animateTo({ iterations: this.iteration }, () => {
            console.info("button3 iterations test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button4')
        .onClick(() => {
          try {
            let backDataThree: events_emitter.EventData = {
              data: {
                "tempo": this.tempo
              }
            }
            let backEventThree: events_emitter.InnerEvent = {
              eventId: 54,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button4 start to emit action state")
            events_emitter.emit(backEventThree, backDataThree)
          } catch (err) {
            console.info("button4 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button4 animateTo START")
          console.info("button4 tempo value is : " + this.duration)
          animateTo({ tempo: this.tempo }, () => {
            console.info("button4 tempo test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button14')
        .onClick(() => {
          try {
            let backDataThree: events_emitter.EventData = {
              data: {
                "tempo": this.tempo
              }
            }
            let backEventThree: events_emitter.InnerEvent = {
              eventId: 154,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button4 start to emit action state")
            events_emitter.emit(backEventThree, backDataThree)
          } catch (err) {
            console.info("button4 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button4 animateTo START")
          console.info("button4 tempo value is : " + this.duration)
          animateTo({ tempo: this.tempo }, () => {
            console.info("button4 tempo test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button5')
        .onClick(() => {
          try {
            let backDataFour: events_emitter.EventData = {
              data: {
                "playmode": this.playmode,
              }
            }
            let backEventFour: events_emitter.InnerEvent = {
              eventId: 55,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button5 start to emit action state")
            events_emitter.emit(backEventFour, backDataFour)
          } catch (err) {
            console.info("button5 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button5 animateTo START")
          console.info("button5 playmode value is : " + this.playmode)
          animateTo({ playMode: PlayMode.Normal }, () => {
            console.info("button5 playMode test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button15')
        .onClick(() => {
          try {
            let backDataFour: events_emitter.EventData = {
              data: {
                "playmode": this.playmode,
              }
            }
            let backEventFour: events_emitter.InnerEvent = {
              eventId: 155,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button5 start to emit action state")
            events_emitter.emit(backEventFour, backDataFour)
          } catch (err) {
            console.info("button5 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button5 animateTo START")
          console.info("button5 playmode value is : " + this.playmode)
          animateTo({ playMode: PlayMode.Normal }, () => {
            console.info("button5 playMode test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button6')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "duration": this.duration,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1001,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button6 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button6 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button6 animateTo START")
          console.info("button6 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button6 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button7')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "duration": this.duration,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1002,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button7 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button7 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button7 animateTo START")
          console.info("button7 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button7 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button8')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "curve": this.curve,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1003,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button8 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button8 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button8 animateTo START")
          console.info("button8 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button8 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button9')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "curve": this.curve,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1004,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button9 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button9 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button9 animateTo START")
          console.info("button9 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button9 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button10')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "iteration": this.iteration,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1005,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button10 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button10 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button10 animateTo START")
          console.info("button10 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button10 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button111')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "iteration": this.iteration,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1006,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button11 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button11 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button11 animateTo START")
          console.info("button11 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button11 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button121')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "tempo": this.tempo,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1007,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button12 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button12 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button12 animateTo START")
          console.info("button12 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button12 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button131')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "tempo": this.tempo,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1008,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button13 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button13 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button13 animateTo START")
          console.info("button13 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button13 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button141')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "playmode": this.playmode,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1009,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button14 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button14 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button14 animateTo START")
          console.info("button14 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button14 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 20 })
        .key('button151')
        .onClick(() => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "playmode": this.playmode,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1010,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button15 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button15 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button15 animateTo START")
          console.info("button15 duration value is : " + this.duration)
          animateTo({ duration: this.duration }, () => {
            console.info("button15 duration test animateTo START")
          })
        })
    }.height("%100").width("100%")
  }
}