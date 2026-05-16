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
import { Callback, Message, MessageManager } from '../common/MessageManager';
import { AnimatorOptions, AnimatorResult, SimpleAnimatorOptions } from '@ohos.animator';
import {
  Alignment,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Curve,
  Entry,
  ExpectedFrameRateRange,
  FillMode,
  FinishCallbackType,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  ItemAlign,
  List,
  ListItem,
  Margin,
  PlayMode,
  Row,
  Scroll,
  ScrollDirection,
  Text,
  TextAlign,
  TextOverflow,
} from '@ohos.arkui.component'
import { AppStorage, Link, State, StorageLink, Watch } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import curves from '@ohos.curves';
import common from '@ohos.app.ability.common';
import { RecordData } from '@ohos.base';

interface ParamName {
  name: string,
  message: MessageManager<Int>
}

@Entry
@Component
struct animateto {
  @State show: string = "btShow";
  @State btn1: boolean = false;
  @State duration: Int = 100;
  @State curve: string = 'Ease';
  @State iteration: Int = 1;
  @State tempo: Long = 1000;
  @State playmode: PlayMode | Int = PlayMode.Normal;
  @State finishCallbackType: FinishCallbackType | Int = FinishCallbackType.REMOVED;
  messageManager: MessageManager<Int> = new MessageManager<Int>();
  messageManagerString: MessageManager<string> = new MessageManager<string>();
  messageManagerLong: MessageManager<Long> = new MessageManager<Long>();
  messageManagerPlayMode: MessageManager<PlayMode | Int> = new MessageManager<PlayMode | Int>();
  messageManagerFinishCallbackType: MessageManager<FinishCallbackType | Int> =
    new MessageManager<FinishCallbackType | Int>();

