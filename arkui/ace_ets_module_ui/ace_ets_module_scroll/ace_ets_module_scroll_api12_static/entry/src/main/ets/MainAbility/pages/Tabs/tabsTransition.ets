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
  Column,
  TabsController,
  TabContentTransitionProxy,
  TabContentAnimatedTransition,
  ColumnOptions,
  Margin,
  Text,
  Tabs,
  BarPosition,
  TabContent,
  BarMode,
  Color,
  $r,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct tabsCallBackTransitionExample {
  @State currentIndex: int = 2
  @State message1: string = 'tabs: '
  @State tabContent0Scale: number = 1.0
  @State tabContent1Scale: number = 1.0
  @State tabContent0Opacity: number = 1.0
  @State tabContent1Opacity: number = 1.0
  @State tabContent2Opacity: number = 1.0
  tabsController: TabsController = new TabsController()
  private firstTimeout: int = 3000
  private secondTimeout: int = 5000
  private first2secondDuration: int = 3000
  private second2thirdDuration: int = 5000
  private first2thirdDuration: int = 2000
  @State text1: string = '111'

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.text1).id('tabs_callback_tran')
      Text(this.message1).id('tabs_tran_mes')
        .margin({ top: 5, bottom: 10 } as Margin)

      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.tabsController, index: this.currentIndex }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('0')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Yellow)
          }.tabBar('1')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('2')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('3')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('4')
        }
        .id('callback_tabs_tran')
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .onChange((index: int): void => {
          this.message1 += 'onChange-'
          console.info(index.toString())
        })
        .onTabBarClick((index: int): void => {
          this.message1 += 'onTabBarClick-'
          console.info('onTabBarClick index: ' + index)
        })
        .onContentWillChange((currentIndex: int, comingIndex: int): boolean => {
          if (comingIndex == 3) {
            return false
          }
          this.message1 += 'onContentWillChange-'
          return true
        })
        .customContentTransition((from: int, to: int): TabContentAnimatedTransition => {
          this.text1 = '222'
          if ((from === 0 && to === 1) || (from === 1 && to === 0)) {
            // 缩放动画
            let firstCustomTransition = {
              timeout: this.firstTimeout,
              transition: (proxy: TabContentTransitionProxy) => {
                if (proxy.from === 0 && proxy.to === 1) {
                  this.tabContent0Scale = 1.0
                  this.tabContent1Scale = 0.5
                } else {
                  this.tabContent0Scale = 0.5
                  this.tabContent1Scale = 1.0
                }

                  this.getUIContext()?.animateTo({
                  duration: this.first2secondDuration,
                  onFinish: () => {
                    proxy.finishTransition()
                  }
                }, () => {
                  if (proxy.from === 0 && proxy.to === 1) {
                    this.tabContent0Scale = 0.5
                    this.tabContent1Scale = 1.0
                  } else {
                    this.tabContent0Scale = 1.0
                    this.tabContent1Scale = 0.5
                  }
                })
              }
            } as TabContentAnimatedTransition;
            return firstCustomTransition;
          } else {
            // 透明度动画
            let secondCustomTransition = {
              timeout: this.secondTimeout,
              transition: (proxy: TabContentTransitionProxy) => {
                if ((proxy.from === 1 && proxy.to === 2) || (proxy.from === 2 && proxy.to === 1)) {
                  if (proxy.from === 1 && proxy.to === 2) {
                    this.tabContent1Opacity = 1.0
                    this.tabContent2Opacity = 0.5
                  } else {
                    this.tabContent1Opacity = 0.5
                    this.tabContent2Opacity = 1.0
                  }
                  this.getUIContext()?.animateTo({
                    duration: this.second2thirdDuration,
                    onFinish: () => {
                      proxy.finishTransition()
                    }
                  }, () => {
                    if (proxy.from === 1 && proxy.to === 2) {
                      this.tabContent1Opacity = 0.5
                      this.tabContent2Opacity = 1.0
                    } else {
                      this.tabContent1Opacity = 1.0
                      this.tabContent2Opacity = 0.5
                    }
                  })
                } else if ((proxy.from === 0 && proxy.to === 2) || (proxy.from === 2 && proxy.to === 0)) {
                  if (proxy.from === 0 && proxy.to === 2) {
                    this.tabContent0Opacity = 1.0
                    this.tabContent2Opacity = 0.5
                  } else {
                    this.tabContent0Opacity = 0.5
                    this.tabContent2Opacity = 1.0
                  }
                  this.getUIContext()?.animateTo({
                    duration: this.first2thirdDuration,
                    onFinish: () => {
                      proxy.finishTransition()
                    }
                  }, () => {
                    if (proxy.from === 0 && proxy.to === 2) {
                      this.tabContent0Opacity = 0.5
                      this.tabContent2Opacity = 1.0
                    } else {
                      this.tabContent0Opacity = 1.0
                      this.tabContent2Opacity = 0.5
                    }
                  })
                }
              }
            } as TabContentAnimatedTransition;
            return secondCustomTransition;

          }
        })
        .width('100%')
        .backgroundColor(0xF1F3F5)
      }
      .width('100%')
      .height('40%')
    }
    .width('100%')
    .height('100%')
  }
}