/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

class Observed0060Model {
  value: string

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
  id: number
  name: string
  isType: boolean
  classA: Observed0060Model
  obj: Object
  enumA: Observed0060Enum
  arr: string[]
  map: Map<string, string>
  set: Set<number>
  date: Date
  und: undefined
  nu: null

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
  map: Map<string, string> = new Map()
  @State classA: Observed0060Class = new Observed0060Class(0, 'Tom', false, new Observed0060Model('Hello'), 0,
    Observed0060Enum.A, ['a', 'b'], this.map, new Set<number>([0, 0, 0]), new Date('2024/01/02 03:00:00'), undefined, null)

  aboutToAppear(): void {
    this.map.set('key', 'value')
  }

  build() {
    Column() {
      Text(this.classA.id.toString()).id('tvObserved0060ID')
      Text(this.classA.name.toString()).id('tvObserved0060String')
      Text(this.classA.isType.toString()).id('tvObserved0060Boolean')
      Text(this.classA.classA.value.toString()).id('tvObserved0060Class')
      Text(this.classA.obj.toString()).id('tvObserved0060Obj')
      Text(this.classA.enumA.toString()).id('tvObserved0060Enum')
      Text(this.classA.arr[0].toString()).id('tvObserved0060Array')
      Text(this.classA.map.get('key')).id('tvObserved0060Map')
      Text(Array.from(this.classA.set).toString()).id('tvObserved0060Set')
      Text(this.classA.date.toString()).id('tvObserved0060Date')
      Text(JSON.stringify(this.classA.nu)).id('tvObserved0060Null')
    }
  }
}