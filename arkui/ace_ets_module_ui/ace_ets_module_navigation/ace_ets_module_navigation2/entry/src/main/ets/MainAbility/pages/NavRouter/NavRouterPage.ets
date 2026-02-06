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
struct NavRouterPage {
  private arr: number[] = [0, 1, 2, 3]
  @State isActive: boolean = false
  @State dex: number = 0
  @State stateChange: string = ''
  @State routerState: string = ''
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
      if (message.name == 'isActive') {
        this.isActive = message.value
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
    Scroll() {
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
                        Text('Hello').fontSize(30).key('textContent')
                      }.padding({ left: 15 })
                    }
                  }.backgroundColor('#ccc')
                  .key('NavDestination' + (item + 1).toString())
                  .title(`NavDestination${item + 1}`)
                }.key('NavRouter' + (item + 1).toString())
                .onStateChange((isActivated: boolean) => {
                  if (isActivated) {
                    this.dex = index;
                  }
                  if (index == 1) {
                    this.stateChange = 'stateChange ' + isActivated;
                  } else {
                    this.routerState = 'stateChange ' + isActivated;
                  }
                })
              }
            }, (item: number) => item.toString())
          }
          .height('100%')
          .margin({ top: 12, left: 12 })
        }
        .mode(NavigationMode.Split)
        .navBarWidth('30%')
        .hideTitleBar(true)
        .hideToolBar(true)
        .height('60%')
      Text(this.stateChange).fontSize(20).margin(10).key('testT')
      Text(this.routerState).fontSize(20).margin(10).key('TestRouter')
      }
    }
  }
}

