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
@Component
struct GestureSettingsExample {
  @State value: string = ''

  build() {
    Column() {
      Text('Click\n' + this.value).gesture(TapGesture()
        .onAction(() => {
          this.value = 'gesture onAction'
          try {
            let backData: events_emitter.EventData = {
              data: {
                "value": this.value
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 150,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("click action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      )
        .key('tapGesture')
    }
    .key('parallelGesture')
    .height(200)
    .width(300)
    .padding(60)
    .border({ width: 1 })
    .margin(30)
    .priorityGesture(
    TapGesture()
      .onAction(() => {
        this.value = 'parallelGesture onAction'
      }), GestureMask.IgnoreInternal
    )
  }
}