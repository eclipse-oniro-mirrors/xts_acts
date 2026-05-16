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
import {
  $rawfile,
  AnimateParam,
  Button,
  ButtonOptions,
  ClickEvent,
  Component,
  Entry,
  Flex,
  FlexDirection,
  FlexOptions,
  Image,
  ItemAlign,
  Margin,
  Padding
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct geometryTransitionExample {
  @State btn1: boolean = false;
  @State show: string = "show";

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor('0x317aff')
        .margin({ bottom: 50 } as Margin)
        .key('button')
        .onClick((event: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "btn1": this.btn1,
              } as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 104,
              priority: emitter.EventPriority.LOW
            } as emitter.InnerEvent
            console.info("geometryTransitionTest_0100 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("geometryTransitionTest_0100 emit action state err: " +
            JSON.stringify((err as Error)?.message))
          }
          this.getUIContext().animateTo({ duration: 1000 }, () => {
            this.btn1 = !this.btn1
            if (this.btn1) {
              this.show = "hide"
            } else {
              this.show = "show"
            }
          })
        })
      if (this.btn1) {
        Button(this.show) {
          Image($rawfile('test.png'))
            .width("80%")
            .height(300)
        }.geometryTransition('geometryTransition')
      }
    }
    .height(400)
    .width("100%")
    .padding({ top: 100 } as Padding)
  }
}
