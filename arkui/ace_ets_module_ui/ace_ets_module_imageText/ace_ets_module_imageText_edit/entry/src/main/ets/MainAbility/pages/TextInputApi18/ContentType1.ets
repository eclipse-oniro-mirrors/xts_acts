/**
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
@Entry
@Component
struct ContentType1 {

  build() {
    Column({ space: 1 }) {
      Text('ContentType新增API16枚举类型').height('5%')
      TextInput({ placeholder: 'PASSPORT_NUMBER' })
        .id('ContentType_PASSPORT_NUMBER')
        .contentType(ContentType.PASSPORT_NUMBER)
        .height('13%')

      TextInput({ placeholder: 'VALIDITY' })
        .id('ContentType_VALIDITY')
        .contentType(ContentType.VALIDITY)
        .height('13%')

      TextInput({ placeholder: 'ISSUE_AT' })
        .id('ContentType_ISSUE_AT')
        .contentType(ContentType.ISSUE_AT)
        .height('13%')

      TextInput({ placeholder: 'ORGANIZATION' })
        .id('ContentType_ORGANIZATION')
        .contentType(ContentType.ORGANIZATION)
        .height('13%')

      TextInput({ placeholder: 'TAX_ID' })
        .id('ContentType_TAX_ID')
        .contentType(ContentType.TAX_ID)
        .height('13%')

      TextInput({ placeholder: 'ADDRESS_CITY_AND_STATE' })
        .id('ContentType_ADDRESS_CITY_AND_STATE')
        .contentType(ContentType.ADDRESS_CITY_AND_STATE)
        .height('13%')

      TextInput({ placeholder: 'DEFAULT' })
        .id('ContentType_DEFAULT')
        .height('13%')
    }.width('100%')
  }
}