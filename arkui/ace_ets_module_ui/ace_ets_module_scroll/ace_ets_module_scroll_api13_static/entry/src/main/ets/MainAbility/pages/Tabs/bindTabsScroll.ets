'use static';
/**
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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,BottomTabBarStyle,TextAlign,SubTabBarStyle,
  Text,List,ListItem,BarPosition,Scroll,NestedScrollMode,BarState,EdgeEffect,
  Color,TabsController,Scroller,Tabs,TabContent,ForEach,ScrollDirection,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
@Entry
@Component
struct bindTabsScrollExample {
  private arr: string[] = [] as string[]
  private parentTabsController: TabsController = new TabsController()
  private childTabsController: TabsController = new TabsController()
  private listScroller: Scroller = new Scroller()
  private parentScroller: Scroller = new Scroller()
  private childScroller: Scroller = new Scroller()
  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.arr.push(i.toString())
    }
    let context = this.getUIContext()
    context.bindTabsToScrollable(this.parentTabsController, this.listScroller) //Cannot find method 'bindTabsToScrollable (Larkui/component/tabs/TabsController;Larkui/component/scroll/Scroller;)V' in class '@ohos.arkui.UIContext.UIContext'
    context.bindTabsToScrollable(this.childTabsController, this.listScroller)
    // context.bindTabsToNestedScrollable(this.parentTabsController, this.parentScroller, this.childScroller) //Cannot find method 'bindTabsToNestedScrollable (Larkui/component/tabs/TabsController;Larkui/component/scroll/Scroller;Larkui/component/scroll/Scroller;)V' in class '@ohos.arkui.UIContext.UIContext'
    try {
      let router = context.getRouter();
      AppStorage.setOrCreate<Router>('bindTabsScroll', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  aboutToDisappear(): void {
    let context = this.getUIContext()
    context.unbindTabsFromScrollable(this.parentTabsController, this.listScroller)
    context.unbindTabsFromScrollable(this.childTabsController, this.listScroller)
    context.unbindTabsFromNestedScrollable(this.parentTabsController, this.parentScroller, this.childScroller)
  }

  build() {
    Column(undefined){
      Tabs({ barPosition: BarPosition.End, controller: this.parentTabsController }) {
        TabContent() {
          Tabs({ controller: this.childTabsController }) {
            TabContent() {
              List({ space: 2, initialIndex: 0, scroller: this.listScroller }) {
                ForEach(this.arr, (item: string) => {
                  ListItem() {
                    Text(item)
                      .width('100%')
                      .height(50)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .borderRadius(10)
                      .backgroundColor(Color.Gray)
                  }
                }, (item: string) => item)
              }
              .scrollBar(BarState.Off)
              .width('90%')
              .height('100%')
              .contentStartOffset(20)
              .contentEndOffset(20)
            }.tabBar(SubTabBarStyle.of('Top tab'))
          }
          .width('100%')
          .height('100%')
          .barOverlap(true)
          .clip(true)
        }.tabBar(BottomTabBarStyle.of($r('app.media.icon'), 'scroller'))

        TabContent() {
          Scroll(this.parentScroller) {
            List({ space: 2, initialIndex: 0, scroller: this.childScroller }) {
              ForEach(this.arr, (item: string) => {
                ListItem() {
                  Text(item)
                    .width('100%')
                    .height(100)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .borderRadius(10)
                    .backgroundColor(Color.Gray)
                }
              }, (item: string) => item)
            }
            .scrollBar(BarState.Off)
            .width('90%')
            .height('100%')
            .contentEndOffset(52)
            .nestedScroll({ scrollForward: NestedScrollMode.SELF_FIRST, scrollBackward: NestedScrollMode.SELF_FIRST })
          }
          .width('100%')
          .height('100%')
          .scrollBar(BarState.Off)
          .scrollable(ScrollDirection.Vertical)
          .edgeEffect(EdgeEffect.Spring)
        }.tabBar(BottomTabBarStyle.of($r('app.media.icon'), 'nested_scroller'))
      }
      .id('bind_tabsScroll')
      .width('100%')
      .height('70%')
      .barOverlap(true) // 使TabBar叠加在TabContent上，当TabBar向上或向下隐藏后，原位置处不为空白
      .clip(true) // 对超出Tabs组件范围的子组件进行裁剪，防止TabBar向上或向下隐藏后误触TabBar
    }
    .width('100%')
    .height('100%')

  }
}