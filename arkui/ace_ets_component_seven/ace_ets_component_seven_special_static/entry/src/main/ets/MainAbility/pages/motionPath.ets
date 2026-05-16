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
import { Entry, Component, Column, AttributeModifier, ButtonAttribute, Button, ClickEvent, HorizontalAlign, Curve } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

class MotionPathModifier1 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.motionPath({ path: 'Mstart.x start.y L300 200 L300 500 Lend.x end.y', from: 0, to: 1, rotatable: false })
  }
}

@Entry
@Component
struct MotionPath7Example {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State toggle: boolean = true
  @State rotatable: boolean = false
  @State path: string = 'Mstart.x start.y L300 200 L300 500 Lend.x end.y'
  @State fromX: number = 0
  @State toY: number = 1
  @State motionPathModifier1: MotionPathModifier1 = new MotionPathModifier1()

  build() {
    Column() {
      Button('click me')
        .key('button')
        .attributeModifier(this.motionPathModifier1)
        .onClick((e: ClickEvent) => {
          this.rotatable = true;
          console.info('button rotate current action state is:' + this.rotatable);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.rotatable,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 132,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button emit action state err: " + JSON.stringify((err as Error).message))
          }
          this.getUIContext()?.animateTo({ duration: 4000, curve: Curve.Linear }, () => {
            this.toggle = !this.toggle;
          })
        })
        .backgroundColor(0x317aff)
      Button('next')
        .key('button1')
        .onClick((e: ClickEvent) => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "fromX": this.fromX,
                "toY": this.toY
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 133,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button1 position start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 position emit action state err: " + JSON.stringify((err as Error).message))
          }
        })
    }
    .key('motionPath')
      .width('100%').height('100%').alignItems(this.toggle ? HorizontalAlign.Start : HorizontalAlign.Center)
  }

  onPageShow() {
    console.info('motionPath page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 134,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack)
  }

  private stateChangeCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('motionPath page state change called:' + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['fromX'] != null) {
        this.fromX == parseInt(data['fromX'] as string);
      }
      if (data['toY'] != null) {
        this.toY == parseInt(data['toY'] as string);
      }
    }
  }
}