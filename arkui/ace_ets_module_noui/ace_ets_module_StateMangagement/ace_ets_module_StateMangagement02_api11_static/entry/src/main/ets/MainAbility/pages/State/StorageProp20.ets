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
  ButtonType,
  Color,
  DatePicker,
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
  Environment
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';

@Entry
@Component
struct StorageProp20 {
  @StoragePropRef('Prop20') storProp1: number = 1
  @StoragePropRef('PropB') storProp2: number = 4
  @StoragePropRef('PropC') storProp3: string = 'gg'
  @State num: number = 0
  @State vae: string = ''

  static {
    AppStorage.clear()
    Environment.envProp<number>('Prop20', 10);
  }

  build(){
    Column(){
      CompStorageProp20({storProp1:this.storProp1,storProp2:this.storProp1,storProp3:this.storProp1,num:this.storProp1})

    }
  }
}

@Component
struct CompStorageProp20 {
  @State storProp1 : number = 0
  @Link storProp2 : number
  @PropRef storProp3 : number
  @Provide num : number = 0
  build() {
    Column(){
      Text(`State:${this.storProp1}`).height('5%')
        .key('text_state')
      Text(`Link:${this.storProp2}`).height('5%')
        .key('text_Link')
      Text(`PropRef:${this.storProp3}`).height('5%')
        .key('text_Prop')
      Text(`Provide:${this.num}`).height('5%')
        .key('text_Provide')
    }
  }
}