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
  Color,
  FlexAlign,
  FontWeight
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  AbstractProperty
} from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let ref1: AbstractProperty<number> = AppStorage.setAndRef<number>("PropAAk", 52)!
let ref2: AbstractProperty<number> = AppStorage.setAndRef<number>("PropAkk", 37)!

@Entry
@Component
struct appStorageRef {
  ref11: AbstractProperty<number> = ref1
  ref22: AbstractProperty<number> = ref2
  private content: string = "AppStorage";
  @State refA1Value: AbstractProperty<number>| undefined = AppStorage.ref<number>("PropAAk")
  @State refA2Value: number|undefined = AppStorage.get<number>("PropAkk")

  build() {
    Column() {
      Text(`${this.content}`)
        .fontSize(9)
        .fontWeight(FontWeight.Bold)

      Button(`ref:${AppStorage.get<number>("PropAAk")}`)
        .id('app_ref_1')
        .fontWeight(FontWeight.Bold)
        .fontSize(9)

      Button(`setAndRef:${this.refA2Value}`)
        .id('app_ref_2')
        .fontWeight(FontWeight.Bold)
        .fontSize(9)
    }
    .width('100%')
    .height('100%')
  }
}