'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  ButtonType
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
  LocalStorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, UIUtils } from '@ohos.arkui.stateManagement';

const router = AppStorage.get<Router>("router") as Router
AppStorage.clear()
AppStorage.setOrCreate<Router>('router', router);

enum He2 {Q = 1, W, E}

class Model2 {
  value: number

  constructor(value: number) {
    this.value = value
  }
}

interface ValuePropTwoType {
  value: number
}


let storage220 = new LocalStorage()

const get_storage220 = (): LocalStorage => storage220

@Entry({ storage: 'get_storage220' })
@Component
struct LocalStoagePropTwo {
  @LocalStoragePropRef('Prop1') storProp1: Model2 = new Model2(6)
  @LocalStoragePropRef('Prop2') storProp2: number = 1;
  @LocalStoragePropRef('Prop3') storProp3: boolean = true
  @LocalStoragePropRef('Prop4') storProp4: string = 'abc'
  @LocalStoragePropRef('Prop5') storProp5: He2 = He2.Q
  @LocalStoragePropRef('Prop6') storProp6: object = { value: 66 } as ValuePropTwoType
  @LocalStoragePropRef('Prop7') storProp7: Array<Model2> = [new Model2(66), new Model2(67)]
  @LocalStoragePropRef('Prop8') storProp8: Array<number> = [1, 2]
  @LocalStoragePropRef('Prop9') storProp9: Array<boolean> = [true, false]
  @LocalStoragePropRef('Prop10') storProp10: Array<string> = ['abc', 'efd']
  @LocalStoragePropRef('Prop11') storProp11: Array<He2> = [He2.Q, He2.W]
  @LocalStoragePropRef('Prop12') storProp12: Array<object> =
    [{ value: 66 } as ValuePropTwoType, { value: 67 } as ValuePropTwoType]

  build() {
    Column() {
      Text(`Prop1:${JSON.stringify(storage220.get<Model2>('Prop1'))}, Prop2:${storage220.get<number>('Prop2')}, Prop3:${storage220.get<boolean>('Prop3')}, Prop4:${storage220.get<string>('Prop4')}, Prop5:${storage220.get<He2>('Prop5')}, Prop6:${JSON.stringify(UIUtils.getTarget(storage220.get<ValuePropTwoType>('Prop6')))}, Prop7:${JSON.stringify(storage220.get<Array<Model2>>('Prop7'))}, Prop8:${JSON.stringify(storage220.get<Array<number>>('Prop8'))}, Prop9:${JSON.stringify(storage220.get<Array<boolean>>('Prop9'))}, Prop10:${JSON.stringify(storage220.get<Array<string>>('Prop10'))}, Prop11:${JSON.stringify(storage220.get<Array<He2>>('Prop11'))}, Prop12:${JSON.stringify(UIUtils.getTarget(storage220.get<Array<object>>('Prop12')))}`)
        .key('text_getValue4').height('5%')
    }
  }
}