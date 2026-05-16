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
  Divider
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
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
@Observed
class ArrayLinkObject {
  public id: number = 1
  public value: string = ''

  constructor(id: number, value: string) {
    this.id = id
    this.value = value
  }
}

@Component
struct LinkArrayObjectChild {
  @Link value: Array<ArrayLinkObject>

  build() {
    Column() {

      Button('child init array').id('LinkArrayObject_init').height('5%')
        .onClick((e: ClickEvent) => {
          this.value = [new ArrayLinkObject(4, 'ArrayLinkObject4'),
            new ArrayLinkObject(5, 'ArrayLinkObject5'),
            new ArrayLinkObject(6, 'ArrayLinkObject6')]
        })

      Button('child add new one').id('LinkArrayObject_add').height('5%')
        .onClick((e: ClickEvent) => {
          let lastIndex = this.value.length - 1
          let newId = this.value[lastIndex].id + 1
          this.value.push(new ArrayLinkObject(newId, `ArrayLinkObject${newId}`))
        })

      Button('child clear').id('LinkArrayObject_clear').height('5%')
        .onClick((e: ClickEvent) => {
          this.value = []
          if (Array.from(this.value.entries())) {
            this.value.push(new ArrayLinkObject(0, `ArrayLinkObject0`))
          }
        })

      Button('child replace').id('LinkArrayObject_replace').height('5%')
        .onClick((e: ClickEvent) => {
          this.value[0] = new ArrayLinkObject(10, `ArrayLinkObject10`)
        })

      Button('child delete').id('LinkArrayObject_delete').height('5%')
        .onClick((e: ClickEvent) => {
          this.value.shift()
        })

      ForEach(Array.from(this.value.entries()), (item: [number, ArrayLinkObject]) => {
        Text(`${item[1].id}:${item[1].value} index:${item[0]}`).fontSize(9).height('5%')
          .id('LinkArrayObject_value_' + item[0])
        Divider()
      })
    }
  }
}

@Entry
@Component
struct LinkArrayObject {
  @State message: Array<ArrayLinkObject> = [new ArrayLinkObject(1, 'ArrayLinkObject1'),
    new ArrayLinkObject(2, 'ArrayLinkObject2'),
    new ArrayLinkObject(3, 'ArrayLinkObject3')]
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LinkArrayObject', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        LinkArrayObjectChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}