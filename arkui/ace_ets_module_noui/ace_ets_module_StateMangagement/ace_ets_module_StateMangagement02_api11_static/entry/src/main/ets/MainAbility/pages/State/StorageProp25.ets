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
  DatePicker
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
  Environment
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";

AppStorage.clear()
let storage25: LocalStorage = new LocalStorage({"PropA":47} as Record<string, number>)
storage25.setOrCreate<number>('PropB',9)
const get_storage25 = ():LocalStorage => storage25

@Entry({storage: 'get_storage25'})
@Component
struct StorageProp25 {
  @LocalStoragePropRef('PropA') storPropA: number = 1;
  @LocalStoragePropRef('PropB') storPropB: number = 1;

  @State kuA: number = storage25.get<number>('PropA') as number
  @State kuB: number = storage25.get<number>('PropB') as number

  build() {
    Column() {
      Text(`LocalStorage值为${this.kuA}`).key("lseA").height('5%')
      Text(`当前PropA值为${this.storPropA}`).height('5%')
        .key("sPropA")
      Text(`LocalStorage值为${this.kuB}`).key("lseB").height('5%')
      Text(`当前PropB值为${this.storPropB}`).height('5%')
        .key("sPropB")

      Button(`button1`).width('100%').height('5%')
        .key('btn1_sto')
        .onClick((e: ClickEvent) => {
          this.storPropA += 1
          this.kuB = storage25.get<number>('PropA') as number
          this.storPropB += 1
          this.kuB = storage25.get<number>('PropB') as number
        })

      Child125()
      Text(`父组件ProC: ${storage25.get<number>('PropC')}`).fontColor(Color.Green)
        .key("sPropC").height('5%')

    }
  }
}

@Component
struct Child125 {
  @LocalStoragePropRef('PropC') c1: number = 11;
  @State kuC: number = 0;
  build() {
    Column() {
      Text(`LocalStorage值PropB为${this.kuC}`).key("lsePropB").height('5%')
      Text(`子组件当前PropB值为${this.c1}`).height('5%')
        .key("sonPropB")
      Button(`Child1_button1`).width("100%").height('5%')
        .key('Child1_btn1')
        .onClick((e: ClickEvent) => {
          this.c1 += 1

        })
      Button(`点击LocalStorage能修改未被@Entry修饰的属性`).width("100%").height('5%')
        .key('Child1_btn2')
        .onClick((e: ClickEvent) => {
          storage25.set<number>('PropC',123)
          this.kuC = storage25.get<number>('PropC') as number;
        })
      // Text(`兄弟组件PropD${storage.get('PropD')}`).fontColor(Color.Red)
      Child225()
    }
  }
}

@Component
struct Child225 {
  @LocalStoragePropRef('PropD') d1: number = 22;
  @State kuD?: number = storage25.get<number>('PropD');
  build() {
    Column() {
      Text(`子组件PropC: ${storage25.get<number>('PropC')}`).fontColor(Color.Red)
        .key("sonPropC").height('5%')

      // Text(`孩子当前PropD值为${this.d1}LocalStorage值PropD为${this.kuD}`)
      // Button(`Child2_button1`).width("100%")
      //   .key('Child2_button1')
      //   .onClick((e: ClickEvent) => {
      //     this.d1 += 1
      //
      //   })
      // Button(`只有父组件能获取PropD`).width("100%")
      //   .key('Child2_button2')
      //   .onClick(():void => {
      //     storage25.set('PropD',456)
      //     this.kuD = storage25.get('PropD');
      //   })
    }
  }
}