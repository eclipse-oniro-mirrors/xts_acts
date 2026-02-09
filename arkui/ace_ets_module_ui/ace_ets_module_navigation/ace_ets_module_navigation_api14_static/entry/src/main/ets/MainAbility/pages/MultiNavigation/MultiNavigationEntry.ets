'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog  from '@ohos.hilog';
import { PageDetail1 } from './PageDetail1';
import { PagePlaceholder } from './PagePlaceholder';
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,} from '@ohos.arkui.component'

@Entry
@Component
struct MultiNavigationEntry {
  @Provide({alias: 'pageStack' })
  pageStack: MultiNavPathStack = new MultiNavPathStack();

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
    console.log('++++++++++++++++aboutToAppear1')
    this.pageStack.pushPathByName('PageHome1', 'paramTest', (popInfo) => {  //执行但没有跳转
      hilog.info(0x0000, 'demotest', 'PageHome1 onpop popInfo.result=' + popInfo.result);
    }, false, SplitPolicy.HOME_PAGE);
    console.log('++++++++++++++++aboutToAppear2')
  }

  build() {
    Column() {
      Row() {
        Text('11111111111111111111111111')
        MultiNavigation({ navDestination: this.PageMap, multiStack: this.pageStack })
      }
      .width('100%')
    }
  }
}