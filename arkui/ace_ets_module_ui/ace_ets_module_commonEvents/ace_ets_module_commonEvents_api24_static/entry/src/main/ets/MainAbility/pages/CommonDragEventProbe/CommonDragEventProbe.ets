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

import {
  Column,
  Text,
  Component,
  Entry,
  DragEvent,
  DragItemInfo,
  DataLoadParams,
  FlexAlign,
} from '@ohos.arkui.component';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CommonDragEventProbe {
  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('common_drag_probe', '1');
  }

  build() {
    Column() {
      Text('drag source')
        .fontSize(22)
        .id('commonDragHost')
        .key('commonDragHost')
        .draggable(true)
        .onDragStart((e: DragEvent, _extraInfo?: string): DragItemInfo => {
          AppStorage.setOrCreate<string>('de_get_drag_src', e.getDragSource());
          AppStorage.setOrCreate<string>('de_is_remote', e.isRemote() ? '1' : '0');
          AppStorage.setOrCreate<string>('de_gdx', String(e.getGlobalDisplayX()));
          AppStorage.setOrCreate<string>('de_gdy', String(e.getGlobalDisplayY()));
          let p: DataLoadParams = {
            loadHandler: (_acceptableInfo?: unifiedDataChannel.DataLoadInfo): unifiedDataChannel.UnifiedData | null => {
              return null;
            },
            dataLoadInfo: { recordCount: 9 },
          };
          e.setDataLoadParams(p);
          AppStorage.setOrCreate<string>('de_set_dataload', '1');
          let preview: DragItemInfo = {};
          return preview;
        });
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}
