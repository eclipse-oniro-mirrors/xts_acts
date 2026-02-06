'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
class MyPropObject {
  public id: number = 1
  public value: string = ''

  constructor(id: number, value: string) {
    this.id = id
    this.value = value
  }
}

@Component
struct PropArrayObjectChild {
  @PropRef message: Array<MyPropObject> = new Array<MyPropObject>(new MyPropObject(4, 'MyPropObject4'),
  new MyPropObject(5, 'MyPropObject'),
  new MyPropObject(6, 'MyPropObject'))

  build() {
    Column() {

      Button('init array').id('propArrayObject_init').height('5%')
        .onClick((e: ClickEvent) => {
          this.message = [new MyPropObject(4, 'MyPropObject4'),
            new MyPropObject(5, 'MyPropObject5'),
            new MyPropObject(6, 'MyPropObject6')]
        })

      Button('add new one').id('propArrayObject_add').height('5%')
        .onClick((e: ClickEvent) => {
          let lastIndex = this.message.length - 1
          let newId = this.message[lastIndex].id + 1
          this.message.push(new MyPropObject(newId, `MyPropObject${newId}`))
        })

      Button('clear').id('propArrayObject_clear').height('5%')
        .onClick((e: ClickEvent) => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message = [new MyPropObject(0, 'MyPropObject0')]
          }
        })

      Button('delete the first one').id('propArrayObject_delete').height('5%')
        .onClick((e: ClickEvent) => {
          this.message.shift()
        })

      ForEach(Array.from(this.message.entries()), (item: [number, MyPropObject]) => {
        Text(`Item${item[1].id} ${item[1].value} index: ${item[0]}`).fontSize(9).id('propArrayObject_value_' + item[0])
          .height('5%')
        Divider()
      })
    }
    .width('100%')
  }
}

@Entry
@Component
struct PropArrayObject {
  @State message: Array<MyPropObject> = new Array<MyPropObject>(new MyPropObject(1, 'MyPropObject1'),
    new MyPropObject(2, 'MyPropObject2'),
    new MyPropObject(3, 'MyPropObject3'))
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('PropArrayObject', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        PropArrayObjectChild({ message: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}