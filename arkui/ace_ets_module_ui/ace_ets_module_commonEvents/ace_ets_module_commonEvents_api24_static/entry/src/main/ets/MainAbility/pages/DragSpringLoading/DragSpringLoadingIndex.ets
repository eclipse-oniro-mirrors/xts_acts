'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Column, Text, Component, Entry, FlexAlign, DragEvent, DragItemInfo } from '@ohos.arkui.component';
import dragController from '@ohos.arkui.dragController';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import { DragSpringLoadingTestBridge, SpringLoadingContextForBridge } from '../../common/DragSpringLoadingTestBridge';

@Entry
@Component
struct DragSpringLoadingIndex {
  build() {
    Column() {
      Text('spring probe drag source')
        .fontSize(16)
        .margin({ bottom: 24 })
        .id('springDragSource')
        .key('springDragSource')
        .draggable(true)
        .onDragStart((event: DragEvent): DragItemInfo => {
          DragSpringLoadingTestBridge.recordDragStart();
          let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', 'spring-loading-probe');
          let ud = new unifiedDataChannel.UnifiedData(record);
          event.setData(ud);
          let out: DragItemInfo = {};
          return out;
        });
      Text('SpringLoadingContext test host')
        .fontSize(22)
        .key('dragSpringLoadingHost')
        .id('dragSpringLoadingHost')
        .allowDrop(['general.plain-text'])
        .onDragSpringLoading((ctx: dragController.SpringLoadingContext) => {
          DragSpringLoadingTestBridge.onSpringLoading(ctx as SpringLoadingContextForBridge);
        }, {
          stillTimeLimit: 400,
          updateInterval: 100,
          updateNotifyCount: 2,
          updateToFinishInterval: 100,
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
