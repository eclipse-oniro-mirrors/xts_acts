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
struct ContentType2 {

  build() {
    Column({ space: 1 }) {
      Text('ContentType新增API16枚举类型').height('5%')
      TextInput({ placeholder: 'FLIGHT_NUMBER' })
        .id('ContentType_FLIGHT_NUMBER')
        .contentType(ContentType.FLIGHT_NUMBER)
        .height('13%')

      TextInput({ placeholder: 'LICENSE_NUMBER' })
        .id('ContentType_LICENSE_NUMBER')
        .contentType(ContentType.LICENSE_NUMBER)
        .height('13%')

      TextInput({ placeholder: 'LICENSE_FILE_NUMBER' })
        .id('ContentType_LICENSE_FILE_NUMBER')
        .contentType(ContentType.LICENSE_FILE_NUMBER)
        .height('13%')

      TextInput({ placeholder: 'LICENSE_PLATE' })
        .id('ContentType_LICENSE_PLATE')
        .contentType(ContentType.LICENSE_PLATE)
        .height('13%')

      TextInput({ placeholder: 'ENGINE_NUMBER' })
        .id('ContentType_ENGINE_NUMBER')
        .contentType(ContentType.ENGINE_NUMBER)
        .height('13%')

      TextInput({ placeholder: 'LICENSE_CHASSIS_NUMBER' })
        .id('ContentType_LICENSE_CHASSIS_NUMBER')
        .contentType(ContentType.LICENSE_CHASSIS_NUMBER)
        .height('13%')

      TextInput({ placeholder: 'UNDEFINED' })
        .id('ContentType_UNDEFINED')
        .contentType(undefined)
        .height('13%')
    }.width('100%')
  }
}