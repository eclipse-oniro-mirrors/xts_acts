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
  ListItem,FontWeight
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,AppStorage,LocalStorage,AbstractProperty
} from '@ohos.arkui.stateManagement'
AppStorage.clear();
let paraRef: Record<string, number> = { 'PropBBK': 47 };
let storageBK: LocalStorage = new LocalStorage(paraRef);
storageBK.setAndRef<number>("PropBKK", 30)
const _get_storage_ : () => LocalStorage = () => storageBK

@Entry({storage : '_get_storage_' })
@Component
struct localStorageRef {
  private content: string = "LocalStorage";
  @State refA1Value?: AbstractProperty<number> = storageBK.ref<number>("PropBBK")
  @State refA2Value?: number | undefined = storageBK.get<number>("PropBKK")

  build() {
    Column() {
      Text(`${this.content}`)
        .fontSize(9)
        .fontWeight(FontWeight.Bold)

      Button(`ref:${storageBK.get<number>("PropBBK")}`)
        .id('local_ref_1')
        .fontWeight(FontWeight.Bold)
        .fontSize(9)

      Button(`setAndRef:${this.refA2Value}`)
        .id('local_ref_2')
        .fontWeight(FontWeight.Bold)
        .fontSize(9)

    }
    .width('100%')
    .height('100%')
  }
}