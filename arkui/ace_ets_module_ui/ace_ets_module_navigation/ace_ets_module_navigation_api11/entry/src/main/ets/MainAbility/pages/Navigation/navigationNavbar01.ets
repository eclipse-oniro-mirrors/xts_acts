/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../../utils/MessageManager';

@Entry
@Component
struct navigationNavbar01 {
  private arr: number[] = [0, 1, 2, 3]
  @State isActive: boolean = false
  @State dex: number = 0
  @State navBarWidth: number = 100
  messageManager:MessageManager = new MessageManager()
  @State navMode: NavigationMode[] = [NavigationMode.Split, NavigationMode.Stack, NavigationMode.Auto]
  @State navModeIndex: number = 0
  @State hideNavBar: boolean = false
  @State minContentWidth: number = 360
  @State navBarPosition: NavBarPosition[] = [NavBarPosition.Start, NavBarPosition.End]
  @State navBarPositionIndex: number = 0
  @State NavigationWidth: number = 250

  onPageShow() {
    console.info('navigationNavbar01  onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'navBarWidth') {
        this.navBarWidth = message.value;
      }
      if (message.name == 'navModeIndex') {
        this.navModeIndex = message.value;
      }
      if (message.name == 'hideNavBar') {
        this.hideNavBar = message.value;
      }
      if (message.name == 'minContentWidth') {
        this.minContentWidth = message.value;
      }
      if (message.name == 'navBarPositionIndex') {
        this.navBarPositionIndex = message.value;
      }
      if (message.name == 'NavigationWidth') {
        this.NavigationWidth = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Navigation() {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index: number = 0) => {
            ListItem() {
              NavRouter() {
                Row() {
                  Image($r('app.media.icon')).width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 })
                  Text(`NavRouter${item + 1}`)
                    .fontSize(22)
                    .fontWeight(500)
                    .textAlign(TextAlign.Center)
                }
                .width(180)
                .height(72)
                .backgroundColor(this.dex === index ? '#ccc' : '#fff')
                .borderRadius(24)
                .key('NavRouter' + item)

                NavDestination() {
                  Text(`我是NavDestination第${item + 1}页内容`).width('100%').key('navigationText01')
                }.backgroundColor('#ccc')
                .title(`NavDestination${item + 1}`)
              }.onStateChange((isActivated: boolean) => {
                this.dex = index
              })
            }
          }, (item: number) => item.toString())
        }
        .height('100%')
        .margin({ top: 12, left: 12 })
      }
      .width(this.NavigationWidth)
      .minContentWidth(this.minContentWidth)
      .navBarWidth(this.navBarWidth)
    }.height('100%')
  }
}