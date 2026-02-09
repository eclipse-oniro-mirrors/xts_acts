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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,Length,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,NavigationCommonTitle,NavDestinationCommonTitle,HorizontalAlign
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {MessageManager,Callback,Message } from '../../common/MessageManager';
interface Txt {
  text: string
  num: number
}
@Entry
@Component
struct NavigationPage {
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  @State mainTitleName: string = 'mainTitle'
  @State subTitleName: string = 'subTitle'
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Free
  @State hideToolBar: boolean = false
  @State hideTitleBar: boolean = false
  @State hideBackButton: boolean = false
  @State navBarWidth: Length = 700 as number
  @State navBarPosition: NavBarPosition = NavBarPosition.Start
  @State mode: NavigationMode = NavigationMode.Split
  @State backButtonIcon: string = 'resources/base/media/icon.png'
  @State hideNavBar: boolean = false
  @State titleModeChange: string = ''
  @State navBarStateChange: string = ''
  @State currentIndex: number = 0
  @State Build: Array<Txt> = [
    {
      text: 'add',
      num: 0
    },
    {
      text: 'app',
      num: 1
    },
    {
      text: 'collect',
      num: 2
    }
  ] as Array<Txt>
  messageManager:MessageManager<Length|boolean | NavBarPosition | string | NavigationTitleMode|number|NavigationMode> = new MessageManager<Length|boolean | NavBarPosition | string | NavigationTitleMode|number|NavigationMode>()

  onPageShow() {
    console.info('NavDestination onPageShow')
    AppStorage.setOrCreate<MessageManager<Length|boolean | NavBarPosition | string | NavigationTitleMode|number|NavigationMode>>("messageManager",  this.messageManager );
    let callback: Callback<Length|boolean | NavBarPosition | string | NavigationTitleMode|number|NavigationMode> = (message: Message<Length|boolean | NavBarPosition | string | NavigationTitleMode|number|NavigationMode>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'mainTitleName') {
        this.mainTitleName = (message as Message<string>).value
      }
      if (message.name == 'subTitleName') {
        this.subTitleName = (message as Message<string>).value
      }
      if (message.name == 'titleMode') {
        this.titleMode = (message as Message<NavigationTitleMode>).value
      }
      if (message.name == 'hideToolBar') {
        this.hideToolBar = (message as Message<boolean>).value
      }
      if (message.name == 'hideTitleBar') {
        this.hideTitleBar = (message as Message<boolean>).value
      }
      if (message.name == 'hideBackButton') {
        this.hideBackButton = (message as Message<boolean>).value
      }
      if (message.name == 'navBarWidth') {
        this.navBarWidth = (message as Message<Length>).value
      }
      if (message.name == 'navBarPosition') {
        this.navBarPosition = (message as Message<NavBarPosition>).value
      }
      if (message.name == 'mode') {
        this.mode = (message as Message<NavigationMode>).value
      }
      if (message.name == 'backButtonIcon') {
        this.backButtonIcon = (message as Message<string>).value
      }
      if (message.name == 'hideNavBar') {
        this.hideNavBar = (message as Message<boolean>).value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  @Builder NavigationTitle() {
    Column() {
      Text(this.mainTitleName)
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
        .key('title')
      Text(this.subTitleName)
        .fontColor('#182431')
        .fontSize(14)
        .lineHeight(19)
        .opacity(0.4)
        .margin({ top: 2 } as Margin)
        .key('subTitle')
    }.alignItems(HorizontalAlign.Start)
  }

  @Builder NavigationMenus() {
    Row() {
      Image('resources/base/media/ic_pad.svg')
        .width(24)
        .height(24)
      Image('resources/base/media/ic_pad.svg')
        .width(24)
        .height(24)
        .margin({ left: 24 } as Margin)
    }
  }

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.Build, (item: Txt) => {
        Column() {
          Image(this.currentIndex == item.num ? 'resources/base/media/icon_selected.svg' : 'resources/base/media/icon_tv.svg')
            .width(24)
            .height(24)
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 } as Margin)
        }.width(104).height(56).id('navigationToolbar')
        .onClick((e: ClickEvent) => {
          this.currentIndex = item.num
        })
      })
    }.margin({ left: 24 } as Margin)
  }

  build() {
    Column() {
      Navigation({}) {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: 8, left: 12 } as Margin)

        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
            }
          }, (item: number) => String(item))
        }
        .height(324)
        .width('100%')
        .margin({ top: 12, left: 12 } as Margin)
        .key('list')

        Text('TitleModeChange:' + this.titleModeChange).fontSize(10).margin(10).key('titleModeChange')
        Text('NavBarStateChange:' + this.navBarStateChange).fontSize(10).margin(10).key('navBarStateChange')
      }
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(this.titleMode)
      .key('navigation')
      .hideTitleBar(this.hideTitleBar)
      .hideToolBar(this.hideToolBar)
      .hideBackButton(this.hideBackButton)
      .navBarWidth(this.navBarWidth)
      .navBarPosition(this.navBarPosition)
      .mode(this.mode)
      .backButtonIcon(this.backButtonIcon)
      .hideNavBar(this.hideNavBar)
      .onTitleModeChange((titleModel: NavigationTitleMode): void => {
        console.info('titleMode' + titleModel)
        this.titleModeChange = "succ"
      })
      .onNavBarStateChange((isVisible: boolean): void => {
        console.info('isVisible: ' + isVisible)
        this.navBarStateChange = "succ"
      })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}