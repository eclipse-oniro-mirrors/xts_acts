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
  ListItem,
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
  NavigationMode,
  NavPathStack
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';

@Component
export struct NavigationView {
  private arr: number[] = [0, 1, 2, 3] as number[]
  @State isActive: boolean = false
  @State dex: number = 0
  @Link _position!: Position;
  private componentKey: string = '';

  build() {
    Navigation(new NavPathStack()) {
      List({ space: 12, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {

          }
        }, (item: number) => String(item))
      }
      .height('100%')
      .width('100%')
      .margin({ top: 12, left: 12 } as Margin)
    }
    .mode(NavigationMode.Split)
    .hideTitleBar(true)
    .hideToolBar(true)
    .position(this._position)
    .key(this.componentKey)
  }
}