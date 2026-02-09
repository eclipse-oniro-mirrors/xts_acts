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
import { Callback, Message, MessageManager } from '../../common/MessageManager';
import { AnimatorOptions, AnimatorResult } from '@ohos.animator';
import {
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  ExpectedFrameRateRange,
  FlexAlign,
  ForEach,
  List,
  ListItem,
  Margin,
  PlayMode,
  Resource,
  Row,
  Scroll,
  Text
} from '@ohos.arkui.component';
import { AppStorage, Link, State, StorageLink, Watch } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';
import { RecordData } from '@ohos.base';

interface ParamName {
  name: string,
  message: MessageManager<Int>
}

@Entry
@Component
struct Animation3Example {
  @State show: string = "btShow";
  @State btn1: boolean = false;
  @State duration: Int = 100;
  @State curve: string = 'Ease';
  @State iteration: Int = 1;
  @State tempo: Double = 1000;
  @State playmode: PlayMode | Int = PlayMode.Normal;
  messageManager: MessageManager<Int> = new MessageManager<Int>()
  messageManagerString: MessageManager<String> = new MessageManager<String>()
  messageManagerLong: MessageManager<Double> = new MessageManager<Double>()
  messageManagerPlayMode: MessageManager<PlayMode | Int> = new MessageManager<PlayMode | Int>()

