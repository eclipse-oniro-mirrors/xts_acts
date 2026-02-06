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
import { JSON } from '@kit.ArkTS'

class ClassParam0010 {
  private _name: string

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  constructor(name: string) {
    this._name = name
  }
}

@ComponentV2
struct ChildParam0010 {
  @Param readonly num: number = 0
  @Param readonly dataClass: ClassParam0010 = new ClassParam0010('')
  @Param readonly dataClassAll: ClassParam0010 = new ClassParam0010('')
  @Param readonly dataArr: string[] = []
  @Param readonly strArr: Array<string> = new Array()
  @Param readonly strSet: Set<string> = new Set()
  @Param readonly strMap: Map<string, string> = new Map()

  build() {
    Column() {
      Text(this.dataClass.name)
        .id('tvChildParam001011')
        .height('5%')
        .fontSize(9)
      Text(this.dataClassAll.name)
        .id('tvChildParam001012')
        .height('5%')
        .fontSize(9)
      Text(this.dataArr[0])
        .id('tvChildParam00102')
        .height('5%')
        .fontSize(9)
      Text(this.strArr[0])
        .id('tvChildParam00103')
        .fontSize(9)
        .height('5%')
      Text(Array.from(this.strSet).toString())
        .id('tvChildParam00104')
        .fontSize(9)
        .height('5%')
      Text(this.strMap.get('key0'))
        .id('tvChildParam00105')
        .fontSize(9)
        .height('5%')
      Text(this.num.toString())
        .id('tvChildParam00106')
        .fontSize(9)
        .height('5%')
    }
  }
}

@Entry
@ComponentV2
struct Param0010 {
  @Local num: number = 10
  @Local dataClass: ClassParam0010 = new ClassParam0010('Tom')
  @Local dataClassAll: ClassParam0010 = new ClassParam0010('Tom')
  @Local dataArr: string[] = ['red', 'green', 'yellow']
  @Local strArr: Array<string> = new Array()
  @Local strSet: Set<string> = new Set()
  @Local strMap: Map<string, string> = new Map()

  aboutToAppear(): void {
    for (let index = 0; index < 3; index++) {
      this.strArr.push('item' + index)
      this.strSet.add('item' + index)
      this.strMap.set('key' + index, 'item' + index)
    }
  }

  build() {
    Column() {
      Button('Change')
        .id('btnParam0010')
        .onClick(()=>{
          this.dataClass.name = 'Jerry'
          this.dataClassAll = new ClassParam0010('Jerry')
          this.dataArr[0] = 'gray'
          this.strArr.splice(0, 0, 'Hello')
          this.strSet.clear()
          this.strSet.add('Hello')
          this.strMap.set('key0', 'Hello')
          this.num = 100
        })
      ChildParam0010({
        num: this.num,
        dataClass: this.dataClass,
        dataClassAll: this.dataClassAll,
        dataArr: this.dataArr,
        strArr: this.strArr,
        strMap: this.strMap,
        strSet: this.strSet
      })
    }
  }
}