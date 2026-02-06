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
  FlexAlign,ComponentV2,TabsController,Tabs,Builder,ResourceColor
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,LocalStorage,AbstractProperty,SubscribedAbstractProperty
} from '@ohos.arkui.stateManagement'

class LocalStorageAbsClass {
  public key: string

  constructor(key: string){
    this.key = key
  }
}

enum LocalStorageAbsEnum {
  PA = 'PA',
  PB = 'PB'
}

let localStorageAbs: LocalStorage = new LocalStorage()
localStorageAbs.setOrCreate<int>('localStorageAbsNum', 35)
localStorageAbs.setOrCreate('localStorageAbsStr', 'value')
localStorageAbs.setOrCreate('localStorageAbsBoo', false)
localStorageAbs.setOrCreate('localStorageAbsObj', 'value')
localStorageAbs.setOrCreate('localStorageAbsClass', new LocalStorageAbsClass('00'))
localStorageAbs.setOrCreate('localStorageAbsEnum', LocalStorageAbsEnum.PA)
localStorageAbs.setOrCreate<number[]>('localStorageAbsArr', [1, 2, 3])
let localStorageAbsMap: Map<string, string> = new Map<string, string>()
localStorageAbsMap.set('key', 'value')
localStorageAbs.setOrCreate('localStorageAbsMap', localStorageAbsMap)
localStorageAbs.setOrCreate('localStorageAbsSet', new Set<number>([0, 0, 0]))
localStorageAbs.setOrCreate('localStorageAbsDate', new Date(2024,1,1,8,30,33))
localStorageAbs.setOrCreate('localStorageAbsNull', null)
localStorageAbs.setOrCreate('localStorageAbsUnd', undefined)

const _get_localstorage_ : () => LocalStorage = () => localStorageAbs

@Entry({ storage: '_get_localstorage_' })
@Component
struct LocalStorageAbs {

  num: AbstractProperty<int> | undefined = localStorageAbs.link<int>('localStorageAbsNum')
  str: AbstractProperty<string> | undefined = localStorageAbs.ref<string>('localStorageAbsStr')
  boo: SubscribedAbstractProperty<boolean> | undefined = localStorageAbs.link<Boolean>('localStorageAbsBoo')
  obj: AbstractProperty<Object>|undefined = localStorageAbs.ref<Object>('localStorageAbsObj')
  classA: SubscribedAbstractProperty<LocalStorageAbsClass> | undefined = localStorageAbs.link<LocalStorageAbsClass>('localStorageAbsClass')
  enumA: AbstractProperty<LocalStorageAbsEnum>|undefined = localStorageAbs.ref<LocalStorageAbsEnum>('localStorageAbsEnum')
  arr: SubscribedAbstractProperty<number[]> | undefined = localStorageAbs.link<number[]>('localStorageAbsArr')
  map: AbstractProperty<Map<string, string>>|undefined = localStorageAbs.ref<Map<string, string>>('localStorageAbsMap')
  set: SubscribedAbstractProperty<Set<number>> | undefined = localStorageAbs.link<Set<number>>('localStorageAbsSet')
  date: AbstractProperty<Date> = localStorageAbs.ref<Date>('localStorageAbsDate')!
  nullA: SubscribedAbstractProperty<null> | undefined = localStorageAbs.link<null>('localStorageAbsNull')
  undefinedA: AbstractProperty<undefined>|undefined = localStorageAbs.ref<undefined>('localStorageAbsUnd')
  notName: AbstractProperty<number> | undefined = localStorageAbs.ref<number>('notPropName')
  hasName: AbstractProperty<int> | undefined = localStorageAbs.ref<int>('localStorageAbsNum')
  setNotRefName: AbstractProperty<number> | undefined = localStorageAbs.setAndRef<number>('notRefName', 44.0)
  setRefName: AbstractProperty<string> | undefined = localStorageAbs.setAndRef<string>('localStorageAbsStr', 'newRefValue')

  build(){
    Column() {
      Text(this.num?.get().toString()).id('tvLocalStorageAbsNum')
      Text(this.str?.get().toString()).id('tvLocalStorageAbsStr')
      Text(this.boo?.get().toString()).id('tvLocalStorageAbsBoo')
      Text(this.obj?.get().toString()).id('tvLocalStorageAbsObj')
      Text(this.classA?.get().key).id('tvLocalStorageAbsClass')
      Text(this.enumA?.get().toString()).id('tvLocalStorageAbsEnum')
      Text(this.arr?.get()[0].toString()).id('tvLocalStorageAbsArr')
      Text(this.map?.get().get('key')?.toString()).id('tvLocalStorageAbsMap')
      Text(Array.from<number>(this.set?.get() as Set<number>).toString()).id('tvLocalStorageAbsSet')
      Text(this.date?.get().toDateString().toString()).id('tvLocalStorageAbsDate')
      Text('Hello,' + JSON.stringify(this.nullA?.get())).id('tvLocalStorageAbsNull')
      Text('Hello,' + JSON.stringify(this.undefinedA?.get())).id('tvLocalStorageAbsUnd')
      Text('Info,' + this.num?.info()).id('tvLocalStorageAbsInfo')
      Text('NotName,' + this.notName?.get().toString()).id('tvLocalStorageAbsNotName')
      Text('HasName,' + this.hasName?.get().toString()).id('tvLocalStorageAbsHasName')
      Text('NotRefName,' + this.setNotRefName?.get().toString()).id('tvLocalStorageAbsNotRefName')
      Text('HasRefName,' + this.setRefName?.get().toString()).id('tvLocalStorageAbsHasRefName')
    }.backgroundColor(Color.Red).height('100%').width('100%')
  }
}
