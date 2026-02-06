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

import { Entry, Component, Column, Search, SearchType, ColumnOptions } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SearchTypeExample1 {

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Search({
        value: 'SearchType.NORMAL',
        placeholder: 'input your word...',
      })
        .id('SearchType_NORMAL')
        .type(SearchType.NORMAL)
        .height('5%')

      Search({
        value: 'SearchType.NUMBER',
        placeholder: 'input your word...',
      })
        .id('SearchType_NUMBER')
        .type(SearchType.NUMBER)
        .height('5%')

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
    }.height('100%')
  }
}