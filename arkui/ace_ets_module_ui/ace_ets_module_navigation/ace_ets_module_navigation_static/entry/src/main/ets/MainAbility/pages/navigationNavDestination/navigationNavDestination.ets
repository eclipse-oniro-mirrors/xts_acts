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
  Text,
  Navigation,
  NavPathStack,
  NavDestination,
  NavDestinationContext,
  NavDestinationMode,
  wrapBuilder,
  Entry,
  Component,
  NavigationOperation,
} from '@ohos.arkui.component';
import { ComponentContent } from '@ohos.arkui.node';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Builder
function navSplitPhBuilder() {
  Text('ph').fontSize(8).height('5%');
}

@Entry
@Component
struct NavigationNavDestination {
  navStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.navStack.setInterception({
      interception: (_from, _to, _stack, _operation: NavigationOperation, _animated) => {
      },
    });
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('navigation / NavDestinationContext / NavigationInterception')
        .fontSize(11)
        .width('100%')
        .height('11%')
        .id('navNd_title');
      Navigation(this.navStack) {
        NavDestination() {
          Text('page').fontSize(9).height('6%');
        }
        .onReady((ctx: NavDestinationContext) => {
          const m: NavDestinationMode | undefined = ctx.mode;
          AppStorage.setOrCreate<string>('navNd_mode', `${m}`);
        })
        .title('t');
      }
      .enableVisibilityLifecycleWithContentCover(true)
      .splitPlaceholder(new ComponentContent<Object>(this.getUIContext(), wrapBuilder(navSplitPhBuilder)))
      .height('32%')
      .width('100%')
      .id('navNd_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
