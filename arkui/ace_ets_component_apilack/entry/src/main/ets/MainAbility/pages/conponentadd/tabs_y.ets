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

import Log from '../common/Log.ets';
const TAG = 'ets_apiLack_add';

@Entry
@Component
struct TabsBarPosition {

  private controller: TabsController = new TabsController()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear TabsBarPosition start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear TabsBarPosition end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("tabs-BarPosition")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("barPositionText")


      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

      }
      .key("barPositionTabs")
      .vertical(true).scrollable(true).barMode(BarMode.Fixed)
      .barWidth(70).barHeight(150).animationDuration(400)
      .onChange((index: number) => {
        console.info(index.toString())
      })
      .width('90%').backgroundColor(0xF5F5F5)
    
    }.width("100%").height("100%")
  }
}