  onPageShow() {

    AppStorage.setOrCreate<MessageManager<Int>>('MessageManager', this.messageManager);
    AppStorage.setOrCreate<MessageManager<Int>>('MessageManagerPlayModeInt', this.messageManager);
    AppStorage.setOrCreate<MessageManager<String>>('MessageManagerString', this.messageManagerString);
    AppStorage.setOrCreate<MessageManager<Double>>('MessageManagerLong', this.messageManagerLong);
    AppStorage.setOrCreate<MessageManager<PlayMode | Int>>('MessageManagerPlayMode', this.messageManagerPlayMode);
    let callback: Callback<Int> = (message: Message<Int>) => {
      if (message.name == 'duration') {
        this.duration = message.value as int
      }
      if (message.name == 'iteration') {
        this.iteration = message.value as Int
      }
      if (message.name == 'playmode') {
        this.playmode = message.value as Int
      }
    }
    let callbackString: Callback<String> = (message: Message<String>) => {
      if (message.name == 'curve') {
        this.curve = message.value as String
      }
    }
    let callbackLong: Callback<Double> = (message: Message<Double>) => {
      if (message.name == 'tempo') {
        this.tempo = message.value as Double
      }
    }
    let callbackPlayMode: Callback<PlayMode | Int> = (message: Message<PlayMode | Int>) => {
      if (message.name == 'playmode') {
        this.playmode = message.value as PlayMode
      }
    }
    this.messageManagerPlayMode.registerCallback(callbackPlayMode)
    this.messageManagerLong.registerCallback(callbackLong)
    this.messageManagerString.registerCallback(callbackString)
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Button(this.show)
        .backgroundColor('0x317aff')
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button1')
        .onClick((e: ClickEvent) => {
          try {
            let dataP: Record<String,RecordData> = {
              "duration": this.duration,
            }
            let backData: emitter.EventData = {
              data: dataP
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 51,
              priority: emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1 animateTo START")
          console.info("button1 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button1 duration test animateTo START")
          })
        })
      Button(this.show)
        .backgroundColor('0x317aff')
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button11')
        .onClick((e: ClickEvent) => {
          let dataP1: Record<String,RecordData> = {
            "duration": this.duration,
          }
          try {
            let backData: emitter.EventData = {
              data: dataP1
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 151,
              priority: emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1 animateTo START")
          console.info("button1 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button1 duration test animateTo START")
          })
        })
      Button(this.show)
        .backgroundColor('0x317aff')
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button12')
        .onClick((e: ClickEvent) => {
          try {
            let dataP2: Record<String,RecordData> = {
              "curve": this.curve,
            }
            let backData: emitter.EventData = {
              data: dataP2
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 152,
              priority: emitter.EventPriority.LOW
            }
            console.info("button1 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1 animateTo START")
          console.info("button1 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button1 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button2')
        .onClick((e: ClickEvent) => {
          try {
            let dataP3: Record<String,RecordData> = {
              "curve": this.curve,
            }
            let backDataOne: emitter.EventData = {
              data: dataP3
            }
            let backEventOne: emitter.InnerEvent = {
              eventId: 52,
              priority: emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            emitter.emit(backEventOne, backDataOne)
          } catch (err) {
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button2 animateTo START")
          console.info("button2 curve value is : " + this.curve)
          this.getUIContext().animateTo({ curve: this.curve }, () => {
            console.info("button2 curve test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button3')
        .onClick((e: ClickEvent) => {
          try {
            let dataP4: Record<String,RecordData> = {
              "iterations": this.iteration,
            }
            let backDataTwo: emitter.EventData = {
              data: dataP4
            }
            let backEventTwo: emitter.InnerEvent = {
              eventId: 53,
              priority: emitter.EventPriority.LOW
            }
            console.info("button3 start to emit action state")
            emitter.emit(backEventTwo, backDataTwo)
          } catch (err) {
            console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button3 animateTo START")
          console.info("button3 iteration value is : " + this.iteration)
          this.getUIContext().animateTo({ iterations: this.iteration }, () => {
            console.info("button3 iterations test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button13')
        .onClick((e: ClickEvent) => {
          try {
            let dataP5: Record<String,RecordData> = {
              "iterations": this.iteration,
            }
            let backDataTwo: emitter.EventData = {
              data: dataP5
            }
            let backEventTwo: emitter.InnerEvent = {
              eventId: 153,
              priority: emitter.EventPriority.LOW
            }
            console.info("button3 start to emit action state")
            emitter.emit(backEventTwo, backDataTwo)
          } catch (err) {
            console.info("button3 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button3 animateTo START")
          console.info("button3 iteration value is : " + this.iteration)
          this.getUIContext().animateTo({ iterations: this.iteration }, () => {
            console.info("button3 iterations test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button4')
        .onClick((e: ClickEvent) => {
          try {
            let dataP6: Record<String,RecordData> = {
              "tempo": this.tempo
            }
            let backDataThree: emitter.EventData = {
              data: dataP6
            }
            let backEventThree: emitter.InnerEvent = {
              eventId: 54,
              priority: emitter.EventPriority.LOW
            }
            console.info("button4 start to emit action state")
            emitter.emit(backEventThree, backDataThree)
          } catch (err) {
            console.info("button4 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button4 animateTo START")
          console.info("button4 tempo value is : " + this.duration)
          this.getUIContext().animateTo({ tempo: this.tempo }, () => {
            console.info("button4 tempo test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button14')
        .onClick((e: ClickEvent) => {
          try {
            let dataP7: Record<String,RecordData> = {
              "tempo": this.tempo
            }
            let backDataThree: emitter.EventData = {
              data: dataP7
            }
            let backEventThree: emitter.InnerEvent = {
              eventId: 154,
              priority: emitter.EventPriority.LOW
            }
            console.info("button4 start to emit action state")
            emitter.emit(backEventThree, backDataThree)
          } catch (err) {
            console.info("button4 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button4 animateTo START")
          console.info("button4 tempo value is : " + this.duration)
          this.getUIContext().animateTo({ tempo: this.tempo }, () => {
            console.info("button4 tempo test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button5')
        .onClick((e: ClickEvent) => {
          try {
            let dataP8: Record<String,RecordData> = {
              "playmode": this.playmode,
            }
            let backDataFour: emitter.EventData = {
              data: dataP8
            }
            let backEventFour: emitter.InnerEvent = {
              eventId: 55,
              priority: emitter.EventPriority.LOW
            }
            console.info("button5 start to emit action state")
            emitter.emit(backEventFour, backDataFour)
          } catch (err) {
            console.info("button5 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button5 animateTo START")
          console.info("button5 playmode value is : " + this.playmode)
          this.getUIContext().animateTo({ playMode: PlayMode.Normal }, () => {
            console.info("button5 playMode test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button15')
        .onClick((e: ClickEvent) => {
          try {
            let dataP9: Record<String,RecordData> = {
              "playmode": this.playmode,
            }
            let backDataFour: emitter.EventData = {
              data: dataP9
            }
            let backEventFour: emitter.InnerEvent = {
              eventId: 155,
              priority: emitter.EventPriority.LOW
            }
            console.info("button5 start to emit action state")
            emitter.emit(backEventFour, backDataFour)
          } catch (err) {
            console.info("button5 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button5 animateTo START")
          console.info("button5 playmode value is : " + this.playmode)
          this.getUIContext().animateTo({ playMode: PlayMode.Normal }, () => {
            console.info("button5 playMode test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button6')
        .onClick((e: ClickEvent) => {
          try {
            let dataP10: Record<String,RecordData> = {
              "duration": this.duration,
            }
            let backData: emitter.EventData = {
              data: dataP10
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1001,
              priority: emitter.EventPriority.LOW
            }
            console.info("button6 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button6 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button6 animateTo START")
          console.info("button6 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button6 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button7')
        .onClick((e: ClickEvent) => {
          try {
            let dataP11: Record<String,RecordData> = {
              "duration": this.duration,
            }
            let backData: emitter.EventData = {
              data: dataP11
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1002,
              priority: emitter.EventPriority.LOW
            }
            console.info("button7 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button7 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button7 animateTo START")
          console.info("button7 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button7 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button8')
        .onClick((e: ClickEvent) => {
          try {
            let dataP12: Record<String,RecordData> = {
              "curve": this.curve,
            }
            let backData: emitter.EventData = {
              data: dataP12
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1003,
              priority: emitter.EventPriority.LOW
            }
            console.info("button8 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button8 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button8 animateTo START")
          console.info("button8 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button8 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button9')
        .onClick((e: ClickEvent) => {
          try {
            let dataP13: Record<String,RecordData> = {
              "curve": this.curve,
            }
            let backData: emitter.EventData = {
              data: dataP13
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1004,
              priority: emitter.EventPriority.LOW
            }
            console.info("button9 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button9 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button9 animateTo START")
          console.info("button9 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button9 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button10')
        .onClick((e: ClickEvent) => {
          try {
            let dataP14: Record<String,RecordData> = {
              "iteration": this.iteration,
            }
            let backData: emitter.EventData = {
              data: dataP14
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1005,
              priority: emitter.EventPriority.LOW
            }
            console.info("button10 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button10 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button10 animateTo START")
          console.info("button10 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button10 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button111')
        .onClick((e: ClickEvent) => {
          try {
            let dataP15: Record<String,RecordData> = {
              "iteration": this.iteration,
            }
            let backData: emitter.EventData = {
              data: dataP15
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1006,
              priority: emitter.EventPriority.LOW
            }
            console.info("button11 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button11 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button11 animateTo START")
          console.info("button11 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button11 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button121')
        .onClick((e: ClickEvent) => {
          try {
            let dataP16: Record<String,RecordData> = {
              "tempo": this.tempo,
            }
            let backData: emitter.EventData = {
              data: dataP16
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1007,
              priority: emitter.EventPriority.LOW
            }
            console.info("button12 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button12 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button12 animateTo START")
          console.info("button12 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button12 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button131')
        .onClick((e: ClickEvent) => {
          try {
            let dataP17: Record<String,RecordData> = {
              "tempo": this.tempo,
            }
            let backData: emitter.EventData = {
              data: dataP17
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1008,
              priority: emitter.EventPriority.LOW
            }
            console.info("button13 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button13 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button13 animateTo START")
          console.info("button13 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button13 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button141')
        .onClick((e: ClickEvent) => {
          try {
            let dataP18: Record<String,RecordData> = {
              "playmode": this.playmode,
            }
            let backData: emitter.EventData = {
              data: dataP18
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1009,
              priority: emitter.EventPriority.LOW
            }
            console.info("button14 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button14 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button14 animateTo START")
          console.info("button14 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button14 duration test animateTo START")
          })
        })
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button151')
        .onClick((e: ClickEvent) => {
          try {
            let dataP19: Record<String,RecordData> = {
              "playmode": this.playmode,
            }
            let backData: emitter.EventData = {
              data: dataP19
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1010,
              priority: emitter.EventPriority.LOW
            }
            console.info("button15 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button15 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button15 animateTo START")
          console.info("button15 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button15 duration test animateTo START")
          })
        })
    }.height("%100").width("100%")
  }
}