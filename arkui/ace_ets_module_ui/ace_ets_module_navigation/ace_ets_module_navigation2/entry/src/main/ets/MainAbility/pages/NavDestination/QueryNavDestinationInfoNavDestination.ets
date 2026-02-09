/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import observer from '@ohos.arkui.observer'
let tt : string|Resource|ResourceStr = 'TTTTTT'

@Entry
@Component
struct QueryNavDestinationInfoNavDestination {
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State tState: string|Resource|ResourceStr = 'YYYYY'
  // 可删
  aboutToAppear() {
    observer.on('navDestinationUpdate', (info) => {
      this.tState = info !== undefined ? JSON.stringify(info?.navigationId) : 'observer'
    });
    if (typeof this.queryNavDestinationInfo === 'function') {
      observer.on('navDestinationUpdate', (info) => {
        this.tState = info !== undefined ? JSON.stringify(info?.navigationId) : 'observer'
      });
      let info1: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo();
      tt = info1 !== undefined ? JSON.stringify(info1?.state) : 'queryNavDestinationInfo'
    }
  }

  onPageShow() {
    observer.on('navDestinationUpdate', (info) => {
      this.tState = info !== undefined ? JSON.stringify(info?.navigationId) : 'observer'
    });
  }

  build() {
    Column({space:5}) {
      Text(this.tState).key('QueryNavDestinationInfoNavDestinationTextObserver').fontColor(Color.Red)
      Button('testUndefined').onClick(() => {
        let info1: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo();
        console.log('QueryNavDestinationInfoNavDestination info1 is: ', JSON.stringify(info1))
        if (info1 == undefined) {
          console.log('QueryNavDestinationInfoNavDestination test undefined info1')
        }
        AppStorage.setOrCreate('testUndefined', info1)
      })
        .height('5%')
        .id('testUndefinedId')
      Button('testUndefinedWId').onClick(() => {
        let info2: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo(true);
        console.log('QueryNavDestinationInfoNavDestination info2 is: ', JSON.stringify(info2))
        if (info2 == undefined) {
          console.log('QueryNavDestinationInfoNavDestination test undefined info2')
        }
        AppStorage.setOrCreate('test2Undefined', info2)
      })
        .height('5%')
        .id('testUndefinedWId')
      Navigation() {
        NavRouter() {
          Row() {
            Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 }).backgroundColor(Color.Pink)
            Text(`WLAN`).key('QueryNavDestinationInfoNavDestinationText01')
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(70)
          NavDestination() {
            XX()
          }.hideTitleBar(false).backgroundColor('#0c182431').id('111')
        }.backgroundColor(this.isActiveWLAN ? '#ccc' : '#fff')
        .borderRadius(24)
        .onStateChange((isActivated: boolean) => {
          this.isActiveWLAN = isActivated
        })

      }
      .title('设置')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Auto)
      .hideTitleBar(false)
      .hideToolBar(true)
      .id('QueryNavDestinationInfoNavDestination123')
    }.height('60%')
  }
}


@Component
struct XX {
  aboutToAppear() {
    if (typeof this.queryNavDestinationInfo === 'function') {
      let info1: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo();
      tt = info1 !== undefined ? JSON.stringify(info1?.state) : 'queryNavDestinationInfo'
    }
  }

  build() {
    Column({space:5}){
      Text(tt).key('XXqueryNavDestinationInfoNavDestinationText01').fontColor(Color.Blue)
      Button('testQueryNavDestinationInfo').onClick(() => {
        let info3: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo(false);
        console.log('QueryNavDestinationInfoNavDestination info3 is: ', JSON.stringify(info3))
        AppStorage.setOrCreate('testW', info3)
      })
        .height('5%')
        .id('testWId')
    }
  }
}