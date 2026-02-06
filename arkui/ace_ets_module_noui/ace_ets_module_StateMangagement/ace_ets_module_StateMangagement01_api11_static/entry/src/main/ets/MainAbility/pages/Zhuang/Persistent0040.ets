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

import CommonFunc from '../../../MainAbility/common/Common';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,
  Scroll,
  ButtonType,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
} from '@ohos.arkui.component'
import {
  State,
  Link,StorageLink,
  PropRef,Provide,Consume,PersistentStorage
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';

class ClassPS0040 {
  private _type: number

  public set type(value: number) {
    this._type = value
  }

  public get type(): number {
    return this._type
  }

  constructor(type: number) {
    this._type = type
  }
}

enum EnumPS0040 {
  ID = 0,
  IM = 1
}

PersistentStorage.persistProp('PS0040', undefined)

@Entry
@Component
struct Persistent0040 {
  @StorageLink('PS0040') ps0040: ClassPS0040 | undefined | number | null | Object | Array<string> | EnumPS0040 |
  boolean | Set<number> | Map<string, number> | Date | string = new ClassPS0040(0)

  build() {
    Column() {
      Text('value:' + this.ps0040).height('5%')
        .id('tvPS0040')
      Button('Change').height('5%')
        .id('btnChangePS0040')
        .onClick(() => {
          this.ps0040 = new ClassPS0040(10)
          this.ps0040 = undefined
          this.ps0040 = 100
          this.ps0040 = null
          this.ps0040 = 'object'
          this.ps0040 = ['ArkUI']
          this.ps0040 = EnumPS0040.IM
          this.ps0040 = true
          this.ps0040 = new Set<int>([1, 5, 7])
          this.ps0040 = new Map<string,number>().set('PSMapKey', 10000)
          this.ps0040 = new Date('2024/01/02')
          this.ps0040 = 'HelloArkUI'
        })
      Button('DelPS').height('5%')
        .id('btnDelPS0040')
        .onClick(()=>{
          PersistentStorage.deleteProp('PS0040')
        })
    }
    .width('100%')
    .height('100%')
  }
}