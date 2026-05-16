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
 import {MessageManager,Callback} from '../../utils/MessageManager';

@Entry
@Component
struct NavDestinationPage {
  private arr: number[] = [0, 1, 2, 3]
  @State isActive: boolean = false
  @State dex: number = 0
  @State stateChange: string = ''
  @State hideTitleBar: boolean = false
  @State backColor: Color = Color.Grey
  @State title: string = 'NavDestination'
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('NavRouter onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'arr') {
        this.arr = message.value
      }
      if (message.name == 'hideTitleBar') {
        this.hideTitleBar = message.value
      }
      if (message.name == 'backColor') {
        this.backColor = message.value
      }
      if (message.name == 'title') {
        this.title = message.value
      }
      if (message.name == 'dex') {
        this.dex = message.value
      }
      if (message.name == 'stateChange') {
        this.stateChange = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Navigation() {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index: number) => {
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

                NavDestination() {
                  Text(`我是NavDestination第${item + 1}页内容`).fontSize(50)
                  Flex({ direction: FlexDirection.Row }) {
                    Row() {
                      Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 })
                      Text('Hello').fontSize(30).key('textContent' + (item + 1).toString())
                    }.padding({ left: 15 })
                  }
                }.backgroundColor(this.backColor)
                .key('NavDestination' + (item + 1).toString())
                .title(this.title + (item + 1).toString())
                .hideTitleBar(this.hideTitleBar)
              }.key('NavRouter' + (item + 1).toString())
              .onStateChange((isActivated: boolean) => {
                this.stateChange = "stateChange " + isActivated.toString()
                this.dex = index
              })
            }
          }, (item: number) => item.toString())
        }
        .height('100%')
        .margin({ top: 12, left: 12 })
      }
      .navBarWidth('30%')
      .mode(NavigationMode.Split)
      .hideTitleBar(true)
      .hideToolBar(true)
      Text(this.stateChange).fontSize(20).margin(10).id('12')
    }.height('100%')
  }
}

