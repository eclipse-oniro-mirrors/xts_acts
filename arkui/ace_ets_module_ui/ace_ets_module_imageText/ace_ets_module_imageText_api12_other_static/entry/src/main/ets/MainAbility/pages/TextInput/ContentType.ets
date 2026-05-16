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
  Column,
  Row,
  Text,
  Component,
  Search,
  SymbolGlyph,
  Margin,
  $r,
  ColumnOptions,
  ContentType,
  TextInput
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextInputContentType {
  build() {
    Column({ space: 1 } as ColumnOptions) {
      Text('ContentType新增API12枚举类型').height('5%')
      TextInput({ placeholder: 'USER_NAME' })
        .id('ContentType_USER_NAME')
        .contentType(ContentType.USER_NAME)
        .height('10%')

      TextInput({ placeholder: 'NEW_PASSWORD' })
        .id('ContentType_NEW_PASSWORD')
        .contentType(ContentType.NEW_PASSWORD)
        .height('10%')
    }.width('100%')
  }
}