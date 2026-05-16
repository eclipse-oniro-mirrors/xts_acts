/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@ohos.arkui.advanced.MultiNavigation';
import { PageHome1 } from './PageHome1';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PageDetail1 } from './PageDetail1';
import { PagePlaceholder } from './PagePlaceholder';


@Entry
@Component
struct MultiNavigationEntry {
  @Provide('pageStack')pageStack: MultiNavPathStack = new MultiNavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'PageHome1') {
      PageHome1()
    }else if (name === 'PageDetail1') {
      PageDetail1();
    } else if (name === 'PagePlaceholder') {
      PagePlaceholder();
    }
  }

  aboutToAppear(): void {
    this.pageStack.pushPathByName('PageHome1', 'paramTest', (popInfo) => {
      hilog.info(0x0000, 'demotest', 'PageHome1 onpop popInfo.result=' + popInfo.result);
    }, false, SplitPolicy.HOME_PAGE);
  }

  build() {
    Column() {
      Row() {
        MultiNavigation({ navDestination: this.PageMap, multiStack: this.pageStack })
      }
      .width('100%')
    }
  }
}