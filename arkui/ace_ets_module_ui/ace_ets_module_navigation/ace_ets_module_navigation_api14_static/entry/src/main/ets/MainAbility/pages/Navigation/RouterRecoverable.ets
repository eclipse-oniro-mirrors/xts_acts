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
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,
  NavDestination, FontWeight, ButtonType, NavDestinationMode, LaunchMode, TextInputController, Stack, StackOptions,
  Alignment, NavPathStack, Navigation, RouterPageInfo,
} from '@ohos.arkui.component'
import router from '@ohos.router';

class InnerParams {
  private data3: number[]

  constructor(tuple:number[]) {
    this.data3 = tuple
  }
}
class RouterParams {
  private data1: string
  private data2: InnerParams

  constructor(str:string, tuple:number[]) {
    this.data1 = str
    this.data2 = new InnerParams(tuple)
  }
}
@Entry
@Component
struct RouterRecoverable {
  @State message: string = 'routerPage1';
  @State text1:   string = '这里显示栈信息'
  @State text2:   int | Double|string = 0
  controller: TextInputController = new TextInputController()
  routerPageUpdateCallback(info: RouterPageInfo) {
    if(info){
       console.log(`testTag routerPageUpdateCallback, index: ${info.index}, name: ${info.name}, path: ${info.path}, state: ${info.state}, pageId: ${info.pageId}`);
    }
  }

  build() {
    Column({ space: '20vp' } as ColumnOptions) {
      Button('routerPage2_recoverable=true', { stateEffect: true, type: ButtonType.Capsule })
        .id('routerBtnId1')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'MainAbility/pages/Navigation/RouterPage2',
            params: new RouterParams('message' ,[123,456,789]),
            recoverable:true
          })
        })
      Button('routerPage2_recoverable=false', { stateEffect: true, type: ButtonType.Capsule })
        .id('routerBtnId2')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 } as Margin)
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'MainAbility/pages/Navigation/RouterPage2',
            params: new RouterParams('message' ,[123,456,789]),
            recoverable:false
          })
        })
    }
    .height('100%')
    .width('100%')
    .margin({top: '20vp'} as Margin)
  }
}