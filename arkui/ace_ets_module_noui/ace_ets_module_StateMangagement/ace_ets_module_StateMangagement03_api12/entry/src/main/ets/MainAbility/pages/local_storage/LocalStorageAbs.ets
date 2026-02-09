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
localStorageAbs.setOrCreate('localStorageAbsNum', 35)
localStorageAbs.setOrCreate('localStorageAbsStr', 'value')
localStorageAbs.setOrCreate('localStorageAbsBoo', false)
localStorageAbs.setOrCreate('localStorageAbsObj', 'value')
localStorageAbs.setOrCreate('localStorageAbsClass', new LocalStorageAbsClass('00'))
localStorageAbs.setOrCreate('localStorageAbsEnum', LocalStorageAbsEnum.PA)
localStorageAbs.setOrCreate('localStorageAbsArr', [1, 2, 3])
let localStorageAbsMap: Map<string, string> = new Map()
localStorageAbsMap.set('key', 'value')
localStorageAbs.setOrCreate('localStorageAbsMap', localStorageAbsMap)
localStorageAbs.setOrCreate('localStorageAbsSet', new Set<number>([0, 0, 0]))
localStorageAbs.setOrCreate('localStorageAbsDate', new Date(2024,1,1,8,30,33))
localStorageAbs.setOrCreate('localStorageAbsNull', null)
localStorageAbs.setOrCreate('localStorageAbsUnd', undefined)

@Entry(localStorageAbs)
@Component
struct LocalStorageAbs {
  num: AbstractProperty<number> = localStorageAbs.link('localStorageAbsNum')
  str: AbstractProperty<string> = localStorageAbs.prop('localStorageAbsStr')
  boo: AbstractProperty<boolean> = localStorageAbs.link('localStorageAbsBoo')
  obj: AbstractProperty<Object> = localStorageAbs.prop('localStorageAbsObj')
  classA: AbstractProperty<LocalStorageAbsClass> = localStorageAbs.link('localStorageAbsClass')
  enumA: AbstractProperty<LocalStorageAbsEnum> = localStorageAbs.prop('localStorageAbsEnum')
  arr: AbstractProperty<number[]> = localStorageAbs.link('localStorageAbsArr')
  map: AbstractProperty<Map<string, string>> = localStorageAbs.prop('localStorageAbsMap')
  set: AbstractProperty<Set<number>> = localStorageAbs.link('localStorageAbsSet')
  date: AbstractProperty<Date> = localStorageAbs.prop('localStorageAbsDate')
  nullA: AbstractProperty<null> = localStorageAbs.link('localStorageAbsNull')
  undefinedA: AbstractProperty<undefined> = localStorageAbs.prop('localStorageAbsUnd')
  notName: AbstractProperty<number> | undefined = localStorageAbs.ref('notPropName')
  hasName: AbstractProperty<number> | undefined = localStorageAbs.ref('localStorageAbsNum')
  setNotRefName: AbstractProperty<number> | undefined = localStorageAbs.setAndRef('notRefName', 44)
  setRefName: AbstractProperty<string> | undefined = localStorageAbs.setAndRef('localStorageAbsStr', 'newRefValue')

  build(){
    Column() {
      Text(this.num.get().toString()).id('tvLocalStorageAbsNum')
      Text(this.str.get()).id('tvLocalStorageAbsStr')
      Text(this.boo.get().toString()).id('tvLocalStorageAbsBoo')
      Text(this.obj.get().toString()).id('tvLocalStorageAbsObj')
      Text(this.classA.get().key).id('tvLocalStorageAbsClass')
      Text(this.enumA.get().toString()).id('tvLocalStorageAbsEnum')
      Text(this.arr.get()[0].toString()).id('tvLocalStorageAbsArr')
      Text(this.map.get().get('key')?.toString()).id('tvLocalStorageAbsMap')
      Text(Array.from(this.set.get()).toString()).id('tvLocalStorageAbsSet')
      Text(this.date.get().toDateString().toString()).id('tvLocalStorageAbsDate')
      Text('Hello,' + JSON.stringify(this.nullA.get())).id('tvLocalStorageAbsNull')
      Text('Hello,' + JSON.stringify(this.undefinedA.get())).id('tvLocalStorageAbsUnd')
      Text('Info,' + this.num.info()).id('tvLocalStorageAbsInfo')
      Text('NotName,' + this.notName?.get().toString()).id('tvLocalStorageAbsNotName')
      Text('HasName,' + this.hasName?.get().toString()).id('tvLocalStorageAbsHasName')
      Text('NotRefName,' + this.setNotRefName?.get().toString()).id('tvLocalStorageAbsNotRefName')
      Text('HasRefName,' + this.setRefName?.get().toString()).id('tvLocalStorageAbsHasRefName')
    }
  }
}
