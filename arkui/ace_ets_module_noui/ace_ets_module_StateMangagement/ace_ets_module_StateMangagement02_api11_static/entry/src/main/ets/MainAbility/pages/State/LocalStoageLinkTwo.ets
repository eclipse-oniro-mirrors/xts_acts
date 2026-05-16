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

enum He {Q = 1, W, E}

class ModeLinkTwo {
  value: number

  constructor(value: number) {
    this.value = value
  }
}

interface ValuePropLinkTwoType {
  value: number
}

let storageLinkTwo = new LocalStorage()
let _get_local_storage_ = ():LocalStorage => storageLinkTwo

@Entry({ storage:'_get_local_storage_' })
@Component
struct LocalStoageLinkTwo {
  @LocalStorageLink('Prop1') storLink1: ModeLinkTwo = new ModeLinkTwo(6)
  @LocalStorageLink('Prop2') storLink2: number = 1;
  @LocalStorageLink('Prop3') storLink3: boolean = true
  @LocalStorageLink('Prop4') storLink4: string = 'abc'
  @LocalStorageLink('Prop5') storLink5: He = He.Q
  @LocalStorageLink('Prop6') storLink6: object = { value: 66 } as ValuePropLinkTwoType
  @LocalStorageLink('Prop7') storLink7: Array<ModeLinkTwo> = [new ModeLinkTwo(66), new ModeLinkTwo(67)]
  @LocalStorageLink('Prop8') storLink8: Array<number> = [1, 2]
  @LocalStorageLink('Prop9') storLink9: Array<boolean> = [true, false]
  @LocalStorageLink('Prop10') storLink10: Array<string> = ['abc', 'efd']
  @LocalStorageLink('Prop11') storLink11: Array<He> = [He.Q, He.W]
  @LocalStorageLink('Prop12') storLink12: Array<object> =
    [{ value: 66 } as ValuePropLinkTwoType, { value: 67 } as ValuePropLinkTwoType]

  build() {
    Column() {
      Text(`Prop1:${JSON.stringify(storageLinkTwo.get<ModeLinkTwo>('Prop1'))}, Prop2:${storageLinkTwo.get<number>('Prop2')}, Prop3:${storageLinkTwo.get<boolean>('Prop3')}, Prop4:${storageLinkTwo.get<string>('Prop4')}, Prop5:${storageLinkTwo.get<He>('Prop5')}, Prop6:${JSON.stringify(UIUtils.getTarget(storageLinkTwo.get<object>('Prop6')))}, Prop7:${JSON.stringify(storageLinkTwo.get<Array<ModeLinkTwo>>('Prop7'))}, Prop8:${JSON.stringify(storageLinkTwo.get<Array<number>>('Prop8'))}, Prop9:${JSON.stringify(storageLinkTwo.get<Array<boolean>>('Prop9'))}, Prop10:${JSON.stringify(storageLinkTwo.get<Array<string>>('Prop10'))}, Prop11:${JSON.stringify(storageLinkTwo.get<Array<He>>('Prop11'))}, Prop12:${JSON.stringify(UIUtils.getTarget(storageLinkTwo.get<Array<object>>('Prop12')))}`)
        .key('text_getValue2').height('5%')
    }
  }
}