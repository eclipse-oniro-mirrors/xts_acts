/**
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

import events_emitter from '@ohos.events.emitter'
import { MessageManager, Callback } from '../../utils/MessageManager';

@Entry
@Component
struct StepperExample {
  @State currentIndex: number = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State disabled: ItemState = ItemState.Normal
  messageManager: MessageManager = new MessageManager()

  build() {
    Stepper({
      index: this.currentIndex
    }) {
      StepperItem() {
        Text('Page One')
          .fontSize(35)
          .fontColor(Color.Blue)
          .width(200)
          .lineHeight(50)
          .margin({ top: 250 })
      }
      .nextLabel('')
      .position({ x: '35%', y: 0 })
      .key('stepperItem1')

      StepperItem() {
        Text('Page Two')
          .fontSize(35)
          .fontColor(Color.Blue)
          .width(200)
          .lineHeight(50)
          .margin({ top: 250 })
          .key('text1')
          .onClick(() => {
            this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
          })
      }
      .nextLabel('Next')
      .prevLabel('Previous')
      .status(this.firstState)
      .position({ x: '35%', y: 0 })
      .key('stepperItem2')

      StepperItem() {
        Text('Page Three')
          .fontSize(35)
          .fontColor(Color.Blue)
          .width(200)
          .lineHeight(50)
          .margin({ top: 250 })
          .key('text2')
          .onClick(() => {
            this.secondState = this.secondState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting
          })
      }
      .position({ x: '35%', y: 0 })
      .status(this.secondState)
      .key('stepperItem3')

      StepperItem() {
        Text('Page four')
          .fontSize(35)
          .fontColor(Color.Blue)
          .width(200)
          .lineHeight(50)
          .margin({ top: 250 })
      }
      .position({ x: '35%', y: 0 })
      .nextLabel('Finish')
      .key('stepperItem4')
    }
    .onFinish(() => {
      console.log('onFinish')
    })
    .onSkip(() => {
      console.log('onSkip')
    })
    .onChange((prevIndex: number, index: number) => {
      this.currentIndex = index
    })
    .align(Alignment.Center)
    .key('stepper')
  }

  onPageShow() {
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'index') {
        this.currentIndex = message.value
      }
    }
    this.messageManager.registerCallback(callback)

    console.info('stepper page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 202,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 909,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack);

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 910,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack);

    let stateChangeEventFour: events_emitter.InnerEvent = {
      eventId: 940,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFour, this.stateChangCallBack);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("stepper page stateChangCallBack" + JSON.stringify(eventData));
    if (eventData != null) {
      console.info("stepper page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.currentIndex != null) {
        this.currentIndex = eventData.data.currentIndex;
        console.info("stepper page.." + this.currentIndex);
      }
      if (eventData.data?.disabled != null) {
        this.disabled = eventData.data.disabled;
      }
    }
  }
}