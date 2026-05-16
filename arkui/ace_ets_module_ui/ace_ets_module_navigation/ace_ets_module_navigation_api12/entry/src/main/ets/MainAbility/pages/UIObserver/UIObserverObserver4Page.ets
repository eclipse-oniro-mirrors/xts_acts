/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { uiObserver } from '@kit.ArkUI';

AppStorage.setOrCreate('UIObserverObserver4Page_callBackFuncOnCount', 0)

@Component
struct PageOne {
  build() {
    NavDestination() {
      Text('pageOne')
    }.title('pageOne')
  }
}

export function callBackFuncOn(info: uiObserver.NavDestinationSwitchInfo) {
  console.info(`testTag navDestinationSwitchOn from: ${JSON.stringify(info.from)} to: ${JSON.stringify(info.to)}`)
  let count: number | undefined = AppStorage.get('UIObserverObserver4Page_callBackFuncOnCount');
  count = Number(count) + 1;
  AppStorage.setOrCreate('UIObserverObserver4Page_callBackFuncOnCount', count)
}

@Entry
@Component
struct UIObserverObserver4Page {
  private stack: NavPathStack = new NavPathStack();
  @State firstTime:boolean = false
  @Builder
  PageBuilder(name: string) {
    PageOne()
  }

  aboutToAppear() {
    if (this.firstTime == false) {
      uiObserver.on('navDestinationSwitch', this.getUIContext(), { navigationId: 'myNavId' }, callBackFuncOn)
      this.firstTime = true
    }
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick(() => {
          this.stack.pushPath({ name: 'pageOne' });
        })
          .id('UIObserverObserver4_btn_push')
        Button('off observer').onClick(() => {
          uiObserver.off('navDestinationSwitch', this.getUIContext(), { navigationId: 'myNavId' }, callBackFuncOn)
        })
          .id('UIObserverObserver4_btn_off')
      }
      .id('myNavId')
      .title('Navigation')
      .navDestination(this.PageBuilder)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')
  }
}