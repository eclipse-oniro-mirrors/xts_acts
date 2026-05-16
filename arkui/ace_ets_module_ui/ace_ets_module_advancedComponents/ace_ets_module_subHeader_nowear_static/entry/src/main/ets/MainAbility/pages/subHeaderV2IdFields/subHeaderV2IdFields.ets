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

import { Column, ColumnOptions, Text, Entry, Component, SelectOption } from '@ohos.arkui.component';
import {
  SubHeaderV2,
  SubHeaderV2Title,
  SubHeaderV2Select,
  SubHeaderV2OperationItem,
  SubHeaderV2OperationType,
} from '@ohos.arkui.advanced.SubHeaderV2';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SubHeaderV2IdFields {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('subHdrV2_mounted', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('@ohos.arkui.advanced.SubHeaderV2 id fields')
        .fontSize(11)
        .width('100%')
        .height('8%')
        .id('subHdrV2_title');
      SubHeaderV2({
        title: new SubHeaderV2Title({ primaryTitle: 'V2', id: 'subheaderv2_title_id' }),
        select: new SubHeaderV2Select({
          options: [{ value: 'v1' }, { value: 'v2' }] as SelectOption[],
          id: 'subheaderv2_select_id',
        }),
        operationType: SubHeaderV2OperationType.BUTTON,
        operationItems: [
          new SubHeaderV2OperationItem({ content: 'Go', id: 'subheaderv2_op_id' }),
        ],
      })
        .id('subHdrV2_body')
        .width('100%');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
