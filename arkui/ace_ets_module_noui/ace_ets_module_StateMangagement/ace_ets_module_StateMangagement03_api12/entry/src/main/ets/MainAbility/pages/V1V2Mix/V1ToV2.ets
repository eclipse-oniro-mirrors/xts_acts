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

@Component
struct v1 {
  @Consume consumeNullValue: null

  build() {
    Column() {
      V1ToV2ComponentCorrect_TestV2Child({
        consumeNullValue: this.consumeNullValue,
      })
    }
  }
}

@Component
struct test {
  @Link linkBooleanValue: boolean

  build() {
  }
}

@Entry
@Component
struct V1ToV2ComponentCorrect_TestV1Parent {
  @State stateStringValue: string = 'hello v1'
  @Prop propNumberValue: number = 1
  @State linkBooleanValue: boolean = false
  @Provide provideEnumValue: MemberType = MemberType.first
  @Provide consumeNullValue: null = null
  @StorageLink('a') storageLinkUndefinedValue: undefined = undefined
  @StorageProp('b') storagePropStringValue: string = 'hello v1'

  build() {
    Column() {
      test({ linkBooleanValue: this.linkBooleanValue })
      V1ToV2ComponentCorrect_TestV2Child({
        stateStringValue: this.stateStringValue,
        propNumberValue: this.propNumberValue,
        linkBooleanValue: this.linkBooleanValue,
        provideEnumValue: this.provideEnumValue,
        consumeNullValue: this.consumeNullValue,
        storageLinkUndefinedValue: this.storageLinkUndefinedValue,
        storagePropStringValue: this.storagePropStringValue,
      })
    }

  }
}

@ComponentV2
struct V1ToV2ComponentCorrect_TestV2Child {
  @Param stateStringValue: string = 'hello v2'
  @Param propNumberValue: number = 2
  @Param linkBooleanValue: boolean = true
  @Param provideEnumValue: MemberType = MemberType.second
  @Param consumeNullValue: null | string = 'null2'
  @Param storageLinkUndefinedValue: undefined | string = 'v2'
  @Param storagePropStringValue: string = 'hello v2'
  @Event funcValue2: () => string[] = (): string[] => {
    let arr: string[] = [
      this.stateStringValue,
      this.propNumberValue.toString(),
      this.provideEnumValue.toString(),
      JSON.stringify(this.consumeNullValue),
      this.storagePropStringValue,
      `${this.storageLinkUndefinedValue}`]
    return arr
  }

  build() {
    Column() {
      Text(this.stateStringValue).key('state_string_value')
      Text(this.propNumberValue.toString()).key('prop_number_value')
      Text(this.provideEnumValue.toString()).key('provide_enum_value')
      Text(JSON.stringify(this.consumeNullValue)).key('consume_null_value')
      Text(`${this.storageLinkUndefinedValue}`).key('storage_link_undefined_value')
      Text(this.storagePropStringValue).key('storage_prop_string_value')
      Text(`${this.funcValue2()}`).key('func_value2')
      Text(`${this.linkBooleanValue}`).key('link_boolean_value')


    }
  }
}
