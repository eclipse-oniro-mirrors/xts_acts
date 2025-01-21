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
import prompt from '@ohos.prompt'

@Entry
@Preview
@Component
struct AppearExample {
  @State isShow: boolean = true
  @State appearFlag: string = "appearStatusOff"
  @State disAppearFlag: boolean = false
  private changeAppear: string = 'Hide Text'
  private myText: string = 'Text for onAppear'

  onPageShow() {
    console.info('[appear] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 58,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[appear] page stateChangCallBack");
    if (eventData != null) {
      console.info("[appear] page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.isShow != null) {
        this.isShow = eventData.data.isShow;
      }
    }
  }

  build() {
    Column() {
      Button(this.changeAppear)
        .key('appear')
        .onClick(() => {
          this.isShow = !this.isShow
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.isShow,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 58,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("appearFlag start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("appearFlag emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .margin(3)
        .backgroundColor(0x2788D9)
      if (this.isShow) {
        Text(this.myText)
          .onAppear(() => {
            this.appearFlag = "appearStatusOn"
            this.changeAppear = 'Show Text'
            console.info('appearFlag current action state is: ' + this.appearFlag);
            prompt.showToast({ message: 'The text is shown', duration: 2000 })
            try {
              let backData2: events_emitter.EventData = {
                data: {
                  "APPEAR": this.appearFlag,
                }
              }
              let backEvent2: events_emitter.InnerEvent = {
                eventId: 59,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("appearFlag start to emit action state")
              events_emitter.emit(backEvent2, backData2)
            } catch (err) {
              console.info("appearFlag emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
          .onDisAppear(() => {
            this.disAppearFlag = true
            this.changeAppear = 'Hide Text'
            console.info('disAppearFlag current action state is: ' + this.disAppearFlag);
            prompt.showToast({ message: 'The text is hidden', duration: 2000 })
            try {
              let backData1: events_emitter.EventData = {
                data: {
                  "ACTION": this.disAppearFlag,
                }
              }
              let backEvent1: events_emitter.InnerEvent = {
                eventId: 60,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("disAppearFlag start to emit action state")
              events_emitter.emit(backEvent1, backData1)
            } catch (err) {
              console.info("disAppearFlag emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
      }
    }
    .padding(30)
    .width('100%')
  }
}