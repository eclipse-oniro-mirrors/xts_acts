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
  FontWeight,
  Profiler,
  setAppBgColor,
  FlexWrap,$r,Resource
} from '@ohos.arkui.component'
import {
  State,
  Link,StorageLink,
  PropRef,Provide,Consume,AppStorage,Environment,PersistentStorage,SubscribedAbstractProperty
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';



@Entry
@Component
struct StorageDeprecated {
  static {
    AppStorage.setOrCreate<string>('ADKey', 'HelloArkUI')
    AppStorage.setOrCreate<string>('ADKey1', 'HelloArkUI')
    Environment.envProps([{key: 'languageCode', defaultValue: 'en'}])
    Environment.envProps([{key: 'languageCodeA', defaultValue: 'en'}])

    PersistentStorage.persistProp<string>('ADPersistPropsA','HelloPersistPropsA')
    PersistentStorage.persistProp<string>('ADPersistPropsAa','HelloPersistPropsAa')
    PersistentStorage.persistProp<string>('ADPersistPropsAb','HelloPersistPropsAb')
    PersistentStorage.persistProp<string>('ADPersistPropsB','HelloPersistPropsB')
    PersistentStorage.persistProp<string>('ADPersistPropsBa','HelloPersistPropsBa')
    PersistentStorage.persistProp<string>('ADPersistPropsBb','HelloPersistPropsBb')

    PersistentStorage.persistProp<string>('ADPersistentStorageA', 'HelloPersistPropA')
    PersistentStorage.persistProp<string>('ADPersistentStorageB', 'HelloPersistPropB')
  }
  private deprecatedKey: SubscribedAbstractProperty<string> | undefined = AppStorage.ref<string>('ADKey') as SubscribedAbstractProperty<string>
  private environmentKey: SubscribedAbstractProperty<string> | undefined = AppStorage.ref<string>('languageCode') as SubscribedAbstractProperty<string>
  @State private isDelete: boolean = false
  @State private isDelKey: boolean = false
  @StorageLink('ADPersistPropsA') aPerA: string = ''
  @StorageLink('ADPersistPropsAb') aPerAb: string = ''
  @StorageLink('ADPersistentStorageA') aPerC: string = ''


  build() {
    Column() {
      if (AppStorage.has('ADKey')) {
        Text(this.deprecatedKey?.get().toString()).height('5%')
          .id('tvDeprecatedGet')
        Button('DeleteAppStorageCreate').height('5%')
          .id('btnDelASKey')
          .onClick(() => {
            this.isDelete = AppStorage.delete('ADKey1')
            this.isDelKey = AppStorage.delete('ADKey')
          })
      }
      if (AppStorage.has('ADKey1')) {
        Text(this.isDelete.toString()).height('5%')
          .id('tvDeprecatedDel')
      }
      if (AppStorage.has('ADKey')) {
        Text(this.isDelKey.toString()).height('5%')
          .id('tvDeprecatedDel1')
      }
      if (this.environmentKey?.get() === 'zh') {
        Text('你好Environment').height('5%')
      } else {
        Text('HelloEnvironment').height('5%')
      }
      Text(this.aPerA).height('5%')
        .id('tvADPersistPropsA')
      Text(this.aPerAb).height('5%')
        .id('tvADPersistPropsAb')
      Text(this.aPerC).height('5%')
        .id('tvADPersistentStorageA')
      Button('DeletePersistentStorageKey').height('5%')
        .id('btnDelPSKey')
        .onClick(() => {
          PersistentStorage.deleteProp('ADPersistPropsA')
          PersistentStorage.deleteProp('ADPersistPropsAa')
          PersistentStorage.deleteProp('ADPersistPropsAb')
          PersistentStorage.deleteProp('ADPersistentStorageA')
          PersistentStorage.deleteProp('ADPersistPropsB')
          PersistentStorage.deleteProp('ADPersistPropsBa')
          PersistentStorage.deleteProp('ADPersistPropsBb')
          PersistentStorage.deleteProp('ADPersistentStorageB')
        })
    }
    .width('100%')
    .height('100%')
  }
}