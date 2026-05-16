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

import { Column, ColumnOptions, Button, Text, List, ListItem, Entry, Component } from '@ohos.arkui.component';
import { ListItemSwipeActionManager, ListItemSwipeActionDirection } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[ListSwipe]';

@Entry
@Component
struct ListItemSwipeManager {
  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('listItem ListItemSwipeActionManager')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('listSwipe_title');
      Button('expand/collapse')
        .id('listSwipe_btn')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          this.trySwipe(this.getUIContext());
        });
      List({ space: 2 }) {
          ListItem() {
            Text('item').fontSize(9).height('5%');
          }
        .id('listSwipe_item');
      }
      .height('18%')
      .width('100%')
      .id('listSwipe_list');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }

  private trySwipe(ctx: UIContext): void {
    try {
      const n = ctx.getFrameNodeById('listSwipe_item');
      if (n) {
        ListItemSwipeActionManager.expand(n, ListItemSwipeActionDirection.START);
        ListItemSwipeActionManager.collapse(n);
        ListItemSwipeActionManager.expand(n, ListItemSwipeActionDirection.END);
        ListItemSwipeActionManager.collapse(n);
      }
      AppStorage.setOrCreate<boolean>('listSwipe_ok', true);
    } catch (e) {
      console.info(`${LOG_TAG} ${e}`);
      AppStorage.setOrCreate<boolean>('listSwipe_ok', false);
    }
  }
}