  onPageShow() {
    console.log('test start onPageShow')
    AppStorage.setOrCreate<MessageManager<Int>>('messageManager', this.messageManager);
    AppStorage.setOrCreate<MessageManager<Int>>('messageManagerPlayModeInt', this.messageManager);
    AppStorage.setOrCreate<MessageManager<Int>>('messageManagerFinishCallbackTypeInt', this.messageManager);
    AppStorage.setOrCreate<MessageManager<string>>('messageManagerString', this.messageManagerString);
    AppStorage.setOrCreate<MessageManager<Long>>('messageManagerLong', this.messageManagerLong);
    AppStorage.setOrCreate<MessageManager<PlayMode | Int>>('messageManagerPlayMode', this.messageManagerPlayMode);
    AppStorage.setOrCreate<MessageManager<FinishCallbackType | Int>>('messageManagerFinishCallbackType',
      this.messageManagerFinishCallbackType);

    let callback: Callback<Int> = (message: Message<Int>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'duration') {
        this.duration = message.value as Int
      }
      if (message.name == 'iteration') {
        this.iteration = message.value as Int
      }
      if (message.name == 'playmode') {
        this.playmode = message.value as Int
      }
      if (message.name == 'finishCallbackType') {
        this.finishCallbackType = message.value as Int
      }
    }
    let stringCallback: Callback<string> = (message: Message<string>) => {
      if (message.name == 'curve') {
        this.curve = message.value as String
      }
    }
    let longCallback: Callback<Long> = (message: Message<Long>) => {
      if (message.name == 'tempo') {
        this.tempo = message.value as Long
      }
    }
    let PlayModeCallback: Callback<PlayMode | Int> = (message: Message<PlayMode | Int>) => {
      if (message.name == 'playmode') {
        this.playmode = message.value as PlayMode
      }
    }
    let FinishCallbackTypeCallback: Callback<FinishCallbackType | Int> =
      (message: Message<FinishCallbackType | Int>) => {
        if (message.name == 'finishCallbackType') {
          this.finishCallbackType = message.value as FinishCallbackType
        }
      }
    this.messageManagerPlayMode.registerCallback(PlayModeCallback)
    this.messageManagerFinishCallbackType.registerCallback(FinishCallbackTypeCallback)
    this.messageManagerLong.registerCallback(longCallback)
    this.messageManagerString.registerCallback(stringCallback)
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
            let data1: Record<String,RecordData> = {
              "duration": this.duration,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data1 as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 51,
              priority: emitter.EventPriority.LOW
            } as emitter.InnerEvent
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
          try {
            let data2: Record<String,RecordData> = {
              "duration": this.duration,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data2 as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 151,
              priority: emitter.EventPriority.LOW
            } as emitter.InnerEvent
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
            let data3: Record<String,RecordData> = {
              "curve": this.curve,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data3 as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 152,
              priority: emitter.EventPriority.LOW
            } as emitter.InnerEvent
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
            let backDataOne: emitter.EventData = {
              data: {
                "curve": this.curve,
              } as Record<String,RecordData>
            } as emitter.EventData
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
            let data5: Record<String,RecordData> = {
              "iterations": this.iteration,
            } as Record<String,RecordData>
            let backDataTwo: emitter.EventData = {
              data: data5 as Record<String,RecordData>
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
            let data6: Record<String,RecordData> = {
              "iterations": this.iteration,
            } as Record<String,RecordData>
            let backDataTwo: emitter.EventData = {
              data: data6 as Record<String,RecordData>
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
            let data7: Record<String,RecordData> = {
              "tempo": this.tempo
            } as Record<String,RecordData>
            let backDataThree: emitter.EventData = {
              data: data7 as Record<String,RecordData>
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
            let data8: Record<String,RecordData> = {
              "tempo": this.tempo
            } as Record<String,RecordData>
            let backDataThree: emitter.EventData = {
              data: data8 as Record<String,RecordData>
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
            let data9: Record<String,RecordData> = {
              "playmode": this.playmode,
            } as Record<String,RecordData>
            let backDataFour: emitter.EventData = {
              data: data9 as Record<String,RecordData>
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
            let data10: Record<String,RecordData> = {
              "playmode": this.playmode,
            } as Record<String,RecordData>
            let backDataFour: emitter.EventData = {
              data: data10 as Record<String,RecordData>
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
            let data11: Record<String,RecordData> = {
              "duration": this.duration,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data11 as Record<String,RecordData>
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
            let data12: Record<String,RecordData> = {
              "duration": this.duration,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data12 as Record<String,RecordData>
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
            let data13: Record<String,RecordData> = {
              "curve": this.curve,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data13 as Record<String,RecordData>
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
            let data14: Record<String,RecordData> = {
              "curve": this.curve,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data14 as Record<String,RecordData>
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
            let data15: Record<String,RecordData> = {
              "iteration": this.iteration,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data15 as Record<String,RecordData>
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
            let data16: Record<String,RecordData> = {
              "iteration": this.iteration,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data16 as Record<String,RecordData>
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
            let data17: Record<String,RecordData> = {
              "tempo": this.tempo,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data17 as Record<String,RecordData>
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
            let data18: Record<String,RecordData> = {
              "tempo": this.tempo,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data18 as Record<String,RecordData>
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
            let data19: Record<String,RecordData> = {
              "playmode": this.playmode,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data19 as Record<String,RecordData>
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
            let data20: Record<String,RecordData> = {
              "playmode": this.playmode,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data20 as Record<String,RecordData>
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
      Button(this.show)
        .backgroundColor('0x317aff')
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button161')
        .onClick((e: ClickEvent) => {
          try {
            let data21: Record<String,RecordData> = {
              "finishCallbackType": this.finishCallbackType,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data21 as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1011,
              priority: emitter.EventPriority.LOW
            }
            console.info("button1011 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1011 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button1011 animateTo START")
          console.info("button1011 duration value is : " + this.duration)
          this.getUIContext().animateTo({ duration: this.duration }, () => {
            console.info("button1011 duration test animateTo START")
          })
        })
      Button(this.show)
        .backgroundColor('0x317aff')
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button171')
        .onClick((e: ClickEvent) => {
          try {
            let data22: Record<String,RecordData> = {
              "finishCallbackType": this.finishCallbackType,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data22 as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1012,
              priority: emitter.EventPriority.LOW
            }
            console.info("button171 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button171 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button171 animateTo START")
          console.info("button171 finishCallbackType value is : " + this.finishCallbackType)
          this.getUIContext().animateTo({ finishCallbackType: FinishCallbackType.REMOVED }, () => {
            console.info("button171 finishCallbackType test animateTo START")
          })
        })
      Button(this.show)
        .backgroundColor('0x317aff')
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 20 } as Margin)
        .key('button181')
        .onClick((e: ClickEvent) => {
          try {
            let data23: Record<String,RecordData> = {
              "finishCallbackType": this.finishCallbackType,
            } as Record<String,RecordData>
            let backData: emitter.EventData = {
              data: data23 as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 1013,
              priority: emitter.EventPriority.LOW
            }
            console.info("button181 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button181 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          console.info("button181 animateTo START")
          console.info("button181 finishCallbackType value is : " + this.finishCallbackType)
          this.getUIContext().animateTo({ finishCallbackType: FinishCallbackType.LOGICALLY }, () => {
            console.info("button181 finishCallbackType test animateTo START")
          })
        })
    }.height("%100").width("100%")
  }
}