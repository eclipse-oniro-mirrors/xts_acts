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
struct SearchKeyboardAppearance {

  build() {
    Column({ space: 1 }) {
      Text('Search:KeyboardAppearance新增枚举值').height('8%')
      Search({ placeholder: 'NONE_IMMERSIVE' })
        .id('Search_KeyboardAppearance_NONE_IMMERSIVE')
        .keyboardAppearance(KeyboardAppearance.NONE_IMMERSIVE)
        .height('15%')

      Search({ placeholder: 'IMMERSIVE' })
        .id('Search_KeyboardAppearance_IMMERSIVE')
        .keyboardAppearance(KeyboardAppearance.IMMERSIVE)
        .height('15%')

      Search({ placeholder: 'LIGHT_IMMERSIVE' })
        .id('Search_KeyboardAppearance_LIGHT_IMMERSIVE')
        .keyboardAppearance(KeyboardAppearance.LIGHT_IMMERSIVE)
        .height('15%')

      Search({ placeholder: 'DARK_IMMERSIVE' })
        .id('Search_KeyboardAppearance_DARK_IMMERSIVE')
        .keyboardAppearance(KeyboardAppearance.DARK_IMMERSIVE)
        .height('15%')

      Search({ placeholder: 'DEFAULT' })
        .id('Search_KeyboardAppearance_DEFAULT')
        .height('15%')

      Search({ placeholder: 'UNDEFINED' })
        .id('Search_KeyboardAppearance_UNDEFINED')
        .keyboardAppearance(undefined)
        .height('15%')
    }.width('100%')
  }
}