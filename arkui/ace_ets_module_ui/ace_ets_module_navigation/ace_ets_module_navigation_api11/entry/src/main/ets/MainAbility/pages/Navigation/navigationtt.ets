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
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct NavigationExamplett {
  private arr: number[] = [0, 1, 2, 3, 4, 5]
  @State hideBar: boolean = true
  @State toolBar: boolean = true
  @State hideToolBar: number = 0
  @State hideTitleBar: number = 0
  @State hideBackButton: number = 0
  @State onActionCalled: boolean = false
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Free

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("tabs page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.vertical != null) {
        this.titleMode = eventData.data.titleMode;
      }
      if (eventData.data?.hideToolBar != null) {
        this.hideToolBar = parseInt(eventData.data.hideToolBar);
      }
      if (eventData.data?.hideTitleBar != null) {
        this.hideTitleBar = parseInt(eventData.data.hideTitleBar);
      }
      if (eventData.data?.hideBackButton != null) {
        this.hideBackButton = parseInt(eventData.data.hideBackButton);
      }
    }
  }

  onPageShow() {
    console.info('progress page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 135,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  @Builder NavigationTitle() {
    Column() {
      Text('title')
        .width(80)
        .height(60)
        .fontColor(Color.Blue)
        .fontSize(30)
    }
    .onClick(() => {
      console.log("title")
    })
  }

  @Builder NavigationMenus() {
    Row() {
      Image('images/add.png')
        .width(25)
        .height(25)
      Image('comment/more.png')
        .width(25)
        .height(25)
        .margin({ left: 30 })
    }.width(100)
  }

  build() {
    Column() {
      Navigation() {
        Button(this.hideBar ? "tool bar" : "hide bar")
          .backgroundColor(0x2788D9).width('20%').height('10%').fontSize(20)
          .key('NavigationContent1')
          .onClick(() => {
            this.hideBar = !this.hideBar;
            console.info('navigationContent1 current action state is: ' + this.hideBar);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.hideBar,
                }
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 1366,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("navigationContent1 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("navigationContent1 emit action state err: " + JSON.stringify((err as BusinessError).message))
            }
          })
          .margin({ left: 135})
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
            }.editable(true)
          }, (item: number) => item.toString())
        }
        .listDirection(Axis.Vertical)
        .key('Navigation')
        .height(300)
        .margin({ top: 10, left: 18 })
        .width('100%')
      }
      .title(this.NavigationTitle)
      .subTitle('subtitle')
      .menus(this.NavigationMenus)
      .titleMode(NavigationTitleMode.Free)
      .hideTitleBar(false)
      .hideBackButton(false)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.log('titleMode')
      })
      .toolBar({ items: [
        { value: 'app', icon: 'images/grid.svg', action: () => {
          console.log("app")
        } },
        { value: 'add', icon: 'images/add.svg', action: () => {
          console.log("add")
        } },
        { value: 'collect', icon: 'images/collect.svg', action: () => {
          console.log("collect")
        } }] })
      .hideToolBar(this.hideBar)
    }
  }
}