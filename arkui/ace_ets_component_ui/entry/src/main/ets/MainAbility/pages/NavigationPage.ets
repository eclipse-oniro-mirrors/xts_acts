/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../utils/MessageManager';

type Message = boolean|string|number|NavigationTitleMode|NavBarPosition|NavigationMode

interface BuildType {
  text: string,
  num: number
}

@Entry
@Component
struct NavigationPage {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State mainTitleName: string = 'mainTitle'
  @State subTitleName: string = 'subTitle'
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Free
  @State hideToolBar: boolean = false
  @State hideTitleBar: boolean = false
  @State hideBackButton: boolean = false
  @State navBarWidth: number = 700
  @State navBarPosition: NavBarPosition = NavBarPosition.Start
  @State mode: NavigationMode = NavigationMode.Split
  @State backButtonIcon: string = 'resources/base/media/icon.png'
  @State hideNavBar: boolean = false
  @State titleModeChange: string = ''
  @State navBarStateChange: string = ''
  @State currentIndex: number = 0
  @State Build: BuildType[] = [
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
  ]
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('NavDestination onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'mainTitleName') {
        this.mainTitleName = message.value as string
      }
      if (message.name == 'subTitleName') {
        this.subTitleName = message.value as string
      }
      if (message.name == 'titleMode') {
        this.titleMode = message.value as NavigationTitleMode
      }
      if (message.name == 'hideToolBar') {
        this.hideToolBar = message.value as boolean
      }
      if (message.name == 'hideTitleBar') {
        this.hideTitleBar = message.value as boolean
      }
      if (message.name == 'hideBackButton') {
        this.hideBackButton = message.value as boolean
      }
      if (message.name == 'navBarWidth') {
        this.navBarWidth = message.value as number
      }
      if (message.name == 'navBarPosition') {
        this.navBarPosition = message.value as NavBarPosition
      }
      if (message.name == 'mode') {
        this.mode = message.value as NavigationMode
      }
      if (message.name == 'backButtonIcon') {
        this.backButtonIcon = message.value as string
      }
      if (message.name == 'hideNavBar') {
        this.hideNavBar = message.value as boolean
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
        .margin({ top: 2 })
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
        .margin({ left: 24 })
    }
  }

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.Build, (item: BuildType) => {
        Column() {
          Image(this.currentIndex == item.num ? 'resources/base/media/icon_selected.svg' : 'resources/base/media/icon_tv.svg')
            .width(24)
            .height(24)
          Text(item.text)
            .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 })
        }.width(104).height(56).id('navigationToolbar')
        .onClick(() => {
          this.currentIndex = item.num
        })
      })
    }.margin({ left: 24 })
  }

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width('90%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: 8, left: 12 })

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
            }.editable(true)
          }, (item: string) => item)
        }
        .height(324)
        .width('100%')
        .margin({ top: 12, left: 12 })
        .key('list')

        Text('TitleModeChange:' + this.titleModeChange).fontSize(10).margin(10).key('titleModeChange')
        Text('NavBarStateChange:' + this.navBarStateChange).fontSize(10).margin(10).key('navBarStateChange')
      }
      .title(this.NavigationTitle)
      .menus(this.NavigationMenus)
      .titleMode(this.titleMode)
      .toolBar(this.NavigationToolbar)
      .key('navigation')
      .hideTitleBar(this.hideTitleBar)
      .hideToolBar(this.hideToolBar)
      .hideBackButton(this.hideBackButton)
      .navBarWidth(this.navBarWidth)
      .navBarPosition(this.navBarPosition)
      .mode(this.mode)
      .backButtonIcon(this.backButtonIcon)
      .hideNavBar(this.hideNavBar)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
        this.titleModeChange = "succ"
      })
      .onNavBarStateChange((isVisible: boolean) => {
        console.info('isVisible: ' + isVisible)
        this.navBarStateChange = "succ"
      })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}