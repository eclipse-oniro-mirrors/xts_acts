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

enum ProvideConsume0020Enum {
  PA = 'PA',
  PB = 'PB'
}

class ProvideConsume0020Class {
  age: number = 0
}

@Component
struct ChildProvideConsume0020 {
  @Consume('classValue') classValue: ProvideConsume0020Class
  @Consume('numberValue') numberValue: number
  @Consume('booleanValue') booleanValue: boolean
  @Consume('stringValue') stringValue: string
  @Consume('objectValue') objectValue: Object
  @Consume('arrValue') arrValue: number[]
  @Consume('enumValue') enumValue: ProvideConsume0020Enum

  build() {
    Column() {
      Text(this.classValue.age.toString()).id('tvClass')
      Text(this.numberValue.toString()).id('tvNumber')
      Text(this.booleanValue.toString()).id('tvBoolean')
      Text(this.stringValue).id('tvString')
      Text(this.objectValue.toString()).id('tvObject')
      Text(this.arrValue[0].toString()).id('tvArr')
      Text(this.enumValue).id('tvEnum')
    }
  }
}

@Entry
@Component
struct ProvideConsume0020 {
  @Provide('classValue') classValue: ProvideConsume0020Class = new ProvideConsume0020Class()
  @Provide('numberValue') numberValue: number = 0
  @Provide('booleanValue') booleanValue: boolean = false
  @Provide('stringValue') stringValue: string = 'hello'
  @Provide('objectValue') objectValue: Object = 'hello'
  @Provide('arrValue') arrValue: number[] = [1, 2, 3]
  @Provide('enumValue') enumValue: ProvideConsume0020Enum = ProvideConsume0020Enum.PA

  build() {
    Column() {
      ChildProvideConsume0020()
    }
  }
}