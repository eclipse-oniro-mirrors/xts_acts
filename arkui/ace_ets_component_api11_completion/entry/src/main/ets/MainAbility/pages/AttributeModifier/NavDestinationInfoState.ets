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

class T32 {
  names: string = ""
  values: NavPathStack | null = null
}
@Entry
@Component
struct NavDestinationInfoState {
  private arr: number[] = [1,2,3]
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State getText: string = ''
  @State tState: string|Resource|ResourceStr = 'tState'
 
  infoStat:observer.NavDestinationState = observer.NavDestinationState.ON_SHOWN
  infoSta1t:observer.NavDestinationState = observer.NavDestinationState.ON_HIDDEN
  
  onPageShow() {
    observer.on('navDestinationUpdate', (info) => {

      if (info.state == this.infoStat) {
           this.tState = "ON_SHOWN"
      }

      if (info.state == this.infoSta1t) {
          this.tState = "ON_HIDDEN"
      }
      // this.tState = info !== undefined ? JSON.stringify(info?.state) : 'state'
    });
  }

  @Builder
  pageOneTmp(info: T32) {
    NavDestination() {
      Column() {
        Button('pageOneTmp', { stateEffect: true, type: ButtonType.Capsule }).id('NavigationStack10pageOneTmpbut')
          .width('80%')
          .height(40)
          .onClick(() => {
            (info.values as NavPathStack).pushPathByName('pageTwo', null)
          })
      }.width('100%').height('100%')
    }.title('pageOne')
  }
  @Builder
  pageTwoTmp(info: T32) {
    NavDestination() {
      Column() {
        Button('pageTwoTmp', { stateEffect: true, type: ButtonType.Capsule }).id('NavigationStack10pageTwoTmpbut')
          .width('80%')
          .height(40)
          .onClick(() => {
            (info.values as NavPathStack).pushPathByName('pageOne', null)
          })
      }.width('100%').height('100%')
    }.title('pageTwo')
  }
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp({ names: name, values: this.pageInfos })
    } else if (name === 'pageTwo') {
      this.pageTwoTmp({ names: name, values: this.pageInfos })
    }
  }



  build() {
    Column(){
      Navigation(this.pageInfos) {
        NavRouter() {
          Row() {
            Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 }).backgroundColor(Color.Pink)
            Text(`WLAN`).key('NavDestinationInfoStateText01')
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(72)
          NavDestination() {
            Text('NavDestination').fontSize(26).fontWeight(700).fontColor(Color.Red)
          }.backgroundColor('#0c182431').id('111')
        }.backgroundColor(Color.Orange)
      }
      .id('dfjaslgjsdfkljlsdfjakldfsdf')
      .navDestination(this.PageMap)
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Stack)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)

      Text(this.tState).key('NavDestinationInfoStateText02').fontWeight(700)
      Button('pop path').key('NavDestinationInfoStateButton')
        .onClick(() => {
          this.pageInfos.pop()
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}