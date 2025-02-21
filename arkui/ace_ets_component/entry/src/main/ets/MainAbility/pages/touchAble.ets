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

import events_emitter from '@ohos.events.emitter';

@Entry
@Component
@Preview
struct TouchAbleExample {
  @State text1: string = '';
  @State text2: string = '';

  build() {
    Stack() {
      Rect()
        .fill(Color.Gray)
        .width(150)
        .height(150)
        .onClick(() => {
          console.info(this.text1 = 'Rect Clicked')
        })
        .overlay(this.text1, { align: Alignment.Bottom, offset: { x: 0, y: 20 } })

      Ellipse()
        .fill(Color.Pink)
        .width(150)
        .height(80)
        .key('ellipse')
        .touchable(this.touchableValue)
        .onClick(() => {
          this.text2 = 'Ellipse Clicked';
          console.info("touchAble text2:" + this.text2);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.text2
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 237,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("[TouchAble] start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("[TouchAble] emit action state err: " + JSON.stringify(err.message))
          }
        })
        .overlay(this.text2, { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
    }.margin(100)
  }
}