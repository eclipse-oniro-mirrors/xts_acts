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
  ButtonType
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
  LocalStorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const router = AppStorage.get<Router>("router") as Router
AppStorage.clear()
AppStorage.setOrCreate<Router>('router', router);
let storage111 = new LocalStorage()


const get_storage111 = (): LocalStorage => storage111

@Entry({ storage: 'get_storage111' })
@Component
struct LocalStoagePropFour {
  @LocalStoragePropRef('PropA') storProp1: number = 1
  @State vae: string = storage111.get<number>('PropA') + ""
     
  build(){
    Column(){

      Text(`localstorage:${this.vae},storProp1:${this.storProp1}`)
        .key('text_getValue3').height('5%')

      Button(`点击动态更改本地初始值`).onClick(():void=>{
        this.storProp1 += 10
        this.vae = storage111.get<number>('PropA') + ""
      }).key('button_changeInitialValue').height('5%')

      Button(`点击更改localstorage值`).onClick(():void=>{
        storage111.set<number>('PropA', 666)
        this.vae = storage111.get<number>('PropA') + ""
      }).key('button_changeLocalStorageValue').height('5%')

      ChildComp({storProp1:this.storProp1,storProp2:this.storProp1,storProp3:this.storProp1,num:this.storProp1})

    }
  }
}

@Component
struct ChildComp {
  @State storProp1 : number = 0
  @Link storProp2 : number
  @PropRef storProp3 : number = 0
  @Provide num : number = 0
  build() {
    Column(){
      Text(`State:${this.storProp1},Link:${this.storProp2},PropRef:${this.storProp3},Provide:${this.num}`)
        .key('text_state').height('5%')
    }
  }
}