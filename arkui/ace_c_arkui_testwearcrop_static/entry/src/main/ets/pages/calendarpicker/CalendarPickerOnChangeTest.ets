'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { CommonView } from '../componet/CommonView';
import { LibUtil } from '../LibUtil';
import { Entry, Column, ColumnOptions, Component } from '@ohos.arkui.component';
import { Content, NodeContent } from '@ohos.arkui.node';

@Entry
@Component
struct CalendarPickerOnChangeTest {
  PAGE_TAG: string = 'CalendarPickerOnChangeTest';
  private libUtil: LibUtil = new LibUtil();
  rootSlot: Content = new NodeContent() as Content;

  aboutToAppear() {
    console.info("[ui] aboutToAppear start");
    this.libUtil.calendarPickerOnChangeTest(this.rootSlot);
    console.info("[ui] aboutToAppear end");
  }

  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
        rootSlot:this.rootSlot
      })
    }
  }
}
