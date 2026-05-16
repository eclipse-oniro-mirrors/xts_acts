/**
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
import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';

@Component
export struct TestPageHome {
  @State message: string = 'TestPageHome';
  param: Object = new Object();
  @Consume('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .height('5%')
          .id('MultiNavPathStackPushPath_text_home')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Component
export struct TestPageDetail {
  @State message: string = 'TestPageDetail';
  param: Object = new Object();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .id('MultiNavPathStackPushPath_text_detail')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Component
export struct TestPageFull {
  @State message: string = 'TestPageFull';
  param: Object = new Object();

  build() {
    NavDestination() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .id('MultiNavPathStackPushPath_text_full')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
  }
}

@Entry
@Component
struct MultiNavPathStackPushPath {
  @Provide('pageStack') pageStack: MultiNavPathStack = new MultiNavPathStack();

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'TestPageHome') {
      TestPageHome({ param: param });
    } else if (name === 'TestPageDetail') {
      TestPageDetail({ param: param });
    } else if (name === 'TestPageFull') {
      TestPageFull({ param: param });
    }
  }

  aboutToAppear(): void {
    AppStorage.setOrCreate<MultiNavPathStack>('MultiNavPathStackPushPath', this.pageStack)
  }

  build() {
    Column() {
      Row() {
        Text('首页')
        MultiNavigation({ navDestination: this.PageMap, multiStack: this.pageStack })
          .id('MultiNavPathStackPushPath_MultiNavigation')
      }
      .width('100%')
    }
  }
}
