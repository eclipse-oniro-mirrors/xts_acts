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
  $r,
  AdaptiveColor,
  BlurStyle,
  BlurStyleActivePolicy,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  ForEach,
  Image,
  Margin,
  Stack,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
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
struct barBackgroundTabsExample {
  build() {
    Column() {
      // barBackgroundBlurStyle 可以通过枚举值的方式设置模糊参数
      Stack() {
        Image($r('app.media.icon'))
        Tabs() {
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
        .id('tabs_bar_back_style')
        .barBackgroundBlurStyle(BlurStyle.COMPONENT_THICK,
          { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
      }
      .width('90%')
      .height('40%')
      .margin(5)

      // barBackgroundEffect 可以自定义设置tabBar页签栏的模糊半径、亮度、饱和度等参数
      Stack() {
        Image($r('app.media.icon'))
        Tabs() {
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
        .id('tabs_bar_back_effect')
        .barBackgroundEffect({
          //页面效果显示=》模糊程度
          radius: 20, //模糊半径
          saturation: 15, //饱和度
          blurOptions: { grayscale: [20, 20] }, //灰阶模糊参数，默认为[0,0]。
          brightness: 0.6, //亮度
          color: '#8044a4b5', //颜色
          adaptiveColor: AdaptiveColor.DEFAULT, //背景模糊效果使用的取色模式
          inactiveColor: $r('app.color.color_red'),
          policy: BlurStyleActivePolicy.ALWAYS_ACTIVE//一直有模糊效果。
        })
      }
      .width('90%')
      .height('40%')
    }
  }
}