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

import {
  Component,
  Text,
  Row,
  ClickEvent,
  Column,
  List,
  Image,
  ForEach,
  Position,
  Margin,
  Navigation,
  TextAlign,
  Color,
  NavDestination,
  $r,
  Padding,
  NavPathStack,
  Flex,
  FlexDirection
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';

@Component
export struct NavRouterView {
  @State isActive: boolean = false
  @State dex: number = 0
  @Link _position!: Position;
  private componentKey: string = '';
  pathStack: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.pathStack) {
      Row() {
        Image($r('app.media.icon')).width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin)
        Text(`NavRouter`)
          .fontSize(22)
          .fontWeight(500)
          .textAlign(TextAlign.Center)
      }
      .width(180)
      .height(72)
      .backgroundColor('#fff')
      .borderRadius(24)

      NavDestination() {
        Text(`NavDestination`).fontSize(50)
        Flex({ direction: FlexDirection.Row }) {
          Row() {
            Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
            Text('NavDestination content').fontSize(30)
          }.padding({ left: 15 } as Padding)
        }
      }.backgroundColor('#ccc')
      .title(`NavDestination`)
    }
    .position(this._position)
    .key(this.componentKey)
  }
}