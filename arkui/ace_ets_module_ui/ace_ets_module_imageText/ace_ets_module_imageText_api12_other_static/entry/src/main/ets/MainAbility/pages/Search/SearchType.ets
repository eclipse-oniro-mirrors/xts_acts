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
import { Entry, Column, Component, Search, SearchType } from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';


@Entry
@Component
struct SearchTypeExample {
  build() {
    Column() {
      Search({
        value: 'SearchType.NUMBER_DECIMAL',
        placeholder: 'input your word...',
      })
        .id('SearchType_NUMBER_DECIMAL')
        .type(SearchType.NUMBER_DECIMAL)
        .height('5%')

      Search({
        value: 'SearchType.URL',
        placeholder: 'input your word...',
      })
        .id('SearchType_URL')
        .type(SearchType.URL)
        .height('5%')

      Search({
        value: 'SearchType: default',
        placeholder: 'input your word...',
      })
        .id('SearchType_default')
        .height('5%')

      Search({
        value: 'SearchType: undefined',
        placeholder: 'input your word...',
      })
        .id('SearchType_undefined')
        .type(undefined)
        .height('5%')
    }.height('100%')
  }
}