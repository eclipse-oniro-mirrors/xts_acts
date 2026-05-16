/*
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';

@Entry
@Component
struct TabsExampleSec {
    private controller: TabsController = new TabsController()
    
    @State barOverlap: boolean = false
    @State barBackgroundColorColor: Color = Color.Red
    @State barBackgroundColorNumber: number = 0
    @State barBackgroundColorString: string = "#00000000"

    private stateChangCallBack = (eventData: events_emitter.EventData) => {
        console.info("tabs page state change called:" + JSON.stringify(eventData));
        if (eventData != null) {
            this.barOverlap = eventData.data?.barOverlap;
            this.barBackgroundColorColor = eventData.data?.barBackgroundColorColor;
            this.barBackgroundColorNumber = eventData.data?.barBackgroundColorNumber;
            this.barBackgroundColorString = eventData.data?.barBackgroundColorString;
        }
    }

    aboutToAppear(){
        let stateChangeEvent: events_emitter.InnerEvent = {
            eventId: 183,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }

    build() {
        Column() {
            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }.tabBar("tab2")
            }
            .vertical(false)
            .scrollable(true)
            .barWidth(350)
            .barHeight(70)
            .animationDuration(200)
            .height('90%')
            .width('90%')
            .backgroundColor("#F5F5F5")
            .key('TabsOverlapTest1')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }.tabBar("tab2")
            }
            .vertical(false)
            .scrollable(true)
            .barWidth(350)
            .barHeight(70)
            .animationDuration(200)
            .barOverlap(this.barOverlap)
            .height('90%')
            .width('90%')
            .backgroundColor("#F5F5F5")
            .key('TabsOverlapTest2')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }.tabBar("tab2")
            }
            .vertical(false)
            .scrollable(true)
            .barWidth(350)
            .barHeight(70)
            .animationDuration(200)
            .barOverlap(false)
            .height('90%')
            .width('90%')
            .backgroundColor("#F5F5F5")
            .barBackgroundColor(this.barBackgroundColorColor)
            .key('BarBackgroundColorColor')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }.tabBar("tab2")
            }
            .vertical(false)
            .scrollable(true)
            .barWidth(350)
            .barHeight(70)
            .animationDuration(200)
            .barOverlap(false)
            .height('90%')
            .width('90%')
            .backgroundColor("#F5F5F5")
            .barBackgroundColor(this.barBackgroundColorNumber)
            .key('BarBackgroundColorNumber')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }.tabBar("tab2")
            }
            .vertical(false)
            .scrollable(true)
            .barWidth(350)
            .barHeight(70)
            .animationDuration(200)
            .barOverlap(false)
            .height('90%')
            .width('90%')
            .backgroundColor("#F5F5F5")
            .barBackgroundColor(this.barBackgroundColorString)
            .key('BarBackgroundColorString')

            Button("ResourceColor")
              .fontSize(40)
              .backgroundColor($r("sys.color.ohos_toggle_bg"))
              .key("ResourceColor")
            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }.tabBar("tab2")
            }
            .vertical(false)
            .scrollable(true)
            .barWidth(350)
            .barHeight(70)
            .animationDuration(200)
            .height('90%')
            .width('90%')
            .barBackgroundColor($r("sys.color.ohos_toggle_bg"))
            .key('BarBackgroundColorResource')
        }
    }
}