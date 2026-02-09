'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  List,
  ListItem,
  Color,HorizontalAlign,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,LocalStorage,LocalStorageLink,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'

let param_47: Record<string, int> = { 'PropAX': 47 }
let customStorage8: LocalStorage = new LocalStorage(param_47)

interface InterfaceObj {
  storage: LocalStorage
}

const obj: InterfaceObj = {
  storage: customStorage8
}

const _get_localstorage_ : () => LocalStorage = () => obj.storage

@Entry({ storage: '_get_localstorage_' })
@Component
struct ChainCallStorage1 {
  @LocalStorageLink('PropAX') parentLinkNumber: int = 1

  build() {
    Column() {
      Button('PropAX:' + this.parentLinkNumber)
        .id('persistStorageA_1')
        .onClick(():void => {
        this.parentLinkNumber += 1
      })
    }
    .width('100%')
    .height('100%')
  }
}