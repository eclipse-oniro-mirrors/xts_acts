/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  FlexAlign,
  Search,
  SearchType
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

const SEARCH_KEY = 'Search_dlg_bind';

@Entry
@Component
struct SearchPage {
  build() {
    Column({ space: 4 } as ColumnOptions) {
      Text('模块 search.d.ets：Search 属性绑定在组件上，测试用 inspector 读取 $attrs')
        .fontSize(13)
        .width('100%')
      Search({ placeholder: 's', value: 'v' })
        .key(SEARCH_KEY)
        .width('100%')
        .type(SearchType.ONE_TIME_CODE)
        .strokeWidth(LengthMetrics.vp(1))
        .strokeColor('#112233')
        .enableAutoSpacing(true)
        .enableSelectedDataDetector(true)
        .onWillAttachIME((_c) => {
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
