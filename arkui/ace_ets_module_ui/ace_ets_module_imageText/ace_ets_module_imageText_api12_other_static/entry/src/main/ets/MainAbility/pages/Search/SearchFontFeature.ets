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
import { Entry, Column, Component, Search } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct SearchFontFeature {
  build() {
    Column() {
      Search({ value: 'fontFeature: on' })
        .id('Search_fontFeature_on')
        .fontFeature("\"ss01\" on")
        .height('5%')

      Search({ value: 'fontFeature: off' })
        .id('Search_fontFeature_off')
        .fontFeature("\"ss01\" off")
        .height('5%')

      Search({ value: 'fontFeature: default' })
        .id('Search_fontFeature_default')
        .height('5%')

      Search({ value: 'fontFeature: undefined' })
        .id('Search_fontFeature_undefined')
        .fontFeature(undefined)
        .height('5%')
    }.width('90%')
  }
}