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
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
const router = AppStorage.get<Router>("router") as Router
AppStorage.clear()
AppStorage.setOrCreate<Router>('router', router);
AppStorage.setOrCreate<number>('PropA', 47);
AppStorage.setOrCreate<number>('LinkA', 47);
let LocalStorage11 = new LocalStorage();
LocalStorage11.set<number>('PropA',48);

const get_storage11 = (): LocalStorage => LocalStorage11

@Entry({ storage:'get_storage11' })
@Component
struct Storage11 {
  @StorageLink('PropA') storLink: number = 1;
  @LocalStorageLink('PropA') localStorLink: number = 1;
  @State text: string = ''

  build() {
    Column() {

      Text(this.text).key('Storage11Content').height('5%')
      //link给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('Link给定的键值key存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.link<number>('PropA')?.get() + ''
      }).key('Storage11Button1').height('5%')

      //link给定的键值key不存在，返回undefined
      Button('Link给定的键值key不存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.link<number>('PropCABC') + ''
      }).key('Storage11Button2').height('5%')

      //setAndLink给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('SetAndLink key存在').onClick(():void => {
        this.text = AppStorage.setAndLink<number>('PropA',5).get() + ''
      }).key('Storage11Button3').height('5%')

      //setAndLink给定的键值key不存在，初始化新的数据 5
      Button('SetAndLink key不存在').onClick(():void => {
        this.text = AppStorage.setAndLink<number>('PropD',5).get() + ''
      }).key('Storage11Button4').height('5%')

      //prop给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('Prop给定的键值key存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.get<number>('PropA') + ''
      }).key('Storage11Button5').height('5%')

      //prop给定的键值不存在，返回undefined
      Button('Prop给定的键值key不存在').onClick((event: ClickEvent) => {
        this.text = AppStorage.get<number>('PropF') + ''
      }).key('Storage11Button6').height('5%')

      //setAndProp给定的键值key存在，返回对应该键值的属性的双向绑定的数据 47
      Button('SetAndProp key存在').onClick(():void => {
        this.text = AppStorage.setAndLink<number>('PropA',5).get() + ''
      }).key('Storage11Button7').height('5%')

      //setAndProp给定的键值key不存在，初始化新的数据 5
      Button('setAndProp key不存在').onClick(():void => {
        this.text = AppStorage.setAndLink<number>('PropG',5).get() + ''
      }).key('Storage11Button8').height('5%')
    }
  }
}