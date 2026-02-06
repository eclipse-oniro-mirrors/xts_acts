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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,Padding,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {MessageManager,Callback,Message } from '../../common/MessageManager';

@Entry
@Component
struct navigationNavbar02 {
  private arr: number[] = new Array<number>(0, 1, 2, 3)
  @State isActive: boolean = false
  @State dex: number = 0
  @State navBarWidth: number = 240
  messageManager:MessageManager<number|boolean|int> = new MessageManager<number|boolean|int>()
  @State navMode: NavigationMode[] = new Array<NavigationMode>(NavigationMode.Split, NavigationMode.Stack, NavigationMode.Auto)
  @State navModeIndex: number = 0
  @State hideNavBar: boolean = false
  @State minContentWidth: number = 360
  @State navBarPosition: NavBarPosition[] = new Array<NavBarPosition>(NavBarPosition.Start, NavBarPosition.End)
  @State navBarPositionIndex: int = 0

  onPageShow() {
    console.info('navigationNavbar02  onPageShow');
    AppStorage.setOrCreate<MessageManager<number|boolean|int>>("messageManager",  this.messageManager );
    let callback: Callback<number|boolean|int> = (message: Message<number|boolean|int>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'navBarWidth') {
        this.navBarWidth = (message as Message<number>).value;
      }
      if (message.name == 'navModeIndex') {
        this.navModeIndex = (message as Message<number>).value;
      }
      if (message.name == 'hideNavBar') {
        this.hideNavBar = (message as Message<boolean>).value;
      }
      if (message.name == 'minContentWidth') {
        console.log('minContentWidthminContentWidthmessage.value' + message.value)
        this.minContentWidth = (message as Message<number>).value;
      }
      if (message.name == 'navBarPositionIndex') {
        this.navBarPositionIndex = (message as Message<int>).value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Navigation({}) {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Column() {
                Row() {
                  Image($r('app.media.icon')).width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin)
                  Text(`NavRouter${item + 1}`)
                    .fontSize(22)
                    .fontWeight(500)
                    .textAlign(TextAlign.Center)
                }
                .width(180)
                .height(72)
                .backgroundColor('#ccc')
                .borderRadius(24)

                NavDestination() {
                  Text(`我是NavDestination第${item + 1}页内容`).fontSize(50)
                  Flex({ direction: FlexDirection.Row }) {
                    Row() {
                      Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
                      Text('今天共有七节课').fontSize(30)
                    }.padding({ left: 15 } as Padding)
                  }
                }.backgroundColor('#ccc')
                .title(`NavDestination${item + 1}`)
              }
            }
          }, (item: number) => String(item))
        }
        .height('100%')
        .margin({ top: 12, left: 12 } as Margin)
      }
      .key('navigationNavbar')
      .minContentWidth(this.minContentWidth)
      .mode(this.navMode[this.navModeIndex as int])
      .navBarWidth(this.navBarWidth)
      .navBarPosition(this.navBarPosition[this.navBarPositionIndex])
      .hideNavBar(this.hideNavBar)
      .hideTitleBar(true)
      .hideToolBar(true)
    }.height('100%')
  }
}