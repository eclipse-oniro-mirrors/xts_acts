'use static';
/**
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
import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';
interface EventMessage {
  titleMode: NavigationTitleMode
  hideToolBar: boolean|number
  hideTitleBar: boolean|number
  hideBackButton: boolean|number
  vertical:boolean|number
}
@Entry
@Component
struct NavigationExample {
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5)
  @State hideBar: boolean = true
  @State toolBar: boolean = true
  @State hideToolBar: boolean|number = false
  @State hideTitleBar: boolean|number= false
  @State hideBackButton: boolean|number = false
  @State onActionCalled: boolean = false
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Free
  @State navagationmode: NavigationMode = NavigationMode.Stack
  @State navagationmode2: NavigationMode = NavigationMode.Split
  @State commonTile: NavigationCommonTitle = {
    main: "main",
    sub: "sub"
  } as NavigationCommonTitle
  @State navTile: NavDestinationCommonTitle = {
    main: "main_nav",
    sub: "sub_nav"
  } as NavDestinationCommonTitle
  private stateChangCallBack:(eventData: events_emitter.EventData)=>void = (eventData: events_emitter.EventData) => {
    if (eventData != null&&eventData != undefined) {
      console.info("tabs page state change called:" + JSON.stringify(eventData));
      if ((eventData.data as EventMessage)?.vertical != null) {
        this.titleMode = (eventData.data as EventMessage).titleMode;
      }
      if ((eventData.data as EventMessage)?.hideToolBar != null) {
        this.hideToolBar = (eventData.data as EventMessage).hideToolBar;
      }
      if ((eventData.data as EventMessage)?.hideTitleBar != null) {
        this.hideTitleBar = (eventData.data as EventMessage).hideTitleBar
      }
      if ((eventData.data as EventMessage)?.hideBackButton != null) {
        this.hideBackButton = (eventData.data as EventMessage).hideBackButton;
      }
    }
  }

  onPageShow() {
    console.info('progress page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 135,
      priority: events_emitter.EventPriority.LOW
    } as events_emitter.InnerEvent
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
    Column() {
      Navigation({}) {
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
          }, (item: number) => String(item))
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
              console.info("navigationContent1 emit action state err: " + JSON.stringify(err.message))
            }
          })
          .margin({ left: 135, top: 60 } as Margin)
      }
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(NavigationTitleMode.Free)
      .hideTitleBar(false)
      .hideBackButton(false)
      .navBarWidth(30)
      .navBarPosition(NavBarPosition.Start)
      .backButtonIcon('images/grid.svg')
      .hideNavBar(true)
      .onNavBarStateChange((isVisible: boolean): void => {
        console.info("isvisible")
      })
      .onTitleModeChange((titleModel: NavigationTitleMode): void => {
        console.log('titleMode')
      })
      .hideToolBar(this.hideBar)
    }
  }
}