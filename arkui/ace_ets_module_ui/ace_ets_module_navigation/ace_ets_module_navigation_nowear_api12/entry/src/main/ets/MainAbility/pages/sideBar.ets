/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SideBarShowSideBar {
  normalIcon: Resource = $r("app.media.user")
  selectedIcon: Resource = $r("app.media.userFull")
  @State arr: number[] = [1, 2, 3]
  @State current: number = 1

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SideBarShowSideBar start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SideBarShowSideBar end`)
  }

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      Column() {
        ForEach(this.arr, (item: number) => {
          Column({ space: 5 }) {
            Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
            Text("Index0" + item)
              .fontSize(25)
              .fontColor(this.current === item ? '#0A59F7' : '#999')
              .fontFamily('source-sans-pro,cursive,sans-serif')
          }
          .onClick(() => {
            this.current = item
          })
        }, (item: string) => item)
      }.width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor('#19000000')

      RowSplit() {
        Column() {
          Text('Split page one').fontSize(30)
        }.justifyContent(FlexAlign.Center)

        Column() {
          Text('Split page two').fontSize(30)
        }.justifyContent(FlexAlign.Center)
      }.width('100%')
    }
    .key("SideBarContainer")
    .showSideBar(true)
    .autoHide(false)
    .sideBarWidth(240)
    .sideBarPosition(SideBarPosition.End)
    .minSideBarWidth(210)
    .maxSideBarWidth(260)
    .onChange((value: boolean) => {
      console.info('status:' + value)
    })
  }
}

