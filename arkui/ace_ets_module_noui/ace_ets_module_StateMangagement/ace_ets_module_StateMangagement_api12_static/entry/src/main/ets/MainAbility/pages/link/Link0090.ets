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
  ListItem
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Component
struct ChildLink0090 {
  @Link arrValue: Array<number>= new Array<number>(1, 2, 3, 4)

  build() {
    List() {
      ForEach(this.arrValue, (item: number, index:int)=>{
        ListItem() {
          Text(String(item))
            .id(`item_${index}`)
        }
      })
    }
  }
}

@Entry
@Component
struct Link0090 {
  @State arrValue: Array<number>= new Array<number>(1, 2, 3, 4)

  build() {
    Column() {
      Button('ChangeArr0')
        .id('btnLink0090Change')
        .onClick((e: ClickEvent)=>{
          this.arrValue[0] = 100
        })
      ChildLink0090({arrValue: this.arrValue})
    }
  }
}