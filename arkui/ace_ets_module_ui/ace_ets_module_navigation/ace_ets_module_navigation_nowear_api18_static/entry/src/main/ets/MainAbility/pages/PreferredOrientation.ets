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

import { Entry, Column,Builder, Component, Stack,Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, NavPathStack, ColumnOptions,Alignment,Color,
  NavDestination, Navigation, NavDestinationContext, ColumnOptions, LayoutSafeAreaType, LayoutSafeAreaEdge,NavPathInfo} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State, Provide, Consume } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import display from '@ohos.display';

@Component
struct PortraitPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'} as ColumnOptions) {
          Button('push LANDSCAPE page').onClick((e:ClickEvent) => {
            this.stack?.pushPath(new NavPathInfo('landscape',null))
          })
            .id('landscapeId').margin({bottom: '10vp'} as Margin)
          Button('getPortraitPage').onClick((e:ClickEvent) => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getPortraitPage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate<number>('testOrientation', displayClass!.orientation as number);
          }).id('getPortraitPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PortraitPage')
    .preferredOrientation(window.Orientation.PORTRAIT) // 竖屏方向
    .enableStatusBar(true) // 显示状态栏
    .enableNavigationIndicator(true) // 显示导航条
    .backgroundColor('#ffbaece9')
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct LandscapePage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}  as ColumnOptions) {
          Button('push UnspecifiedPage page').onClick((e:ClickEvent) => {
            this.stack?.pushPath(new NavPathInfo('UNSPECIFIED',null))
          })
            .id('unspecifiedId')
          Button('getLandscapePage').onClick((e:ClickEvent) => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getLandscapePage displayClass is ', displayClass!.orientation)
            AppStorage.setOrCreate<number>('testOrientation', displayClass!.orientation as number);
          }).id('getLandscapePage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('LandscapePage')
    .preferredOrientation(window.Orientation.LANDSCAPE) // 横屏方向
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct UnspecifiedPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}  as ColumnOptions) {
          Button('push PORTRAIT_INVERTED page').onClick((e:ClickEvent) => {
            this.stack?.pushPath(new NavPathInfo('PORTRAIT_INVERTED',null))
          })
            .id('portraitInvertedId')
          Button('getUnspecifiedPage').onClick((e:ClickEvent) => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            AppStorage.setOrCreate<number>('testOrientation', displayClass!.orientation as number);
          }).id('getUnspecifiedPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('UnspecifiedPage')
    .preferredOrientation(window.Orientation.UNSPECIFIED)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct PortraitInvertedPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'}  as ColumnOptions) {
          Button('push LANDSCAPE_INVERTED page').onClick((e:ClickEvent) => {
            this.stack?.pushPath(new NavPathInfo('LANDSCAPE_INVERTED',null))
          })
            .id('lanscapeInvertedId')
          Button('getPortraitInvertedPage').onClick((e:ClickEvent) => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getPortraitInvertedPage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate<number>('testOrientation', displayClass!.orientation as number);
          }).id('getPortraitInvertedPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PortraitInvertedPage')
    .preferredOrientation(window.Orientation.PORTRAIT_INVERTED)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct LandscapInvertedPage {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column({space: '10vp'} as ColumnOptions) {
          Button('push PORTRAIT page').onClick((e:ClickEvent) => {
            this.stack?.pushPath(new NavPathInfo('portrait',null))
          })
            .id('portraitId')
          Button('getLandscapInvertedPage').onClick((e:ClickEvent) => {
            let displayClass: display.Display | null = null;
            displayClass = display.getDefaultDisplaySync();
            console.log('getLandscapInvertedPage displayClass is ', displayClass?.orientation)
            AppStorage.setOrCreate<number>('testOrientation', displayClass!.orientation as number);
          }).id('getLandscapInvertedPage')
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('LandscapInvertedPage')
    .preferredOrientation(window.Orientation.LANDSCAPE_INVERTED)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Entry
@Component
struct PreferredOrientation {
  private stack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    console.log("========================================== stack.pushPath")
    this.stack.pushPath(new NavPathInfo('portrait',null))
    console.log("========================================== stack.pushPath end")
  }

  @Builder
  MyPageMap(name: string) {
    if (name === 'portrait') {
      PortraitPage()
    } else if (name === 'landscape') {
      LandscapePage()
    } else if (name === 'UNSPECIFIED') {
      UnspecifiedPage()
    } else if (name === 'PORTRAIT_INVERTED') {
      PortraitInvertedPage()
    } else if (name === 'LANDSCAPE_INVERTED') {
      LandscapInvertedPage()
    }
  }

  build() {
    Navigation(this.stack) {
    }
    .width('100%')
    .height('100%')
    .hideNavBar(true)
    .navDestination(this.MyPageMap)
  }
}