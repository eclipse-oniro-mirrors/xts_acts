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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,Padding,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {MessageManager,Callback,Message} from '../../common/MessageManager';
@Entry
@Component
struct NavRouterPage {
  private arr: number[] = new Array<number>(0, 1, 2,3)
  @State isActive: boolean = false
  @State dex: number = 0
  @State stateChange: string = ''
  @State routerState: string = ''
  messageManager: MessageManager<number> = new MessageManager<number>()

  // onPageShow() {
  //   console.info('NavRouter onPageShow')
  //   AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager );
  //   let callback: Callback<number> = (message: Message<number>) => {
  //     console.error('message = ' + message.name + "--" + message.value)
  //     if (message.name == 'arr') {
  //       this.arr = (message as Message<number[]>).value
  //     }
  //     if (message.name == 'isActive') {
  //       this.isActive = (message as Message<boolean>).value
  //     }
  //     if (message.name == 'dex') {
  //       this.dex = message.value
  //     }
  //     if (message.name == 'stateChange') {
  //       this.stateChange = (message as Message<string>).value
  //     }
  //   }
  //   this.messageManager.registerCallback(callback)
  // }

  build() {
    Scroll() {
      Column() {
        Navigation({}) {
          List({ space: 12, initialIndex: 0 }) {
            ForEach(this.arr, (item: number, index: int) => {
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
                  .backgroundColor(this.dex === index ? '#ccc' : '#fff')
                  .borderRadius(24)

                  NavDestination() {
                    Text(`我是NavDestination第${item + 1}页内容`).fontSize(50)
                    Flex({ direction: FlexDirection.Row }) {
                      Row() {
                        Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 } as Margin)
                        Text('Hello').fontSize(30).key('textContent')
                      }.padding({ left: 15 } as Padding)
                    }
                  }.backgroundColor('#ccc')
                  .key('NavDestination' + (item + 1).toString())
                  .title(`NavDestination${item + 1}`)
                }
                .key('NavRouter' + (item + 1).toString())
              }
            }, (item: number) => String(item))
          }
          .height('100%')
          .margin({ top: 12, left: 12 } as Margin)
        }
        .mode(NavigationMode.Split)
        .navBarWidth('30%')
        .hideTitleBar(true)
        .hideToolBar(true)
        .height('80%')
      Text(this.stateChange).fontSize(20).margin(10).key('testT')
      Text(this.routerState).fontSize(20).margin(10).key('TestRouter')
      }
    }
  }
}

