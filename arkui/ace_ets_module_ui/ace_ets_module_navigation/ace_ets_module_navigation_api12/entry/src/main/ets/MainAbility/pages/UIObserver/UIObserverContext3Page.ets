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

AppStorage.setOrCreate('UIObserverContext3Page_callBackFuncOnCount', 0)
AppStorage.setOrCreate('UIObserverContext3Page_callBackFuncOnCount_2', 0)

@Component
struct PageOne {
  build() {
    NavDestination() {
      Text('pageOne')
    }.title('pageOne')
  }
}

function callBackFunc(info: uiObserver.NavDestinationSwitchInfo) {
  console.info(`testTag navDestinationSwitch from: ${JSON.stringify(info.from)} to: ${JSON.stringify(info.to)}`)
  let count: number | undefined = AppStorage.get('UIObserverContext3Page_callBackFuncOnCount');
  count = Number(count) + 1;
  AppStorage.setOrCreate('UIObserverContext3Page_callBackFuncOnCount', count)
}


@Entry
@Component
struct UIObserverContext3Page {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  PageBuilder(name: string) {
    PageOne()
  }

  aboutToAppear() {
    let obs = this.getUIContext().getUIObserver();
    obs.on('navDestinationSwitch', { navigationId: 'myNavId' }, callBackFunc)
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick(() => {
          this.stack.pushPath({name: 'pageOne'});
        })
          .id('UIObserverContext3_btn_push')
        Button('off observer').onClick(() => {
          let obs = this.getUIContext().getUIObserver();
          obs.off('navDestinationSwitch', { navigationId: 'myNavId' }, callBackFunc)

          console.info(`get UIObserverContext3Page_callBackFuncOnCount is: ${AppStorage.get('UIObserverContext3Page_callBackFuncOnCount')}`)
          console.info(`get UIObserverContext3Page_callBackFuncOnCount_2 is: ${AppStorage.get('UIObserverContext3Page_callBackFuncOnCount_2')}`)
          AppStorage.setOrCreate('UIObserverContext3Page_callBackFuncOnCount_2', AppStorage.get('UIObserverContext3Page_callBackFuncOnCount'))
          console.info(`set UIObserverContext3Page_callBackFuncOnCount_2 is: ${AppStorage.get('UIObserverContext3Page_callBackFuncOnCount')}`)
        })
          .id('UIObserverContext3_btn_off')
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