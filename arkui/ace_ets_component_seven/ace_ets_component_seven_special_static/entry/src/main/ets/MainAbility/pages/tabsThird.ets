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
import { Entry, Component, AttributeModifier, TabsAttribute, FP, LayoutStyle, BarMode, Column, $r, TabsController, Tabs,
  BarPosition, TabContent, Text, Color, SubTabBarStyle, BottomTabBarStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TabsTrdModifier1 implements AttributeModifier<TabsAttribute>{
    barGridAlignMarginNumber: number = 0
    barGridAlignGutterNumber: number = 0
    barGridAlignSmNumber: int = 0
    barGridAlignMdNumber: int = 0
    barGridAlignLgNumber: int = 0
    applyNormalAttribute(instance: TabsAttribute): void {

      instance.barGridAlign({

        margin: this.barGridAlignMarginNumber,

        gutter: this.barGridAlignGutterNumber,

        sm: this.barGridAlignSmNumber,

        md: this.barGridAlignMdNumber,

        lg: this.barGridAlignLgNumber
      })
    }
  }
  class TabsTrdModifier2 implements AttributeModifier<TabsAttribute>{
    barGridAlignMarginString: FP = '0.00fp'
    barGridAlignGutterString: FP = '0.00fp'
    applyNormalAttribute(instance: TabsAttribute): void {

      instance.barGridAlign({

        margin: this.barGridAlignMarginString,

        gutter: this.barGridAlignGutterString,
      })
    }
  }
  class TabsTrdModifier3 implements AttributeModifier<TabsAttribute>{
    applyNormalAttribute(instance: TabsAttribute): void {

      instance.barGridAlign({

        margin: $r('app.float.BarGridAlign_Test'),

        gutter: $r('app.float.BarGridAlign_Test'),
      })
    }
  }
  class TabsTrdModifier4 implements AttributeModifier<TabsAttribute>{
    barModeMarginNumber: number = 0
    barModeNonScrollableLayoutStyle: LayoutStyle = LayoutStyle.ALWAYS_CENTER
    barModeMode: BarMode = BarMode.Fixed
    applyNormalAttribute(instance: TabsAttribute): void {

      instance.barMode(this.barModeMode, {

        margin: this.barModeMarginNumber,

        nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle
      })
    }
  }
  @Entry
  @Component
  struct TabsExampleThird {
    private controller: TabsController = new TabsController()

    @State barGridAlignMarginNumber: number = 0
    @State barGridAlignMarginString: FP = '0.00fp'
    @State barGridAlignGutterNumber: number = 0
    @State barGridAlignGutterString: FP = '0.00fp'
    @State barGridAlignSmNumber: int = 0
    @State barGridAlignMdNumber: int = 0
    @State barGridAlignLgNumber: int = 0
    //    @State barHeightNumber: number = 0
    @State barHeightString: string = '0.00vp'
    @State barModeMode: BarMode = BarMode.Fixed
    @State barModeMarginString: FP = '0.00fp'
    @State barModeMarginNumber: number = 0
    @State barModeNonScrollableLayoutStyle: LayoutStyle = LayoutStyle.ALWAYS_CENTER
    @State subTabBarStylePaddingNumber: number = 0
    @State bottomTabBarStylePaddingNumber: number = 0
    @State subTabBarStylePaddingString: FP = '0.00fp'
    @State bottomTabBarStylePaddingString: FP = '0.00fp'
    @State modifier1: TabsTrdModifier1 = new TabsTrdModifier1()
    @State modifier2: TabsTrdModifier2 = new TabsTrdModifier2()
    @State modifier3: TabsTrdModifier3 = new TabsTrdModifier3()
    @State modifier4: TabsTrdModifier4 = new TabsTrdModifier4()

    build() {
      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
          TabContent() {
            Column(){
              Text('Tab1').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Yellow)
          }//.tabBar(SubTabBarStyle.of("tab1"))
          .key('subTabBarDefaultTest')

          TabContent() {
            Column(){
              Text('Tab2').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Pink)
          }//.tabBar(BottomTabBarStyle.of('app.media.icon', "tab2"))
          .key('bottomTabBarDefaultTest')
        }
        .vertical(false)
        .onTabBarClick((index: int) => { })
        .barMode(BarMode.Fixed)
        .key('tabsDefaultTest')

        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column(){
              Text('Tab1').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Yellow)
          }//.tabBar(SubTabBarStyle.of("tab1")
            // .padding(this.subTabBarStylePaddingNumber))
          .key('subTabBarNumberTest')

          TabContent() {
            Column(){
              Text('Tab2').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Pink)
          }//.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
            // .padding(this.bottomTabBarStylePaddingNumber))
          .key('bottomTabBarNumberTest')
        }
        .vertical(false)
        .attributeModifier(this.modifier1)
        .barMode(this.barModeMode, { margin: this.barModeMarginNumber, nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
        .key('tabsNumberTest')

        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column(){
              Text('Tab1').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Yellow)
          }//.tabBar(SubTabBarStyle.of("tab1")
            // .padding(this.subTabBarStylePaddingString))
          .key('subTabBarStringTest')

          TabContent() {
            Column(){
              Text('Tab2').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Pink)
          }//.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
            // .padding(this.bottomTabBarStylePaddingString))
          .key('bottomTabBarStringTest')
        }
        .vertical(false)
        .attributeModifier(this.modifier2)
        .barHeight(this.barHeightString)
        .barMode(this.barModeMode, { margin: this.barModeMarginString, nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
        .key('tabsStringTest')

        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column(){
              Text('Tab1').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Yellow)
          }//.tabBar(SubTabBarStyle.of("tab1")
            // .padding($r('app.float.SubTabBarStylePadding_Test')))
          .key('subTabBarResourceTest')

          TabContent() {
            Column(){
              Text('Tab2').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Pink)
          }//.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
            // .padding($r('app.float.BottomTabBarStylePadding_Test')))
          .key('bottomTabBarResourceTest')
        }
        .vertical(false)
        .attributeModifier(this.modifier3)
        .barHeight($r('app.float.BarHeight_Test'))
        .barMode(this.barModeMode, { margin: $r('app.float.BarMode_Test'), nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
        .key('tabsResourceTest')

        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column(){
              Text('Tab1').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Yellow)
          }//.tabBar(SubTabBarStyle.of("tab1")
            // .padding(this.subTabBarStylePaddingNumber))
          .key('subTabBarNumberTest')

          TabContent() {
            Column(){
              Text('Tab2').fontSize(32)
            }.width('100%').height('100%').backgroundColor(Color.Pink)
          }//.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
            // .padding(this.bottomTabBarStylePaddingNumber))
          .key('bottomTabBarNumberTest')
        }
        .vertical(false)
        .barGridAlign({
          margin: this.barGridAlignMarginNumber,
          gutter: this.barGridAlignGutterNumber,
          sm: this.barGridAlignSmNumber,
          md: this.barGridAlignMdNumber,
          lg: this.barGridAlignLgNumber
        })
        .attributeModifier(this.modifier4)
        .key('tabsBarModeTest')

      }
    }
  }