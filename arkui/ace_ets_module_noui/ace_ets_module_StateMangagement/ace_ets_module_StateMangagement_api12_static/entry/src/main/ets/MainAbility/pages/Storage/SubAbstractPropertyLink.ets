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
  List,
  ListItem,
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,AppStorage,SubscribedAbstractProperty,
  // Preview
} from '@ohos.arkui.stateManagement'



// @Preview({
//   title: 'SubAbstractPropertyLink',
//   width: 720,
//   height: 1080
// })
@Entry
@Component
struct SubAbstractPropertyLink {
  @State propValue?: SubscribedAbstractProperty<number> = AppStorage.link<number>('SubAbstractPropertyLinkTest') as SubscribedAbstractProperty<number>
  static { AppStorage.setOrCreate('SubAbstractPropertyLinkTest', 52.0) }
  build() {
    Column() {
      Text(this.propValue?.info() + ':' + this.propValue?.get().toString())
        .id('tvSubValue')
        .height('5%')

      Button('Click')
        .id('btnSubSet')
        .height('5%')
        .onClick(() => {
          this.propValue?.set(Number(this.propValue?.get()) + 1)
          this.propValue?.aboutToBeDeleted()
        })
    }
  }
}