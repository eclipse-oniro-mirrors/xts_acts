'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, ButtonAttribute, TransitionType, Flex, Button, ClickEvent, Image, $r,
  Padding, FlexDirection, ItemAlign, Margin, TransitionEffect } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
class TransitionModifier1 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    // instance.transition({ type: TransitionType.Insert, scale: { x: 0, y: 1.0, z: 1.0 }, opacity: 1 });
  }
}

@Entry
@Component
struct TransitionTest7Example {
  @State btn1: boolean = false
  @State show: string = "show"
  @State onActionCalled: boolean = false
  @State transitionTypeOne: TransitionType = TransitionType.Insert
  @State transitionTypeTwo: TransitionType = TransitionType.Delete
  @State transitionTypeThree: TransitionType = TransitionType.All
  @State transitionMod: TransitionModifier1 = new TransitionModifier1()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, }) {
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 50 } as Margin)
        .key('button')
        .onClick((e: ClickEvent) => {
          this.onActionCalled = true;
          try {
            let backData: events_emitter.EventData = {
              data: {
                "btn1": this.btn1,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 233,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("transitionTest_0200 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("transitionTest_0200 emit action state err: " + JSON.stringify((err as Error).message))
          }
          this.getUIContext()?.animateTo({ duration: 3000 }, () => {
            this.btn1 = !this.btn1
            if (this.btn1) {
              this.show = "hide"
            } else {
              this.show = "show"
            }
          })
        })
      if (this.btn1) {
        Button('') {
          Image($r('app.media.icon')).width("80%").height(300).key('image')
        }.attributeModifier(this.transitionMod)
          .key('button1')
      }
    }.height(400).width("100%").padding({ top: 100 } as Padding)
  }
}