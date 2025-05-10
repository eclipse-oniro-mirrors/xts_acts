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
import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct EnableToolBarAdaptation {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State isEnable: boolean = false;
  @State showText: boolean = false;

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne2()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'}) {
        Button('changeEnable').id('changeEnableId').onClick(() => {
         this.isEnable = !this.isEnable
        }).height('10%')
        Button('showText').id('showTextId').onClick(() => {
          this.showText = !this.showText
        }).height('10%')
        Button('push one').id('pushOneId').onClick(() => {
          this.pageInfos.pushPath({name: 'pageOne'})
        }).height('10%')
      }
    }
    .title('Title')
    .titleMode(NavigationTitleMode.Mini)
    .enableToolBarAdaptation(this.isEnable)
    .navDestination(this.pageMap)
    .toolbarConfiguration([
      {value: 'a', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'b', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'c', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'd', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'e', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
    ], {hideItemValue: this.showText})
    .mode(NavigationMode.Stack)
  }
}

@Component
struct PageOne2 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State navShowText: boolean = false;

  build() {
    NavDestination() {
      Button('showText').id('navShowTextId').onClick(() => {
        this.navShowText = !this.navShowText
      }).height('10%')
      Button('pop').id('popId').onClick(() => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageOne')
    .toolbarConfiguration([
      {value: 'a1', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'b2', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'c3', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'd4', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
      {value: 'e5', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))},
    ], {hideItemValue: this.navShowText})
  }
}