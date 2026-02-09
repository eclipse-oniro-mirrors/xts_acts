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
import { UIUtils } from '@ohos.arkui.StateManagement'

class ClassMakeObserved0300 {
}

@ObservedV2
class ClassMakeObserved03001 {
  @Trace
  private _id: number

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
  }

  @Trace
  private _age: number

  public set age(value: number) {
    this._age = value
  }

  public get age(): number {
    return this._age
  }

  constructor(id: number, age: number) {
    this._id = id
    this._age = age
  }
}

class ClassMakeObserved03002 {
  private _id: number

  public set id(value: number) {
    this._id = value
  }

  public get id(): number {
    return this._id
  }

  private _age: number

  public set age(value: number) {
    this._age = value
  }

  public get age(): number {
    return this._age
  }

  private _info: ClassMakeObserved0300 | null

  public set info(value: ClassMakeObserved0300 | null) {
    this._info = value
  }

  public get info(): ClassMakeObserved0300 | null {
    return this._info
  }

  constructor(id: number, age: number, info: ClassMakeObserved0300 | null) {
    this._id = id
    this._age = age
    this._info = info
  }
}

@Entry
@ComponentV2
struct MakeObserved0300 {
  private info: ClassMakeObserved03001 = new ClassMakeObserved03001(1, 10)
  private auto: ClassMakeObserved03002 = UIUtils.makeObserved(new ClassMakeObserved03002(2, 20,
    new ClassMakeObserved0300()))

  build() {
    Column() {
      Text(this.info.id.toString())
        .id('tvMakeObserved03001')
      Text(this.auto.id.toString())
        .id('tvMakeObserved03002')
      Button('Click')
        .id('btnMakeObserved0300')
        .onClick(() => {
          this.info.id++
          this.auto.id++
        })
    }
  }
}