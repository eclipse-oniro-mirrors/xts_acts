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
import {
  Entry,Component,$r,$rawfile,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,TransitionEffect,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,Padding, TransitionType, TransitionEffect,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct TransitionExample {
  @State btn1: boolean = false
  @State show: string = "show"
  @State opacity1: number = 1
  @State onActionCalled: boolean = false
  @State transitionTypeOne: TransitionType = TransitionType.Insert
  @State transitionTypeTwo: TransitionType = TransitionType.Delete
  @State transitionTypeThree: TransitionType = TransitionType.All

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, }) {
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(Color.Red)
        .margin({ bottom: 50 } as Margin)
        .key('button')
        .opacity(this.opacity1)
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
            console.info("transitionTest_0200 emit action state err: " + JSON.stringify((err as BusinessError).message))
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
          Image($rawfile('test.png')).width("80%").height(300).key('image')
        }
        .transition(
          TransitionEffect.asymmetric(
            TransitionEffect.scale({ x: 0, y: 1.0, z: 1.0 }),
            TransitionEffect.IDENTITY
          )
        )
        .key('button1')
        .transition(
          TransitionEffect.asymmetric(
            TransitionEffect.scale({ x: 1.0, y: 0.0 }),
            TransitionEffect.IDENTITY
          )
        )
      }
    }.height(400).width("100%").padding({ top: 100 } as Padding)
  }

  onPageShow() {
    console.info('transition page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 233,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      let data = eventData.data as Record<String,RecordData>
      if (data!['opacity'] != null) {
        this.opacity1 = data!['opacity'] as double;
      }
    }
  }
}