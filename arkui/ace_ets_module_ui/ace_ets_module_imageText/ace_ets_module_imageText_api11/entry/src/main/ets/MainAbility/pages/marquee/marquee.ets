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

@Entry
@Component
struct MarqueeExample {
  @State start: boolean = false
  @State fromStart: boolean = true
  @State step: number = 50
  @State loop: number = 3
  @State src: string = "Running Marquee starts rolling"
  @State fontColor: Color = Color.Blue;
  @State fontSize: number = 50;
  @State onActionCalledThree: boolean = false;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.src
      })
        .key('marquee')
        .fontColor(this.fontColor)
        .colorBlend(Color.Green)
        .fontSize(this.fontSize)
        .allowScale(false)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.Black)
        .margin({ bottom: 40 })
        .onStart(() => {
          console.log('Marquee animation complete onStart')
          console.info('Onstart current action state is: ' + this.fontColor);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "fontColor": this.fontColor,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 127,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("Onstart start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("Onstart emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .onBounce(() => {
          console.log('Marquee animation complete onBounce')
          console.info('Onbounce current action state is: ' + this.fontSize);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "fontSize": this.fontSize,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 128,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("Onbounce start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("Onbounce emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .onFinish(() => {
          console.log('Marquee animation complete onFinish')
          this.onActionCalledThree = true;
          console.info('Onfinish current action state is: ' + this.onActionCalledThree);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.onActionCalledThree,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 129,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("Onfinish start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("Onfinish emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      Button('start')
        .key('button')
        .onClick(() => {
          this.start = true
          try {
            let backData: events_emitter.EventData = {
              data: {
                "start": this.start,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 130,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .width(200)
        .height(60)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
  }
}