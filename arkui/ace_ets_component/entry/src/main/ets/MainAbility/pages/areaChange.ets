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

@Entry
@Component
struct AreaExample {
  @State value: string = 'Text';
  @State _size: string = '';
  @State onActionCalled: boolean = false;

  build() {
    Column() {
      Text(this.value)
        .key('text1')
        .backgroundColor(Color.Green)
        .margin(30)
        .fontSize(20)
        .onClick(() => {
          this.value = this.value + 'Text'
          try {
            let backData: events_emitter.EventData = {
              data: {
                "value": this.value,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 61,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onClick emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          console.info(`Ace: on area change, oldValue is ${JSON.stringify(oldValue)} newvalue is ${JSON.stringify(newValue)}`)
          this._size = JSON.stringify(newValue)
          this.onActionCalled = true;
          console.info('onAreaChange current action state is: ' + this.onActionCalled);
          try {
            let backData1: events_emitter.EventData = {
              data: {
                "ACTION": this.onActionCalled,
              }
            }
            let backEvent1: events_emitter.InnerEvent = {
              eventId: 62,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onAreaChange start to emit action state")
            events_emitter.emit(backEvent1, backData1)
          } catch (err) {
            console.info("onAreaChange emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      Text('new area is: \n' + this._size)
        .key('text2')
        .margin({ right: 30, left: 30 })
    }
    .width('100%')
    .height('100%')
    .margin({ top: 30 })
  }
}