// @ts-nocheck
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

import events_emitter from '@ohos.events.emitter'

@Entry
@Preview
@Component
struct TouchExample {
  @State text: string = ''
  @State eventType: string = ''
  @State touchFlag: boolean = false

  onPageShow() {
    console.info('[touch] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 42,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[touch] page stateChangCallBack");
    if (eventData != null) {
      console.info("[touch] page state change called:" + JSON.stringify(eventData));
      if (eventData.data.text != null) {
        this.text = eventData.data.text;
      }
      if (eventData.data.eventType != null) {
        this.eventType = eventData.data.eventType;
      }
      if (eventData.data.touchFlag != null) {
        this.touchFlag = eventData.data.touchFlag
      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Button('Touch')
        .backgroundColor(0x2788D9)
        .height(40)
        .width(80)
        .key('touch')
        .onTouch((event: Touch) => {
          if (event.type === TouchType.Down) {
            this.eventType = 'Down'
            console.info("[touch] eventType is Down")
            this.touchFlag = true
          }
          if (event.type === TouchType.Up) {
            this.eventType = 'Up'
            console.info("[touch] eventType is Up")
            this.touchFlag = true
          }
          if (event.type === TouchType.Move) {
            this.eventType = 'Move'
            console.info("[touch] eventType is Move")
            this.touchFlag = true
          }
          stopPropagation: () => {
            console.info('stopPropagation')
          }
          console.info('onTouch successful, touchFlag is : ' + this.eventType + ', ' + this.touchFlag)
          console.info(this.text = 'TouchType:' + this.eventType
            + '\nDistance between touch point and touch element:\nx: '
            + event.touches[0].x + '\n' + 'y: ' + event.touches[0].y + '\ncomponent globalPosition：（'
            + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y + '）\nwidth:'
            + event.target.area.width + '\nheight：' + event.target.area.height);
          console.log('fang--->A')
          try {
            console.log('fang--->B')
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.touchFlag,
              }
            }
            console.log('fang--->C')
            let backEvent: events_emitter.InnerEvent = {
              eventId: 43,
              priority: events_emitter.EventPriority.LOW
            }
            console.log('fang--->D')
            console.info("touchFlag start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("touchFlag emit action state err: " + JSON.stringify(err.message))
          }
        })
      Text(this.text)
    }
    .height(200)
    .width(350)
  }
}