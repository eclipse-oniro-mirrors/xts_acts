'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, TabsAttribute, Resource, Color, TabsController, SelectedMode, Column,
    BarPosition, Tabs, Button, TabContent, $r, Text } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TabsSecModifier1 implements AttributeModifier<TabsAttribute>{
    barOverlap: boolean = true
    applyNormalAttribute(instance: TabsAttribute): void {

        instance.barOverlap(this.barOverlap)
    }
}
class TabsSecModifier2 implements AttributeModifier<TabsAttribute>{
    applyNormalAttribute(instance: TabsAttribute): void {

        instance.barOverlap(undefined)
    }
}
class TabsSecModifier3 implements AttributeModifier<TabsAttribute>{
    barBackgroundColorColor: Color = Color.Red
    applyNormalAttribute(instance: TabsAttribute): void {

        instance.barBackgroundColor(this.barBackgroundColorColor)
    }
}
class TabsSecModifier4 implements AttributeModifier<TabsAttribute>{
    barBackgroundColorNumber: int = 0
    applyNormalAttribute(instance: TabsAttribute): void {

        instance.barBackgroundColor(this.barBackgroundColorNumber)
    }
}
class TabsSecModifier5 implements AttributeModifier<TabsAttribute>{
    barBackgroundColorString: string = "#00000000"
    applyNormalAttribute(instance: TabsAttribute): void {

        instance.barBackgroundColor(this.barBackgroundColorString)
    }
}
class TabsSecModifier6 implements AttributeModifier<TabsAttribute>{
    applyNormalAttribute(instance: TabsAttribute): void {

        instance.barPosition(BarPosition.Start)

            .vertical(true)

            .scrollable(false)

            .barWidth(300)

            .barHeight(60)

            .animationDuration(100)

    }
}

@Entry
@Component
struct TabsExampleSec {
    private controller: TabsController = new TabsController()
    @State modifier1: TabsSecModifier1 = new TabsSecModifier1()
    @State modifier2: TabsSecModifier2 = new TabsSecModifier2()
    @State modifier3: TabsSecModifier3 = new TabsSecModifier3()
    @State modifier4: TabsSecModifier4 = new TabsSecModifier4()
    @State modifier5: TabsSecModifier5 = new TabsSecModifier5()
    @State modifier6: TabsSecModifier6 = new TabsSecModifier6()

    build() {
        Column() {
            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
            }
            .barPosition(BarPosition.End)
                .vertical(false)
                .scrollable(true)
                .barWidth(350)
                .barHeight(70)
                .animationDuration(200)
                .height('90%')
                .width(380)
                .backgroundColor("#F5F5F5")
                .key('TabsOverlapTest1')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
            }
            .vertical(false)
                .scrollable(true)
                .barWidth(350)
                .barHeight(70)
                .animationDuration(200)
                .attributeModifier(this.modifier1)
                .height('90%')
                .width('90%')
                .backgroundColor("#F5F5F5")
                .key('TabsOverlapTest2')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
            }
            .vertical(false)
                .scrollable(true)
                .barWidth(350)
                .barHeight(70)
                .animationDuration(200)
                .attributeModifier(this.modifier2)
                .height('90%')
                .width('90%')
                .backgroundColor("#F5F5F5")
                .key('TabsOverlapTest3')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
            }
                .attributeModifier(this.modifier3)
                .key('BarBackgroundColorColor')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
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
                .attributeModifier(this.modifier4)
                .key('BarBackgroundColorNumber')

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
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
                .attributeModifier(this.modifier5)
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
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
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

            Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
                TabContent() {
                    Column(){
                        Text('Tab1').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Yellow)
                }//.tabBar("tab1")

                TabContent() {
                    Column(){
                        Text('Tab2').fontSize(32)
                    }.width('100%').height('100%').backgroundColor(Color.Pink)
                }//.tabBar("tab2")
            }
            .attributeModifier(this.modifier6)
                .height('90%')
                .width('90%')
                .backgroundColor("#F5F5F5")
                .key('TabsAttrsTest1')
        }
    }
}