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
  StorageLink,
  Observed
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
class Observed0060Model {
  value: string =''
  constructor(value: string) {
    this.value = value
  }
}

enum Observed0060Enum {
  A = 'A',
  B = 'B'
}

@Observed
class Observed0060Class {
  id: number = 1
  name: string = ''
  isType: boolean = false
  classA: Observed0060Model = new Observed0060Model('')
  obj: Object = {}
  enumA: Observed0060Enum = Observed0060Enum.A
  arr: string[] = new Array<string>()
  map: Map<string, string> = new Map<string, string>()
  set: Set<number> = new Set<number>()
  date: Date = new Date()
  und: undefined = undefined
  nu: null = null

  constructor(id: number, name: string, isType: boolean, classA: Observed0060Model, obj: Object,
    enumA: Observed0060Enum, arr: string[], map: Map<string, string>, set: Set<number>, date: Date, und: undefined,
    nu: null) {
    this.id = id
    this.name = name
    this.isType = isType
    this.classA = classA
    this.obj = obj
    this.enumA = enumA
    this.arr = arr
    this.map = map
    this.set = set
    this.date = date
    this.nu = nu
  }

}

@Entry
@Component
struct Observed0060 {
  map: Map<string, string> = new Map<string, string>()
  @State classA: Observed0060Class = new Observed0060Class(0, 'Tom', false, new Observed0060Model('Hello'), 0,
    Observed0060Enum.A, ['a', 'b'], this.map, new Set<number>([0, 0, 0]), new Date('2024/01/02 03:00:00'), undefined, null)

  aboutToAppear(): void {
    this.map.set('key', 'value')
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('Observed0060', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text(String(this.classA.id)).id('tvObserved0060ID')
      Text(String(this.classA.name)).id('tvObserved0060String')
      Text(String(this.classA.isType)).id('tvObserved0060Boolean')
      Text(String(this.classA.classA.value)).id('tvObserved0060Class')
      Text(String(this.classA.obj)).id('tvObserved0060Obj')
      Text(String(this.classA.enumA)).id('tvObserved0060Enum')
      Text(String(this.classA.arr[0])).id('tvObserved0060Array')
      Text(this.classA.map.get('key')).id('tvObserved0060Map')
      Text(String(Array.from(this.classA.set))).id('tvObserved0060Set')
      Text(String(this.classA.date)).id('tvObserved0060Date')
      Text(JSON.stringify(this.classA.nu)).id('tvObserved0060Null')
    }
  }
}