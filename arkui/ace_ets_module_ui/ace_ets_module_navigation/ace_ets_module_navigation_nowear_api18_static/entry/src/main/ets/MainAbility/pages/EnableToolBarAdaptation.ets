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
  Row, ClickEvent, Margin, ButtonType, NavPathStack, Navigation, ColumnOptions,
  NavDestination, Navigation, Color, NavigationTitleMode, $r, NavigationMode,NavPathInfo} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State, Provide, Consume } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';



@Entry
@Component
struct EnableToolBarAdaptation {
  @Provide({alias:'pageInfos'}) pageInfos: NavPathStack = new NavPathStack()
  @State isEnable: boolean = false;
  @State showText: boolean = false;

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne2()
    }
  }

  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      console.log('[EnableToolBarAdaptation_changeOrientation] clicked')
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  build() {
    Navigation(this.pageInfos) {
        Column({ space: '5vp' } as ColumnOptions) {
          Button('Landscape')
            .fontColor(Color.Black)
            .focusable(true)
            .onClick((e: ClickEvent) => {
              this.changeOrientation(true);
            })
            .id('landscapeId')
            .height('10%')

          Button('Portrait')
            .fontColor(Color.Black)
            .focusable(true)
            .onClick((e: ClickEvent) => {
              this.changeOrientation(false);
            })
            .id('portraitId')
            .height('10%')

          Button('changeEnable').id('changeEnableId').onClick((e: ClickEvent) => {
            this.isEnable = !this.isEnable
          }).height('10%')
          Button('showText').id('showTextId').onClick((e: ClickEvent) => {
            this.showText = !this.showText
          }).height('10%')
          Button('push one').id('pushOneId').onClick((e: ClickEvent) => {
            console.log("======================================== this.pageInfos.pushPath start");
            this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined))
            console.log("======================================== this.pageInfos.pushPath end");
          }).height('10%')
        }
      }
      .title('Title')
      .titleMode(NavigationTitleMode.Mini)
      .enableToolBarAdaptation(this.isEnable)
      .navDestination(this.pageMap)
      .toolbarConfiguration([
        { value: 'a', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
        { value: 'b', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
        { value: 'c', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
        { value: 'd', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
        { value: 'e', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      ], { hideItemValue: this.showText })
      .mode(NavigationMode.Stack)
    }
  }

  @Component
  struct  PageOne2 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State navShowText: boolean = false;

  build() {
    NavDestination() {
      Button('showText').id('navShowTextId').onClick((e: ClickEvent) => {
        this.navShowText = !this.navShowText
      }).height('10%')
      Button('pop').id('popId').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageOne')
    .toolbarConfiguration([
      { value: 'a1', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'b2', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'c3', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'd4', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'e5', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
    ], { hideItemValue: this.navShowText })
  }
}
