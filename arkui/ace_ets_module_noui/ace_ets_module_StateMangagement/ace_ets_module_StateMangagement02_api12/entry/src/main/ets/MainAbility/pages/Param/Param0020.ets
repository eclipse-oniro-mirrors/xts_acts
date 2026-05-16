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

class ClassParam0020 {
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
struct ChildParam0020 {
  @Param dataClass: ClassParam0020 = new ClassParam0020('')
  @Param num: number = -1
  @Param str: string = ''
  @Param boo: boolean = false
  @Param obj: Object = false

  build() {
    Column() {
      Text(this.dataClass.name)
        .id('tvChildParam00201')
        .fontSize(9)
      Text(this.num.toString())
        .id('tvChildParam00202')
        .fontSize(9)
      Text(this.str)
        .id('tvChildParam00203')
        .fontSize(9)
      Text(JSON.stringify(this.boo))
        .id('tvChildParam00204')
        .fontSize(9)
      Text(this.obj.toString())
        .id('tvChildParam00205')
        .fontSize(9)
    }
  }
}

@Entry
@ComponentV2
struct Param0020 {
  @Local dataClass: ClassParam0020 = new ClassParam0020('Tom')
  @Local num: number = 10
  @Local str: string = 'Tom'
  @Local boo: boolean = true
  @Local obj: Object = 'Tom'

  build() {
    Row() {
      ChildParam0020({dataClass: this.dataClass, num: this.num, str: this.str, boo: this.boo, obj: this.obj})
    }
  }
}