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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,Padding,$rawfile,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, SharedTransitionEffectType, Visibility,NavigationCommonTitle,NavDestinationCommonTitle
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
interface Param {
  duration: int
  delay: int
  type: SharedTransitionEffectType
}
@Entry
@Component
struct SharedTransitionExample {
  @State active: boolean = false
  @State duration: int = 1000
  @State delay: int = 0
  @State type: SharedTransitionEffectType = SharedTransitionEffectType.Static

  build() {
    List() {
      ListItem() {
        Row() {
          Navigation({}) {
            Image($rawfile('ic_health_heart.png')).width(50).height(50)
              .sharedTransition('sharedImage1', { duration: this.duration, delay: this.delay, type: this.type })
          }
          .key('Navigator')
          .padding({ left: 10 } as Padding)
          .onClick(() => {
            this.active = true
            console.info('SharedTransition current action state is: ' + this.active);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "duration": this.duration,
                  "delay": this.delay,
                  "type": this.type
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 193,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("SharedTransition start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("SharedTransition emit action state err: " + JSON.stringify((err as BusinessError).message))
            }
          })

          Text('SharedTransition').width(80).height(80).textAlign(TextAlign.Center)
        }
      }
    }
  }

  onPageShow() {
    console.info('sharedTransition page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 194,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("sharedTransition page state change called:" + JSON.stringify(eventData));
      if ((eventData.data as Param)?.duration != null) {
        this.duration = (eventData.data as Param).duration;
      }
      if ((eventData.data as Param)?.delay != null) {
        this.delay = (eventData.data as Param).delay;
      }
      if ((eventData.data as Param)?.type != null) {
        this.type = (eventData.data as Param).type;
      }
    }
  }
}


