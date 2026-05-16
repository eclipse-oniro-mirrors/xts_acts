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
  Entry,
  Component,
  Column,
  TabsController,
  Text,
  Button,
  Tabs,
  BottomTabBarStyle,
  TabsAnimationEvent,
  Margin,
  ClickEvent,
  BarPosition,
  TabContent,
  EdgeEffect,
  AnimationMode,
  $r,
  SubTabBarStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct preloadItemsErrorTabsExample {
  @State currentIndex: int = 0
  private controller: TabsController = new TabsController()
  @State selectedIndex: number = 0
  @State textResult: string = 'Hello world'

  build() {
    Column() {
      Text('preloadItemsError: ' + this.textResult)//“401”
        .id('preloadItems_tabs_401')
        .margin({ top: 10 } as Margin)

      Button('preload items: [-1]')
        .id('preloadItems_btn_401')
        .onClick((e: ClickEvent) => {
          this.controller.preloadItems([-1])
            .then(() => {
              console.info('preloadItems [-1] success.')
            })
            .catch((error: Error) => {
              this.textResult = JSON.stringify(error.code)
              console.info('Get error code: %{public}s', JSON.stringify(error.code));
              console.error('preloadItems [-1] failed, error code: ' + error.code + ', error message: ' +
              error.message)
            })
          console.info('xyb: preloadItems [-1] end');
        })
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }
        .tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'green')
          .id('green'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }
        .tabBar(new BottomTabBarStyle($r('sys.symbol.ohos_wifi'), 'pink')
          .id('pink'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow')
        .tabBar(SubTabBarStyle.of('yellow')
          .id('yellow'))

      }
      .width('90%')
      .height('60%')
      .edgeEffect(EdgeEffect.Spring)
      .animationMode(AnimationMode.CONTENT_FIRST)
      .onChange((index: int): void => {
        console.log('onChange index:' + index);
        this.currentIndex = index
      })
      .onGestureSwipe((index: int, extraInfo: TabsAnimationEvent): void => {
        console.info('onGestureSwipe index: ' + index)
        console.info('onGestureSwipe current offset: ' + extraInfo.currentOffset)
        console.info('onGestureSwipe target offset: ' + extraInfo.targetOffset)
        console.info('onGestureSwipe velocity: ' + extraInfo.velocity)
      })
      .onAnimationStart((index: int, targetIndex: int, event: TabsAnimationEvent): void => {
        console.info('onAnimationStart index: ' + index)
        console.info('onAnimationStart current offset: ' + event.currentOffset)
        console.info('onAnimationStart target offset: ' + event.targetOffset)
        console.info('onAnimationStart velocity: ' + event.velocity)
        if (index === targetIndex) {
          return
        }
        this.selectedIndex = targetIndex
      })
      .onAnimationEnd((index: int, event: TabsAnimationEvent): void => {
        console.info(index.toString())
        console.info('onAnimationEnd index: ' + index)
        console.info('onAnimationEnd current offset: ' + event.currentOffset)
        console.info('onAnimationEnd target offset: ' + event.targetOffset)
        console.info('onAnimationEnd velocity: ' + event.velocity)
      })

    }.width('100%')
  }
}