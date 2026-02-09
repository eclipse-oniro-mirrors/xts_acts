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
  Scroll,
  Builder,
  List,
  ListItem,
  Resource,

  Curve,
  PopInfo,
  HorizontalAlign,
  AnimateParam,
  NavDestinationTransition,
  Search,
  TextAlign,
  Axis,
  NavBarPosition,
  FlexAlign,
  NavPathInfo,
  NavDestinationContext,
  NavigationTitleMode,
  Image,
  NavigationMode,
  Column,
  Navigation,
  ButtonType,
  NavDestination,
  Stack,
  ColumnOptions,
  TextInput,
  SearchController,
  NavigationOperation,
  PanGesture,
  Position,
  EffectType,
  EffectComponent,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  NavDestinationMode,
  Dimension,
  TextOverflow,
  GestureEvent,
  FontWeight,
  Axis,
  Margin,
  Swiper,
  ForEach,
  PickerTextStyle,
  SheetMode,
  NavDestinationActiveReason,
  CalendarAlign,
  Visibility,
  NavigationCommonTitle,
  NavDestinationCommonTitle,
  Alignment,
  BarStyle,
  LaunchMode,
  NavPathStack
} from '@ohos.arkui.component';
import { State, Link, PropRef, Provide, Consume, StorageLink } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { CommonNavigation } from './CommonNavigation';

export interface ClickItem {
  name: string;
  callback: () => void;
  id?: string;
}

@Component
struct SheetComponent {
  pathStack: NavPathStack = new NavPathStack();
  clickItem: Array<ClickItem> = [{
    name: '关闭半模态',
    callback: () => {
      AppStorage.setOrCreate<boolean>('isSheetShow', false);
    },
    id: 'closeSheetId'
  } as ClickItem]

  @Builder
  pageBuilder(name: string) {
    if (name == "pageOne") {
      NavDestination() {
      }.title('pageOne')
      .onActive((reason: NavDestinationActiveReason) => {
        console.log("trigger sheet pageOne onActive: " + reason);
      }).onInactive((reason: NavDestinationActiveReason) => {
        console.log("trigger sheet pageOne onInactive: " + reason);
      })
    }
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          ForEach(this.clickItem, (item: ClickItem) => {
            Button(item.name)
              .width(300)
              .height(30)
              .margin(10)
              .onClick(item.callback)
              .id(item.id)
          })
        }
      }.width('100%').height('50%')

      Navigation(this.pathStack) {
      }.title('Sheet Navigation')
      .navDestination(this.pageBuilder)
    }.backgroundColor(Color.Yellow)
  }
}

@Entry
@Component
struct BasicSheet01 {
  pathStack: NavPathStack = new NavPathStack()
  @StorageLink('isShow') isShow: boolean = false;
  @StorageLink('isSheetShow') isSheetShow: boolean = false;
  @State mode: SheetMode = SheetMode.OVERLAY
  clickItem: Array<ClickItem> = [
    {
      name: 'push pageOne',
      callback: () => {

        this.pathStack.pushPath(new NavPathInfo('pageOne', null))
      },
      id: 'sheetPushId'
    } as ClickItem, {
    name: '开启半模态',
    callback: () => {
      this.isSheetShow = true;
      this.mode = SheetMode.OVERLAY
    },
    id: 'openSheetId'
  } as ClickItem
  ]

  @Builder
  SheetBuilder() {
    SheetComponent()
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          ForEach(this.clickItem, (item: ClickItem) => {
            Button(item.name)
              .width(300)
              .height(30)
              .margin(10)
              .onClick(item.callback)
              .id(item.id)
          })
        }
      }.height('50%')

      Column() {
        CommonNavigation({pathStack: this.pathStack})
      }
      .bindSheet(this.isSheetShow, this.SheetBuilder, {mode: this.mode})
    }
  }
}