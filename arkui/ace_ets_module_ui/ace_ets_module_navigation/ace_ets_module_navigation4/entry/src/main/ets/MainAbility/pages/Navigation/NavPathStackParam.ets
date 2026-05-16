/*
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

import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct NavPathStackParam {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();

  @Builder
  myRouter(name: string, param?: Object) {
    if (name === 'AttributePageOne') {
      AttributePageOne();
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Button('pushPathByName').onClick(() => {
          this.navPathStack.pushPathByName('AttributePageOne', null)
        })
          .id('pushPathByNameId')
          .height('5%')
        Text('HomePage').id('homeTextId')
        Button('异常push pageOne').onClick(() => {
          this.navPathStack.moveIndexToTop(undefined, true)
        })
        Button('push pageOne').onClick(() => {
          this.navPathStack.moveIndexToTop(null, true)
        })
      }
    }
    .titleMode(NavigationTitleMode.Mini)
    .title(null, null)
    .title(undefined, undefined)
    .title('NavigationTitle', { barStyle: BarStyle.STANDARD, enableHoverMode: false })
    .toolbarConfiguration(null, null)
    .toolbarConfiguration(undefined, undefined)
    .toolbarConfiguration(undefined, undefined)
    .toolbarConfiguration(undefined, { barStyle: BarStyle.STANDARD, hideItemValue: true })
    .toolbarConfiguration(undefined, { barStyle: BarStyle.SAFE_AREA_PADDING, hideItemValue: false })
    .navDestination(this.myRouter)
    .hideToolBar(false, true)
    .mode(NavigationMode.Stack)
  }
}

@Component
export struct AttributePageOne {
  @Consume('navPathStack') navPathStack: NavPathStack;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
  private arr1: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  scroller: Scroller = new Scroller()
  scroller1: Scroller = new Scroller()

  build() {
    NavDestination() {
      Row() {
        Scroll(this.scroller) {
          Column({ space: 10 }) {
            Text('PageOne').id('pageOneTextId')
            ForEach(this.arr, (item: number) => {
              if (item == 0) {
                List({ space: 10, scroller: this.scroller1 }) {
                  ForEach(this.arr1, (item1: number) => {
                    ListItem() {
                      Text('Child_item_' + item1).fontSize(16).backgroundColor(Color.Pink).width('90%').height(100)
                    }
                  }, (item1: string) => item1)
                }
                .height('70%')
                .margin({ right: '60%' })
              } else {
                Text('item_' + item).fontSize(16).backgroundColor(Color.Yellow).width('90%').height(100)
              }
            }, (item: string) => item)
          }
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .friction(0.6)
        .edgeEffect(EdgeEffect.Spring)
      }
      .height('100%')
    }
    .title('pageOne', { backgroundColor: Color.Red })
    .bindToNestedScrollable(null)
    .bindToNestedScrollable(undefined)
    .bindToNestedScrollable([])
    .bindToScrollable(null)
    .bindToScrollable(undefined)
    .bindToScrollable([])
    .enableStatusBar(null, false)
    .enableStatusBar(undefined, true)
    .toolbarConfiguration([
      { value: 'a', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'b', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'c', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'd', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
      { value: 'e', symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus')) },
    ])
    .id('navId')
    .margin({ top: '5%' })
  }
}