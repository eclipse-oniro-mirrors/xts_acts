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

enum MemberType {
  first = 1,
  second = 2
}

@Observed
class Str {
  public stringValue4: string = 'hello'

  constructor(stringValue4: string) {
    this.stringValue4 = stringValue4;
  }
}

@ObservedV2
class TestObservedV2 {
  public stringValue3: string = 'world'

  constructor(stringValue3: string) {
    this.stringValue3 = stringValue3;
  }
}

class TestObserved1 {
  public name: string;

  constructor(n: string) {
    this.name = n
  }
}

type newType = Set<number> | Set<string>

@Entry
@ComponentV2
struct V2ToV1ComponentCorrect_TestV2Parent1 {
  stringValue: string = 'helloV2'
  @Param stringValue1: string = 'hello2'
  @Local enumValue1: MemberType = MemberType.second
  @Provider() localValue1: TestObserved1 = new TestObserved1('TestProvider');
  @Consumer() boolValue1: boolean = false
  @Param undefinedValue1: undefined = undefined
  @Param nullValue1: null = null
  setValue: Set<string> = new Set(['v2, v2'])
  mapValue: Map<string, string> = new Map([['v2', 'v2']])
  dateValue: Date = new Date('2024/11/11')
  arrValue: Array<number> = [1, 2]
  @Event funcValue1: Function = (): string => {
    return '0'
  }
  @Event funcValue2: () => string = (): string => {
    return '0'
  }

  build() {
    Column() {
      V2ToV1ComponentCorrect_TestV1child1({
        stringValue1: this.stringValue1,
        enumValue1: this.enumValue1,
        localValue1: this.localValue1,
        boolValue1: this.boolValue1,
        undefinedValue1: this.undefinedValue1,
        nullValue1: this.nullValue1,
        setValue: this.setValue,
        mapValue: this.mapValue,
        dateValue: this.dateValue,
        arrValue: this.arrValue,
        funcValue2: this.funcValue2,
      })
    }
  }
}

@Component
export struct V2ToV1ComponentCorrect_TestV1child1 {
  @State stringValue1: string = 'hello'
  @Prop enumValue1: Set<number> | MemberType = MemberType.first
  @Prop localValue1: TestObserved1 = new TestObserved1('Providerv1')
  @Provide boolValue1: boolean = true
  @Prop undefinedValue1: undefined = undefined
  @Prop nullValue1: null = null
  @BuilderParam funcValue2: () => void
  @State mapValue: Map<string, string> = new Map([['key', 'value']])
  @State dateValue: Date = new Date('2024/07/15')
  @State arrValue: Array<number> = [3, 4]
  @Prop setValue: Set<string> = new Set(['1', '2'])
  @State setValueAlias: newType = new Set<string>()

  aboutToReuse(params: Record<string, string | boolean | null | undefined | Set<string> | Set<number> | MemberType
    | TestObserved1 | Str | Function | Map<string, string> | Date | Array<number> | (() => void)>) {

    this.stringValue1 = params.stringValue1 as string
    this.enumValue1 = params.enumValue1 as MemberType
    this.localValue1 = params.localValue1 as TestObserved1
    this.boolValue1 = params.localValue1 as boolean
    this.undefinedValue1 = params.undefinedValue1 as undefined
    this.nullValue1 = params.nullValue1 as null
    this.setValue = params.setValue as Set<string>
    this.mapValue = params.mapValue as Map<string, string>
    this.dateValue = params.dateValue as Date
    this.arrValue = params.arrValue as Array<number>

    this.funcValue2 = params.funcValue2 as () => void
  }

  build() {
    Column() {
      Text(`v1 stringValue1: ${this.stringValue1}`).key('string_param1')
      Text(`v1 enumValue1: ${this.enumValue1}`).key('enum_value1')
      Text(`v1 localValue1: ${this.localValue1.name}`).key('local_value1')
      Text(`v1 boolValue1: ${this.boolValue1}`).key('bool_value1')
      Text(`v1 undefinedValue1: ${this.undefinedValue1}`).key('undefined_value1')
      Text(`v1 nullValue1: ${this.nullValue1}`).key('null_value1')
      Text(`v1 funcValue2: ${this.funcValue2()}`).key('func_value2')
      Text(`v1 setValue: ${Array.from(this.setValue).toString()}`).key('set_value')
      Text(`v1 mapValue: ${Array.from(this.mapValue).toString()}`).key('map_value')
      Text(`v1 dateValue: ${this.dateValue}`).key('date_value')
      Text(`v1 arrValue: ${this.arrValue}`).key('arr_value')
    }
  }
}


class TestSet {
  public value: Set<string> = new Set()
}

@ComponentV2
struct V2ToV1ComponentCorrect_TestV2Parent2 {
  @Local innerSet: TestSet = new TestSet()

  build() {
    Column() {
      V2ToV1ComponentCorrect_TestV1child2({
        value: this.innerSet.value
      })
    }
  }
}

@Component
struct V2ToV1ComponentCorrect_TestV1child2 {
  @State value: Set<string> = new Set()

  build() {
  }
}
