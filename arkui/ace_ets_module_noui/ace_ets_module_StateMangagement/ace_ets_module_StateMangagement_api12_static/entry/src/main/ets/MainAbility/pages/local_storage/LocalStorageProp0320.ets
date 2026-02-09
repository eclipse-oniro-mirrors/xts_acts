'use static';
/**
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
  StorageLink,LocalStorage,LocalStoragePropRef, LocalStoragePropRef
} from '@ohos.arkui.stateManagement'

let storageLink0320:LocalStorage = new LocalStorage()
storageLink0320.setOrCreate('LocalStorageProp0320Set', new Set<number>([0, 0, 0]))
let storageLink0320Map: Map<string, string> = new Map<string, string>()
storageLink0320Map.set('key', 'value')
let para1: Record<string, number> = { 'propA': 47 };
storageLink0320.setOrCreate('LocalStorageProp0320Map', storageLink0320Map)
storageLink0320.setOrCreate('LocalStorageProp0320Date', new Date(2024, 1, 1, 8, 9, 30))
storageLink0320.setOrCreate('LocalStorageProp0320Undefined', undefined)
storageLink0320.setOrCreate('LocalStorageProp0320Null', null)
storageLink0320.setOrCreate('LocalStorageLink0320Array', [0, false, para1])

@Component
struct ChildLocalStorageProp0320 {
  @LocalStoragePropRef('LocalStorageProp0320Set') set: Set<number> = new Set<number>()
  @LocalStoragePropRef('LocalStorageProp0320Map') map: Map<string, string> = new Map<string, string>()
  @LocalStoragePropRef('LocalStorageProp0320Date') date: Date = new Date()
  @LocalStoragePropRef('LocalStorageProp0320Undefined') und: undefined = undefined
  @LocalStoragePropRef('LocalStorageProp0320Null') nul: null = null
  @LocalStoragePropRef('LocalStorageLink0320Array') arr: Array<number | boolean | ESObject> = [] as Array<number | boolean | ESObject>

  build() {
    Column() {
      Text(Array.from(this.set).toString()).id('tv0320ChildSet')
        .fontSize(9)
        .height('3%')
      Text(this.map.get('key')).id('tv0320ChildMap')
        .fontSize(9)
        .height('3%')
      Text(this.date.toString()).id('tv0320ChildDate')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.und).id('tv0320ChildUnd')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.nul).id('tv0320ChildNull')
        .fontSize(9)
        .height('3%')
      Text('Arr' + JSON.stringify(this.arr)).id('tv0320ChildArr')
        .fontSize(9)
        .height('3%')
    }
  }
}


const _get_localstorage_ : () => LocalStorage = () => storageLink0320

@Entry({ storage: '_get_localstorage_' })
@Component
struct LocalStorageProp0320 {
  @LocalStoragePropRef('LocalStorageProp0320Set') set: Set<number> = new Set<number>()
  @LocalStoragePropRef('LocalStorageProp0320Map') map: Map<string, string> = new Map<string, string>()
  @LocalStoragePropRef('LocalStorageProp0320Date') date: Date = new Date()
  @LocalStoragePropRef('LocalStorageProp0320Undefined') und: undefined = undefined
  @LocalStoragePropRef('LocalStorageProp0320Null') nul: null = null
  @LocalStoragePropRef('LocalStorageLink0320Array') arr: Array<number | boolean | Record<string,number>> = [] as Array<number | boolean | Record<string,number>>

  build() {
    Column() {
      Text(Array.from(this.set).toString()).id('tv0320ParentSet')
        .fontSize(9)
        .height('3%')
      Text(this.map.get('key')).id('tv0320ParentMap')
        .fontSize(9)
        .height('3%')
      Text(this.date.toString()).id('tv0320ParentDate')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.und).id('tv0320ParentUnd')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.nul).id('tv0320ParentNull')
        .fontSize(9)
        .height('3%')
      Text('Arr' + JSON.stringify(this.arr)).id('tv0320ParentArr')
        .fontSize(9)
        .height('3%')
      ChildLocalStorageProp0320()
      Button('Change')
        .id('btnLocalStorageProp0320')
        .fontSize(9)
        .height('3%')
        .onClick(():void=>{
          this.set.add(1)
          this.map.set('key', 'newValue')
          this.date.setTime(this.date.getTime() + 1000)
          this.und = undefined
          this.nul = null
          this.arr = [1, true, { 'propB': 48 } as Record<string,number>]
        })
    }
  }
}