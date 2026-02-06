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

import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
  ColumnOptions,
  ContentSlot,
  Button,
  ClickEvent
} from '@ohos.arkui.component'
import { CommonView } from '../componet/CommonView';
import { Content, NodeContent } from '@ohos.arkui.node';
import { LibUtil } from '../LibUtil'

@Entry
@Component
struct FocuscontrolTest2 {
  PAGE_TAG: string = 'FocuscontrolTest2';
  libUtil: LibUtil = new LibUtil();
  rootSlot: Content = new NodeContent() as Content;

  aboutToAppear() {
    this.libUtil.FocusControlTest_002(this.rootSlot);
  }

  build() {
    Column() {
      Button('test2').onClick((e: ClickEvent) => {
        // focusControl.requestFocus("FocuscontrolTest2")
      }).key("transferKey2")
      CommonView({
        pageTag: this.PAGE_TAG,
        rootSlot:this.rootSlot
      })
    }
  }
}  