/*
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
struct ButtonFontWeightNullTest {
  build() {
    Column() {
      Button('fontWeight_null').fontWeight(null).id('button_fontWeight_null')
      Button('fontWeight_undefined').fontWeight(undefined).id('button_fontWeight_undefined')
      Button('fontWeight_string_bold').fontWeight('bold').id('button_fontWeight_string_bold')
      Button('fontWeight_string_normal').fontWeight('normal').id('button_fontWeight_string_normal')
      Button('fontWeight_string_empty').fontWeight('').id('button_fontWeight_string_empty')
    }
  }
}