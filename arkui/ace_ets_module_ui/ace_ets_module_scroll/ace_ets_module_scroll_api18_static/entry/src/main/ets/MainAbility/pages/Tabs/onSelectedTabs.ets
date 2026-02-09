'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  $r,
  AdaptiveColor,
  AnimationMode,
  BarPosition,
  BlurStyle,
  BlurStyleActivePolicy,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  EdgeEffect,
  Entry,
  ForEach,
  Image,
  Margin,
  Stack,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
  TabsAnimationEvent,
  TabsCacheMode,
  TabsController,
  Text,
  TextAlign,
  ThemeColorMode,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct onSelectTabsExample {
  @State currentIndex: int = 0
  private controller: TabsController = new TabsController()
  @State selectedIndex: int = -1
  @State tIndex: int = -1

  build() {
    Column() {
      Text('selectedIndex: ' + this.selectedIndex)
        .id('selectedIndex_tabs_text')
        .margin({ top: 10 } as Margin)
      Text('index: ' + this.tIndex)
        .id('onUnselected_tabs_text')
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar('green')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar('blue')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar('pink')
      }
      .id('tabs_onSelected')
      .width('90%')
      .height('60%')
      .edgeEffect(EdgeEffect.Spring)
      .animationMode(AnimationMode.CONTENT_FIRST)
      .cachedMaxCount(1, TabsCacheMode.CACHE_BOTH_SIDE)
      .onChange((index: int): void => {
        console.log('onChange index:' + index);
        this.currentIndex = index
      })
      .onSelected((index: int): void => {
        console.log('onSelected index:' + index);
        this.selectedIndex = index
      })
      .onUnselected((index: int): void => {
        this.tIndex = index
        console.log('onUnselected: ' + index)
      })
      .onGestureSwipe((index: int, extraInfo: TabsAnimationEvent): void => {
        console.info('onGestureSwipe index: ' + index)
        console.info('onGestureSwipe current offset: ' + extraInfo.currentOffset)
        console.info('onGestureSwipe target offset: ' + extraInfo.targetOffset)
        console.info('onGestureSwipe velocity: ' + extraInfo.velocity)
      })
      .onAnimationStart((index: int, targetIndex: int, extraInfo: TabsAnimationEvent): void => {
        console.info('onAnimationStart index: ' + index)
        console.info('onAnimationStart current offset: ' + extraInfo.currentOffset)
        console.info('onAnimationStart target offset: ' + extraInfo.targetOffset)
        console.info('onAnimationStart velocity: ' + extraInfo.velocity)
        if (index === targetIndex) {
          return
        }
        this.selectedIndex = targetIndex
      })

    }.width('100%')
  }
}
