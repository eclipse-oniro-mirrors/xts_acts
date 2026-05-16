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

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  List,
  ListOptions,
  ListItem,
  Entry,
  Component,
  ScrollSnapAnimationSpeed,
  FocusWrapMode,
  ScrollState,
} from '@ohos.arkui.component';
import { typeNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[ListScrollApi]';

@Entry
@Component
struct ListScrollApi {
  @State listSnapSpeed: ScrollSnapAnimationSpeed = ScrollSnapAnimationSpeed.NORMAL;

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('list ListAttribute + UIListEvent')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('listApi_title');
      Button('wire getListEvent')
        .id('listApi_wire')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          this.wireList(this.getUIContext());
        });
      Button('toggle scrollSnap NORMAL/SLOW')
        .id('listApi_toggleSnap')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          this.listSnapSpeed = this.listSnapSpeed === ScrollSnapAnimationSpeed.NORMAL
            ? ScrollSnapAnimationSpeed.SLOW
            : ScrollSnapAnimationSpeed.NORMAL;
          AppStorage.setOrCreate<boolean>(
            'listApi_snap_slow',
            this.listSnapSpeed === ScrollSnapAnimationSpeed.SLOW,
          );
        });
      List({ space: 2 } as ListOptions) {
        ListItem() {
          Text('row').fontSize(9).height('5%');
        }
      }
      .focusWrapMode(FocusWrapMode.WRAP_WITH_ARROW)
      .syncLoad(true)
      .scrollSnapAnimationSpeed(this.listSnapSpeed)
      .height('18%')
      .width('100%')
      .id('listApi_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }

  private wireList(ctx: UIContext): void {
    try {
      const n = ctx.getFrameNodeById('listApi_body');
      if (n) {
        const ev = typeNode.getListEvent(n);
        ev?.setOnWillScroll(() => {});
        ev?.setOnDidScroll(() => {});
        ev?.setOnScrollIndex(() => {});
        ev?.setOnScrollVisibleContentChange(() => {});
        ev?.setOnReachStart(() => {});
        ev?.setOnReachEnd(() => {});
        ev?.setOnScrollStart(() => {});
        ev?.setOnScrollStop(() => {});
        ev?.setOnScrollFrameBegin((offset: number, _state: ScrollState) => {
          return { offsetRemain: offset };
        });
      }
      AppStorage.setOrCreate<boolean>('listApi_wire', true);
    } catch (e) {
      console.error(`${LOG_TAG} ${e}`);
      AppStorage.setOrCreate<boolean>('listApi_wire', false);
    }
  }
}
