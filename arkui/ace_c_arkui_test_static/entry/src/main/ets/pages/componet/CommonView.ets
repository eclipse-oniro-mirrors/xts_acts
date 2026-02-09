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
import { NodeContent, typeNode,FrameNode, Content } from '@ohos.arkui.node';
import { State, Watch } from '@ohos.arkui.stateManagement';
import { Entry, Component, Button, Row, ClickEvent, ContentSlot, Column, ColumnOptions } from '@ohos.arkui.component';
import { UIContext, UIInspector } from '@ohos.arkui.UIContext';

@Component
export struct CommonView {
  pageTag: string = '';
  rootSlot: Content = new NodeContent() as Content;
  aboutToDestroy() {
    console.log('onDestroy');
  }

  build() {
    Column() {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          ContentSlot(this.rootSlot)
        }
          .backgroundColor('#FFEEEEEE')
          .width('100%')
          .height('100%')
      }.margin(20)
      .height('100%')
      .width('100%')
    }
    .id(this.pageTag)
    .width('100%')
    .height('100%')
  }
}