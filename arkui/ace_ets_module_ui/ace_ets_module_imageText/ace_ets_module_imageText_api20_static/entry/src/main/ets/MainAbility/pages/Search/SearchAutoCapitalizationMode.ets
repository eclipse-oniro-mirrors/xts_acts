'use static';
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
import {
  Entry,
  Component,
  $r,
  Text,
  Row,
  Column,
  Color,
  Search,
  ClickEvent,
  ColumnOptions,
  AutoCapitalizationMode,
} from '@ohos.arkui.component';
import {
  State,
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchAutoCapitalizationMode {

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Search({
        value: 'AutoCapitalizationMode.NONE',
      })
        .id('Search_AutoCapitalizationMode_NONE')
        .autoCapitalizationMode(AutoCapitalizationMode.NONE)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode.WORDS',
      })
        .id('Search_AutoCapitalizationMode_WORDS')
        .autoCapitalizationMode(AutoCapitalizationMode.WORDS)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode.SENTENCES',
      })
        .id('Search_AutoCapitalizationMode_SENTENCES')
        .autoCapitalizationMode(AutoCapitalizationMode.SENTENCES)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode.ALL_CHARACTERS',
      })
        .id('Search_AutoCapitalizationMode_ALL_CHARACTERS')
        .autoCapitalizationMode(AutoCapitalizationMode.ALL_CHARACTERS)
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode: default',
      })
        .id('Search_AutoCapitalizationMode_default')
        .height('5%')

      Search({
        value: 'AutoCapitalizationMode: undefined',
      })
        .id('Search_AutoCapitalizationMode_undefined')
        .autoCapitalizationMode(undefined)
        .height('5%')

      Search({
        value:'AutoCapitalizationMode: 0',
      })
        .id('Search_AutoCapitalizationMode_0')
        .height('5%')
        .autoCapitalizationMode(AutoCapitalizationMode.NONE)
    }.height('100%')
  }
}