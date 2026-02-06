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

import { Entry, Component, Column, Text, Margin, ColumnOptions, ContentSlot } from '@ohos.arkui.component'
import { Content, NodeContent } from '@ohos.arkui.node';
import { LibUtil } from '../LibUtil'
import { State } from '@ohos.arkui.stateManagement'
import { CommonView } from '../componet/CommonView';
import Utils from '../../../src/test/common/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct ScrollNestedScrollTest {
  PAGE_TAG: string = 'ScrollNestedScrollTest';
  @State testType: int = 0;
  libUtil: LibUtil = new LibUtil();
  rootSlot: Content = new NodeContent() as Content;

  aboutToAppear() {
    Utils.registerEvent(this.PAGE_TAG, 6600, (data: Double) => {
      this.libUtil.scrollNestedScrollChangeTestType(data as int);
    })
    this.libUtil.scrollNestedScrollTest(this.rootSlot)
  }

  aboutToDisappear() {
    events_emitter.off(6600)
  }

  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
        rootSlot: this.rootSlot
      })
    }
  }
}
