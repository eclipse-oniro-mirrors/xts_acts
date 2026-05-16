'use static'
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
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search,
  Button, InsertValue, DeleteValue, TextAlign, Font
} from '@ohos.arkui.component';
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
@Entry
@Component
struct SearchOnDidDelete {
  @State isTextFont: boolean = false;
  build() {
    Column() {
      Search()
        .id('isTextFont')
        .width('95%')
        .height('10%')
        .textFont(this.isTextFont ? { size: '10vp', weight: 800 } as Font : undefined)
      Button('change isTextFont').id('isTextFontButton')
        .onClick(() => {
          this.isTextFont = !this.isTextFont;
        })
        .fontSize(20)
        .height('5%')
    }.height('100%').width('100%');
  }
}