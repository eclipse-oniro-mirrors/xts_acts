'use static';
/*
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
// import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Builder,
  NavPathStack,
  FontWeight,
  Navigation,
  NavDestination,
  NavigationMode,
  ButtonType,
  Color,
  DatePicker,
  Divider,
  Alignment,
  TextAlign,
  TextOverflow,
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef,
  LocalStorageLink,
  Observed,
  Environment,
  ColorMode
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import emitter from "@ohos.events.emitter";
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

// let storage1: LocalStorage = LocalStorage.GetShared() 原代码，已平替
let storage2: LocalStorage = new LocalStorage({ "PropA": 47 } as Record<string, number>);
@Entry
@Component
struct StateManagementGetShared {
  storage1: LocalStorage | undefined = this.getUIContext().getSharedLocalStorage();
  @LocalStorageLink("storageSimpleProp") simpleVarName: number = 0

  aboutToAppear() {
    hilog.info(0x0000, TAG, 'aboutToAppear StateManagementGetShared start');
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  aboutToDisappear() {
    hilog.info(0x0000, TAG, 'aboutToAppear StateManagementGetShared end');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key("GetSharedText")
        .onClick((): void => {
          try {
            let backDataOne: emitter.EventData = {
              data: {
                "Result": (this.storage1 != null)
              } as Record<String,RecordData>
            }
            let backEventOne: emitter.InnerEvent = {
              eventId: 60223,
              priority: emitter.EventPriority.LOW
            }
            console.info("GetShared start to emit action state")
            emitter.emit(backEventOne, backDataOne)
          } catch (err) {
            console.info("GetShared emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key("setAndLinkText")
        .onClick((): void => {
          try {
            let backDataTwo: emitter.EventData = {
              data: {
                "Result": "callback2"
              } as Record<String,RecordData>
            }
            let backEventTwo: emitter.InnerEvent = {
              eventId: 60224,
              priority: emitter.EventPriority.LOW
            }
            console.info("setAndLink start to emit action state")
            emitter.emit(backEventTwo, backDataTwo)
          } catch (err) {
            console.info("setAndLink emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          // this.storage1?.setAndLink("storageSimpleProp",48)
          // console.log("storage1.setAndLink('PropA',48) :" + this.simpleVarName )
        })

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key("setOrCreateText")
        .onClick((): void => {
          try {
            let backDataThree: emitter.EventData = {
              data: {
                "Result": "callback3"
              } as Record<String,RecordData>
            }
            let backEventThree: emitter.InnerEvent = {
              eventId: 60225,
              priority: emitter.EventPriority.LOW
            }
            console.info("setOrCreate start to emit action state")
            emitter.emit(backEventThree, backDataThree)
          } catch (err) {
            console.info("setOrCreate emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

      Text(`Parent from LocalStorage ${this.simpleVarName}`).height('5%')
        .key("setAndPropText")
        .onClick((): void => {
          try {
            let backDataFour: emitter.EventData = {
              data: {
                "Result": "callback4"
              } as Record<String,RecordData>
            }
            let backEventFour: emitter.InnerEvent = {
              eventId: 60226,
              priority: emitter.EventPriority.LOW
            }
            console.info("setAndProp start to emit action state")
            emitter.emit(backEventFour, backDataFour)
          } catch (err) {
            console.info("setAndProp emit action state err: " + JSON.stringify((err as Error)?.message))
          }

          // this.storage1?.setAndRef("storageSimpleProp",49)
          // console.log("storageSimpleProp setAndProp is :  " + this.simpleVarName)
        })

    }.width("100%").height("100%")
  }
}

@Component
struct Child {
  @LocalStorageLink("PropA") storLink: number = 1;

  build() {
    Text(`Parent from LocalStorage ${this.storLink}`).height('5%')
      .onClick(() => {
        this.storLink += 1
      })
  }
}
