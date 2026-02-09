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

import { Entry, Column,Builder, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, SymbolGlyphModifier, NavPathStack, Navigation, ColumnOptions,
  NavDestination, Navigation, LaunchMode, NavigationTitleMode, NavPathInfo, NavigationOptions} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State, Provide, Consume } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';



class NavParam  {
  constructor(msg: string) {
    this.msg = msg
  }
  public msg: string = ''
}

@Entry
@Component
struct OnNewParamPage {
  @Provide stack: NavPathStack = new NavPathStack()
  @Provide({alias: 'paramString'}) paramString: string = ''

  @Builder
  pageMap(name: string) {
    if (name === 'aboutToAppear pageOne MOVE_TO_TOP_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'aboutToAppear',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.MOVE_TO_TOP_SINGLETON,
      })
    } else if (name === 'onReady pageOne STANDARD') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.STANDARD,
      })
    } else if (name === 'onReady pageTwo STANDARD') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageTwo',
        targetLaunchMode: LaunchMode.STANDARD,
      })
    } else if (name === 'onReady pageOne MOVE_TO_TOP_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageOne',
        targetLaunchMode: LaunchMode.MOVE_TO_TOP_SINGLETON,
      })
    } else if (name === 'onReady pageTwo POP_TO_SINGLETON') {
      lifeCyclePush({
        pushLifeCycle: 'onReady',
        targetName: 'pageTwo',
        targetLaunchMode: LaunchMode.POP_TO_SINGLETON,
      })
    } else {
      Dest()
    }
  }

  build() {
    Column() {
      Column() {
        Text(this.paramString).id('paramId').height('10%')
      }
      Navigation(this.stack) {
        Button('pushPath pageOne')
          .onClick((e:ClickEvent) => {
            this.stack.pushPath(new NavPathInfo('pageOne',null))
          })
          .id('pushId')
          .height('10%')
      }
      .title('navBar')
      .titleMode(NavigationTitleMode.Mini)
      .navDestination(this.pageMap)
    }
  }
}


@Component
struct lifeCyclePush {
  @Consume stack: NavPathStack
  @State name: string = 'NA'
  pushLifeCycle: string = '__NA__'
  targetName: string = '__NA__'
  targetLaunchMode: LaunchMode = LaunchMode.STANDARD
  @Consume('paramString') paramString: string;

  launchModeToString(launchMode: LaunchMode) {
    if (launchMode === LaunchMode.STANDARD) {
      return 'STANDARD';
    } else if (launchMode === LaunchMode.NEW_INSTANCE) {
      return 'NEW_INSTANCE';
    } else if (launchMode === LaunchMode.POP_TO_SINGLETON) {
      return 'POP_TO_SINGLETON';
    } else if (launchMode === LaunchMode.MOVE_TO_TOP_SINGLETON) {
      return 'MOVE_TO_TOP_SINGLETON';
    } else {
      return 'NA';
    }
  }

  aboutToAppear(): void {
    if (this.pushLifeCycle === 'aboutToAppear' && this.targetName !== '__NA__') {
      this.stack.pushPath(new NavPathInfo(this.targetName, new NavParam('aboutToAppear ' + this.targetName + ' ' + this.launchModeToString(this.targetLaunchMode))), {launchMode: this.targetLaunchMode} as NavigationOptions)
    }
  }

  build() {
    NavDestination() {
      NavBody()
    }
    .onReady((context) => {
      this.name = context.pathInfo.name
    })
    .onNewParam((param: Object|null|undefined):void => {
      this.paramString = (param as NavParam).msg;
      if((param as NavParam).msg != "10"){
        this.paramString = `{"msg":"${(param as NavParam).msg}"}`;
      }

      console.log('TestTag', this.name, 'onNewParam, param: ' + this.paramString)
    })
  }
}

@Component
struct Dest {
  @Consume stack: NavPathStack
  @State name: string = 'NA'
  @Consume paramString: string;

  build() {
    NavDestination() {
      NavBody()
    }
    .onReady((context) => {
      console.log("==============================onReady " + this.paramString)
      this.name = context.pathInfo.name
    })
    .onNewParam((param:  Object|null|undefined):void => {
      this.paramString = (param as NavParam).msg
      if((param as NavParam).msg != "10"){
        this.paramString = `{"msg":"${(param as NavParam).msg}"}`;
      }
      console.log('TestTag', this.name, 'onNewParam, param: ' + this.paramString)
    })
  }
}

@Component
struct NavBody {
  @Consume stack: NavPathStack
  build() {
    Column() {
      Button('STANDARD')
        .onClick((e:ClickEvent) => {
          this.stack.pushPath(new NavPathInfo('pageOne', new NavParam('push pageOne STANDARD')), {launchMode: LaunchMode.STANDARD} as NavigationOptions)
        })
        .id('standardId')
        .height('10%')
      Button('NEW_INSTANCE')
        .onClick((e:ClickEvent) => {
          this.stack.pushPath(new NavPathInfo('pageOne', new NavParam('push pageOne NEW_INSTANCE')), {launchMode: LaunchMode.NEW_INSTANCE} as NavigationOptions)
        })
        .id('instanceId')
        .height('10%')
      Button('MOVE_TO_TOP_SINGLETON')
        .onClick((e:ClickEvent) => {
          this.stack.pushPath(new NavPathInfo('pageOne', new NavParam('MOVE_TO_TOP_SINGLETON')), {launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON} as NavigationOptions)
        })
        .id('moveId')
        .height('10%')
      Button('POP_TO_SINGLETON')
        .onClick((e:ClickEvent) => {
          this.stack.pushDestination(new NavPathInfo('pageOne', new NavParam('10') ), {launchMode: LaunchMode.POP_TO_SINGLETON} as NavigationOptions)
        })
        .id('popId')
        .height('10%')
      }
      .width('100%')
  }
}