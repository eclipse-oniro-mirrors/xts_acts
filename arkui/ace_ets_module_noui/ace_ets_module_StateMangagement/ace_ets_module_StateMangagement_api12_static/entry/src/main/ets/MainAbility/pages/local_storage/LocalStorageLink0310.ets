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
  ComponentV2,
  TabsController,
  Tabs,
  Builder,
  ResourceColor
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  LocalStorage,
  LocalStorageLink
} from '@ohos.arkui.stateManagement'

// 定义明确的对象接口
class PropObject {
  propA?: number;
  propB?: number;
}

let storageLink0310 = new LocalStorage()
storageLink0310.setOrCreate('LocalStorageLink0310Set', new Set<number>([0, 0, 0]))
let storageLink0310Map: Map<string, string> = new Map<string, string>();
storageLink0310Map.set('key', 'value')
let para: PropObject = { 'propA': 47 };
storageLink0310.setOrCreate('LocalStorageLink0310Map', storageLink0310Map)
storageLink0310.setOrCreate('LocalStorageLink0310Date', new Date(2024, 1, 1, 8, 9, 30))
storageLink0310.setOrCreate('LocalStorageLink0310Undefined', undefined)
storageLink0310.setOrCreate('LocalStorageLink0310Null', null)
storageLink0310.setOrCreate('LocalStorageLink0310Array', [0, false, para] as Array<number | boolean | PropObject>)

@Component
struct ChildLocalStorageLink0310 {
  @LocalStorageLink('LocalStorageLink0310Set') set: Set<number> = new Set<number>()
  @LocalStorageLink('LocalStorageLink0310Map') map: Map<string, string> = new Map<string, string>()
  @LocalStorageLink('LocalStorageLink0310Date') date: Date = new Date()
  @LocalStorageLink('LocalStorageLink0310Undefined') und: undefined = undefined
  @LocalStorageLink('LocalStorageLink0310Null') nul: null = null
  @LocalStorageLink('LocalStorageLink0310Array') arr: Array<number | boolean | PropObject> = []

  build() {
    Column() {
      Text(Array.from(this.set).toString()).id('tv0310ChildSet')
        .fontSize(9)
        .height('3%')
      Text(this.map.get('key')).id('tv0310ChildMap')
        .fontSize(9)
        .height('3%')
      Text(this.date.toString()).id('tv0310ChildDate')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.und).id('tv0310ChildUnd')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.nul).id('tv0310ChildNull')
        .fontSize(9)
        .height('3%')
      Text('Arr' + JSON.stringify(this.arr)).id('tv0310ChildArr')
        .fontSize(9)
        .height('3%')
    }
  }
}

const _get_localstorage_ : () => LocalStorage = () => storageLink0310

@Entry({ storage: '_get_localstorage_' })
@Component
struct LocalStorageLink0310 {
  @LocalStorageLink('LocalStorageLink0310Set') set: Set<number> = new Set<number>()
  @LocalStorageLink('LocalStorageLink0310Map') map: Map<string, string> = new Map<string, string>()
  @LocalStorageLink('LocalStorageLink0310Date') date: Date = new Date()
  @LocalStorageLink('LocalStorageLink0310Undefined') und: undefined = undefined
  @LocalStorageLink('LocalStorageLink0310Null') nul: null = null
  @LocalStorageLink('LocalStorageLink0310Array') arr: Array<number | boolean | PropObject> = []

  build() {
    Column() {
      Text(Array.from(this.set).toString()).id('tv0310ParentSet')
        .fontSize(9)
        .height('3%')
      Text(this.map.get('key')).id('tv0310ParentMap')
        .fontSize(9)
        .height('3%')
      Text(this.date.toString()).id('tv0310ParentDate')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.und).id('tv0310ParentUnd')
        .fontSize(9)
        .height('3%')
      Text('Hello' + this.nul).id('tv0310ParentNull')
        .fontSize(9)
        .height('3%')
      Text('Arr' + JSON.stringify(this.arr)).id('tv0310ParentArr')
        .fontSize(9)
        .height('3%')
      ChildLocalStorageLink0310()
      Button('Change')
        .id('btnLocalStorageLink0310')
        .fontSize(9)
        .height('3%')
        .onClick((): void => {
          this.set.add(1)
          this.map.set('key', 'newValue')
          this.date.setTime(this.date.getTime() + 1000)
          this.und = undefined
          this.nul = null
          this.arr = [1, true, { 'propB': 48 } as PropObject]
          console.log("==========================================this.arr " + JSON.stringify(this.arr));
        })
    }
  }
}