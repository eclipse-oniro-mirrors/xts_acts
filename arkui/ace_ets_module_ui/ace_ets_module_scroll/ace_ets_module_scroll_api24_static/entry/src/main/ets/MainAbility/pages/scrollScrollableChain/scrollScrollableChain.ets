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
  Scroll,
  Scroller,
  Entry,
  Component,
  ScrollDirection,
  ScrollState,
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';
import { typeNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const LOG_TAG = '[ScrollChain]';

@Entry
@Component
struct ScrollScrollableChain {
  scroller: Scroller = new Scroller();

  onPageShow(): void {
    try {
      const sz = this.scroller.contentSize();
      AppStorage.setOrCreate<string>('scrollCh_contentSize', `${sz.width}x${sz.height}`);
    } catch (e) {
      console.error(`${LOG_TAG} onPageShow contentSize ${e}`);
      AppStorage.setOrCreate<string>('scrollCh_contentSize', '0x0');
    }
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('common ScrollableCommonMethod + scroll UIScrollEvent')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('scrollCh_title')
        .key('scrollCh_title');
      Button('wire getScrollEvent')
        .id('scrollCh_wire')
        .key('scrollCh_wire')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          this.wireScrollEvent(this.getUIContext());
        });
      Scroll(this.scroller) {
        Column({ space: 2 } as ColumnOptions) {
          Text('inner').fontSize(9).height('5%');
        }
      }
      .scrollBarMargin({ start: LengthMetrics.vp(2), end: LengthMetrics.vp(2) })
      .contentStartOffset(0)
      .contentEndOffset(0)
      .scrollable(ScrollDirection.FREE)
      .maxZoomScale(2)
      .minZoomScale(0.5)
      .zoomScale(1)
      .enableBouncesZoom(true)
      .onDidZoom(() => {})
      .onZoomStart(() => {})
      .onZoomStop(() => {})
      .onWillStartDragging(() => {})
      .onWillStopDragging(() => {})
      .onDidStopDragging(() => {})
      .onWillStartFling(() => {})
      .onDidStopFling(() => {})
      .height('22%')
      .width('100%')
      .id('scrollCh_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }

  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('scrollCh_contentSize', 'pending');
  }

  private wireScrollEvent(ctx: UIContext): void {
    try {
      const n = ctx.getFrameNodeById('scrollCh_body');
      if (n) {
        const ev = typeNode.getScrollEvent(n);
        ev?.setOnWillScroll(() => {});
        ev?.setOnDidScroll(() => {});
        ev?.setOnReachStart(() => {});
        ev?.setOnReachEnd(() => {});
        ev?.setOnScrollStart(() => {});
        ev?.setOnScrollStop(() => {});
        ev?.setOnScrollFrameBegin((offset: number, _state: ScrollState) => {
          return { offsetRemain: offset };
        });
      }
      try {
        this.scroller.scrollTo({
          xOffset: 0,
          yOffset: 0,
          canOverScroll: true,
        });
        AppStorage.setOrCreate<boolean>('scrollCh_canOverScroll_ok', true);
      } catch (e2) {
        console.error(`${LOG_TAG} canOverScroll ${e2}`);
        AppStorage.setOrCreate<boolean>('scrollCh_canOverScroll_ok', false);
      }
      AppStorage.setOrCreate<boolean>('scrollCh_wire', true);
    } catch (e) {
      console.error(`${LOG_TAG} wire ${e}`);
      AppStorage.setOrCreate<boolean>('scrollCh_wire', false);
    }
  }
}
