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
class MyProvideObject {
  public id: number = 1
  public value: string = ''

  constructor(id: number, value: string) {
    this.id = id
    this.value = value
  }
}

@Component
struct ConsumeArrayObjectChild {
  @Consume message: Array<MyProvideObject>

  build() {
    Column() {

      Button('Consume init array').id('consumeArrayObject_init').height('5%')
        .onClick((e: ClickEvent) => {
          this.message = [
            new MyProvideObject(1, 'MyProvideObject1'),
            new MyProvideObject(2, 'MyProvideObject2'),
            new MyProvideObject(3, 'MyProvideObject3')
          ]
        })

      Button('Consume add new one').id('consumeArrayObject_add').height('5%')
        .onClick((e: ClickEvent) => {
          let lastIndex = this.message.length - 1
          let newId = this.message[lastIndex].id + 1
          this.message.push(new MyProvideObject(newId, `MyProvideObject${newId}`))
        })

      Button('Consume clear').id('consumeArrayObject_clear').height('5%')
        .onClick((e: ClickEvent) => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message.push(new MyProvideObject(0, 'MyProvideObject0'))
          }
        })

      Button('Consume replace').id('consumeArrayObject_replace').height('5%')
        .onClick((e: ClickEvent) => {
          if (this.message.length > 0) {
            this.message[0] = new MyProvideObject(99, 'MyProvideObject99')
          }
        })

      Button('Consume delete last').id('consumeArrayObject_delete').height('5%')
        .onClick((e: ClickEvent) => {
          this.message.pop()
        })

      ForEach(Array.from(this.message.entries()), (item: [number, MyProvideObject]) => {
        Text(`Item ${item[1].id}: ${item[1].value} index: ${item[0]}`).fontSize(9)
          .id('provideArrayObject_value_' + item[0]).height('5%')
        Divider()
      })
    }
  }
}

@Entry
@Component
struct ConsumeArrayObject {
  @Provide message: Array<MyProvideObject> = new Array<MyProvideObject>(new MyProvideObject(1, 'MyProvideObject1'),
  new MyProvideObject(2, 'MyProvideObject2'),
  new MyProvideObject(3, 'MyProvideObject3'))
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ProvideArrayObject', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        Button('Provide init array').id('provideArrayObject_init')
          .height('5%')
          .onClick((e: ClickEvent) => {
            this.message = [
              new MyProvideObject(4, 'MyProvideObject4'),
              new MyProvideObject(5, 'MyProvideObject5'),
              new MyProvideObject(6, 'MyProvideObject6')
            ]
          })
        ConsumeArrayObjectChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}




