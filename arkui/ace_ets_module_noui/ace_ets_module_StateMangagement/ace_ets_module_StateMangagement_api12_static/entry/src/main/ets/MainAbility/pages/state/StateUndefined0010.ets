'use static';
/**
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
  List,
  ListItem
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  LocalStorage,
  PropRef,
  Consume,
  StoragePropRef,
  LocalStoragePropRef,
  LocalStorageLink,
  PropRef
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,Provide } from '@ohos.arkui.stateManagement';
let stateUndefinedStorage0010 = new LocalStorage()
stateUndefinedStorage0010.setOrCreate('localStorageProp0010', undefined)
stateUndefinedStorage0010.setOrCreate('localStorageLink0010', undefined)
AppStorage.setOrCreate('storagePropValue0010', undefined)
AppStorage.setOrCreate('storageLinkValue0010', undefined)

@Component
struct ChildStateUndefined0010 {
  @State private stateValue: undefined | null = null
  @PropRef private propValue: undefined | null = null
  @Link linkValue: undefined | null
  @Consume('stateUndefined0010') private comsumeValue: undefined | null
  @StoragePropRef('storagePropValue0010') private storagePropValue: undefined | null = null
  @StorageLink('storageLinkValue0010') private storageLinkValue: undefined | null = null
  @LocalStoragePropRef('localStorageProp0010') private localStorageProp: undefined | null = null
  @LocalStorageLink('localStorageLink0010') private localStorageLink: undefined | null = null

  build() {
    Column() {
      Text('stateValue:' + this.stateValue)
        .id('tvStateValue')
      Text('propValue:' + this.propValue)
        .id('tvPropValue')
      Text('linkValue:' + this.linkValue)
        .id('tvLinkValue')
      Text('comsumeValue:' + this.comsumeValue)
        .id('tvComsumeValue')
      Text('storagePropValue:' + this.storagePropValue)
        .id('tvStoragePropValue')
      Text('storageLinkValue:' + this.storageLinkValue)
        .id('tvStorageLinkValue')
      Text('localStorageProp:' + this.localStorageProp)
        .id('tvLocalStorageProp')
      Text('localStorageLink:' + this.localStorageLink)
        .id('tvLocalStorageLink')
    }
  }
}

const _get_localstorage_ : () => LocalStorage = () => stateUndefinedStorage0010

@Entry({ storage: '_get_localstorage_' })
@Component
struct StateUndefined0010 {
  @State private stateValue: undefined | null = undefined
  @Provide({ alias:'stateUndefined0010' }) provideValue: undefined | null = undefined

  build() {
    Column() {
      Text('provideValue:' + this.provideValue)
        .id('tvProvideValue')
      ChildStateUndefined0010({stateValue: this.stateValue, propValue: this.stateValue, linkValue: this.stateValue})
    }
  }
}
