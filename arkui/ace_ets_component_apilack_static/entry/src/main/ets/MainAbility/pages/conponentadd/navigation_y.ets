'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import Log from '../../common/Log';
import {
  Alignment,
  AlignRuleOption,
  Axis,
  BlurStyle,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  List,
  ListItem,
  LocalizedAlignRuleOptions,
  Margin,
  Measurable,
  MeasureResult,
  NavBarPosition,
  Navigation,
  NavigationTitleMode,
  NavPathStack,
  RepeatMode,
  Row,
  Search,
  SizeResult,
  Stack,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  VerticalAlign
} from '@ohos.arkui.component';
import { Environment } from 'arkui.stateManagement.storage.environment';
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct NavigationExample {
  @State hideBar: boolean = true
  @State toolBar: boolean = true
  @State hideToolBar: boolean = false
  @State hideTitleBar: boolean = false
  @State hideBackButton: boolean = false
  @State onActionCalled: boolean = false
  @State hideNavBar: boolean = false
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Free
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5)

  onPageShow() {
    console.info('progress page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 135,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text('title')
        .width(80)
        .height(60)
        .fontColor(Color.Blue)
        .fontSize(30)
    }
    .onClick((e: ClickEvent) => {
      console.log("title")
    })
  }

  @Builder
  NavigationMenus() {
    Row() {
      Image('images/add.png')
        .width(25)
        .height(25)
      Image('comment/more.png')
        .width(25)
        .height(25)
        .margin({ left: 30 } as Margin)
    }.width(100)
  }

  build() {
    Navigation(new NavPathStack()) { //{ name: 'navigation_y' } as HomePathInfo
      Search({ value: '', placeholder: "" }).width('85%').margin(26)
      List({ space: 5, initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('90%')
              .height(80)
              .backgroundColor('#3366CC')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }

        }, (item: number) => item!.toString())
      }
      .listDirection(Axis.Vertical)
      .key('Navigation')
      .height(300)
      .margin({ top: 10, left: 18 } as Margin)
      .width('100%')

      Button(this.hideBar ? "tool bar" : "hide bar")
        .backgroundColor(0x2788D9)
        .width(200)
        .height(100)
        .fontSize(20)
        .key('NavigationContent1')
        .onClick((e: ClickEvent) => {
          this.hideBar = !this.hideBar;
          console.info('navigationContent1 current action state is: ' + this.hideBar);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.hideBar,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 1366,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("navigationContent1 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("navigationContent1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .margin({ left: 135, top: 60 } as Margin)
    }
    .title(this.NavigationTitle)
    // .backButtonIcon()
    .navBarWidth(5)
    .navBarPosition(NavBarPosition.End)
    .menus(this.NavigationMenus)
    .titleMode(NavigationTitleMode.Free)
    .hideTitleBar(false)
    .hideNavBar(false)
    .hideBackButton(false)
    .onTitleModeChange((titleModel: NavigationTitleMode) => {
      console.log('titleMode' + titleModel)
    })
    .onNavBarStateChange((isVisible: boolean) => {
      console.log('isVisible:' + isVisible)
    })
    .toolbarConfiguration(
      [
        {
          value: 'app', icon: 'images/grid.svg', action: () => {
          console.log("app")
        }
        },
        {
          value: 'add', icon: 'images/add.svg', action: () => {
          console.log("add")
        }
        },
        {
          value: 'collect', icon: 'images/collect.svg', action: () => {
          console.log("collect")
        }
        }]
    )
    .hideToolBar(this.hideBar)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("tabs page state change called:" + JSON.stringify(eventData));
      if (data['vertical'] != null) {
        this.titleMode = data['vertical'] as NavigationTitleMode;
      }
      if (data['hideToolBar'] != null) {
        this.hideToolBar = data['hideToolBar'] as boolean;
      }
      if (data['hideTitleBar'] != null) {
        this.hideTitleBar = data['hideTitleBar'] as boolean;
      }
      if (data['hideBackButton'] != null) {
        this.hideBackButton = data['hideBackButton'] as boolean;
      }
      if (data['hideNavBar'] != null) {
        this.titleMode = data['hideNavBar'] as NavigationTitleMode;
      }
    }
  }
}