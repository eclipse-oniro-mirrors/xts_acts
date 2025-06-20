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

class StateClass0090 {
  private _value: string

  public set value(value: string) {
    this._value = value
  }

  public get value(): string {
    return this._value
  }

  constructor(value: string) {
    this._value = value
  }
}

@Component
struct ChildState0060 {
  @State private valueState: string = ''
  
  build() {
    Column() {
      Text(this.valueState)
        .id('tvChildState0060')
      Button('Change Child Value')
        .id('btnChildState0060')
        .onClick(()=>{
          this.valueState = 'ArkUI'
        })
    }
  }
}

@Entry
@Component
struct State0090 {
  @State private classModel: StateClass0090 = new StateClass0090('Hello')
  @State private valueState: string = 'Hello'

  build() {
    Column() {
      Text(this.classModel.value)
        .id('tvState0090')
      Button('Change classModel value')
        .id('btnState0090')
        .onClick(()=>{
          this.classModel.value = 'HelloWorld'
        })
      Text(this.valueState)
        .id('tvState00901')
      ChildState0060({valueState: this.valueState})
    }
  }
}