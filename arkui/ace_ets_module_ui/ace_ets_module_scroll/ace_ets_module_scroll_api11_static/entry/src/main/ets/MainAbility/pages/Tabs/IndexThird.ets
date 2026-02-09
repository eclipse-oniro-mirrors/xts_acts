'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import hilog from '@ohos.hilog';
import {
  Entry,
  Component,
  Margin,
  TabsController,
  FP,
  BarMode,
  LayoutStyle,
  VerticalAlign,
  LayoutMode,
  TextOverflow,
  TextHeightAdaptivePolicy,
  FontWeight,
  FontStyle,
  Column,
  Tabs,
  Button,
  BarPosition,
  TabContent,
  $r,
  Text,
  Padding,
  Color,
  SubTabBarStyle,
  BottomTabBarStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct TabsExampleThird {
  private controller: TabsController = new TabsController()
  @State barGridAlignMarginNumber: number | undefined = 0
  @State barGridAlignMarginString: FP = '0.00fp'
  @State barGridAlignGutterNumber: number | undefined = 0
  @State barGridAlignGutterString: FP = '0.00fp'
  @State barGridAlignSmNumber: number | undefined = 0
  @State barGridAlignMdNumber: number | undefined = 0
  @State barGridAlignLgNumber: number | undefined = 0
  @State barHeightString: string = '0.00vp'
  @State barModeMode: BarMode = BarMode.Fixed
  @State barModeMarginString: FP = '0.00fp'
  @State barModeMarginNumber: number | undefined = 0
  @State barModeNonScrollableLayoutStyle: LayoutStyle | undefined = LayoutStyle.ALWAYS_CENTER
  @State subTabBarStylePaddingNumber: number | undefined = 0
  @State subTabBarStylePaddingString: FP = '0.00fp'
  @State bottomTabBarStylePaddingNumber: number | undefined = 0
  @State bottomTabBarStylePaddingString: FP = '0.00fp'
  @State subTabBarStylePaddingTopNumber: number | undefined = 0
  @State subTabBarStylePaddingBottomNumber: number | undefined = 0
  @State subTabBarStylePaddingLeftNumber: number | undefined = 0
  @State subTabBarStylePaddingRightNumber: number | undefined = 0
  @State subTabBarStylePaddingTopString: string | undefined = '0.00vp'
  @State subTabBarStylePaddingBottomString: string | undefined = '0.00vp'
  @State subTabBarStylePaddingLeftString: string | undefined = '0.00vp'
  @State subTabBarStylePaddingRightString: string | undefined = '0.00vp'
  @State bottomTabBarStylePaddingTopNumber: number | undefined = 0
  @State bottomTabBarStylePaddingBottomNumber: number | undefined = 0
  @State bottomTabBarStylePaddingLeftNumber: number | undefined = 0
  @State bottomTabBarStylePaddingRightNumber: number | undefined = 0
  @State bottomTabBarStylePaddingTopString: string | undefined = '0.00vp'
  @State bottomTabBarStylePaddingBottomString: string | undefined = '0.00vp'
  @State bottomTabBarStylePaddingLeftString: string | undefined = '0.00vp'
  @State bottomTabBarStylePaddingRightString: string | undefined = '0.00vp'
  @State bottomTabBarStyleVerticalAlign: VerticalAlign = VerticalAlign.Center
  @State bottomTabBarStyleLayoutMode: LayoutMode = LayoutMode.VERTICAL
  @State bottomTabBarStyleSymmetricExtensible: boolean = false
  @State bottomTabBarStyleLabelStyleOverflow: TextOverflow | undefined = TextOverflow.Ellipsis
  @State bottomTabBarStyleLabelStyleMaxLines: number | undefined = 0
  @State bottomTabBarStyleLabelStyleMinFontSizeNumber: number | undefined = 0
  @State bottomTabBarStyleLabelStyleMinFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleMaxFontSizeNumber: number | undefined = 0
  @State bottomTabBarStyleLabelStyleMaxFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleHeightAdaptivePolicy: TextHeightAdaptivePolicy =
    TextHeightAdaptivePolicy.MAX_LINES_FIRST
  @State bottomTabBarStyleLabelStyleFontSizeNumber: number | undefined = 0
  @State bottomTabBarStyleLabelStyleFontSizeString: string = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontWeight: FontWeight = FontWeight.Normal
  @State bottomTabBarStyleLabelStyleFontWeightNumber: number | undefined = 0
  @State bottomTabBarStyleLabelStyleFontWeightString: string | undefined = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontFamilyString: string | undefined = '0.00vp'
  @State bottomTabBarStyleLabelStyleFontStyle: FontStyle | undefined = FontStyle.Normal
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("tabs page state change called:" + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>;
      if (data.has('barGridAlignMarginNumber') ) {
        if (data['barGridAlignMarginNumber']) {
          this.barGridAlignMarginNumber = data['barGridAlignMarginNumber'] as number;
        } else {
          this.barGridAlignMarginNumber = undefined
        }
      }

      if (data['barGridAlignMarginString'] != null && data['barGridAlignMarginString'] != 'null' &&
        data['barGridAlignMarginString'] != 'undefined') {
        this.barGridAlignMarginString = data['barGridAlignMarginString'] as string;
      }

      if (data.has('barGridAlignGutterNumber')) {
        if (data['barGridAlignGutterNumber']) {
          this.barGridAlignGutterNumber = data['barGridAlignGutterNumber'] as number;
        } else {
          this.barGridAlignGutterNumber = undefined
        }
      }

      if (data['barGridAlignGutterString'] != null && data['barGridAlignGutterString'] != 'null' &&
        data['barGridAlignGutterString'] != 'undefined') {
        this.barGridAlignGutterString = data['barGridAlignGutterString'] as string;
      }

      if (data.has('barGridAlignSmNumber')) {
        if (data['barGridAlignSmNumber']) {
          this.barGridAlignSmNumber = data['barGridAlignSmNumber'] as number;
        } else {
          this.barGridAlignSmNumber = undefined;
        }
      }

      if (data.has('barGridAlignMdNumber')) {
        if (data['barGridAlignMdNumber']) {
          this.barGridAlignMdNumber = data['barGridAlignMdNumber'] as number;
        } else {
          this.barGridAlignMdNumber = undefined
        }
      }

      if (data.has('barGridAlignLgNumber') != null) {
        if (data['barGridAlignLgNumber']) {
          this.barGridAlignLgNumber = data['barGridAlignLgNumber'] as number;
        } else {
          this.barGridAlignLgNumber = undefined
        }
      }

      if (data['barHeightString'] != null && data['barHeightString'] != 'null' &&
        data['barHeightString'] != 'undefined') {
        this.barHeightString = data['barHeightString'] as string;
      }

      if (data['barModeMode'] != null && data['barModeMode'] != 'null' && data['barModeMode'] != 'undefined') {
        this.barModeMode = data['barModeMode'] as BarMode;
      }

      if (data['barModeMarginString'] != null && data['barModeMarginString'] != 'null' &&
        data['barModeMarginString'] != 'undefined') {
        this.barModeMarginString = data['barModeMarginString'] as string;
      }

      if (data.has('barModeMarginNumber')) {
        if (data['barModeMarginNumber']) {
          this.barModeMarginNumber = data['barModeMarginNumber'] as number;
        } else {
          this.barModeMarginNumber = undefined;
        }
      }

      if (data.has('barModeNonScrollableLayoutStyle')) {
        if (data['barModeNonScrollableLayoutStyle']) {
          this.barModeNonScrollableLayoutStyle = data['barModeNonScrollableLayoutStyle'] as LayoutStyle;
        } else {
          this.barModeNonScrollableLayoutStyle = undefined
        }
      }

      if (data.has('subTabBarStylePaddingNumber') ) {
        if (data['subTabBarStylePaddingNumber']) {
          this.subTabBarStylePaddingNumber = data['subTabBarStylePaddingNumber'] as number;
        } else {
          this.subTabBarStylePaddingNumber = undefined
        }
      }

      if (data['subTabBarStylePaddingString'] != null && data['subTabBarStylePaddingString'] != 'null' &&
        data['subTabBarStylePaddingString'] != 'undefined') {
        this.subTabBarStylePaddingString = data['subTabBarStylePaddingString'] as string;
      }

      if (data.has('bottomTabBarStylePaddingNumber')) {
        if (data['bottomTabBarStylePaddingNumber']) {
          this.bottomTabBarStylePaddingNumber = data['bottomTabBarStylePaddingNumber'] as number;
        } else {
          this.bottomTabBarStylePaddingNumber = undefined;
        }
      }

      if (data['bottomTabBarStylePaddingString'] != null && data['bottomTabBarStylePaddingString'] != 'null' &&
        data['bottomTabBarStylePaddingString'] != 'undefined') {
        this.bottomTabBarStylePaddingString = data['bottomTabBarStylePaddingString'] as string;
      }

      if (data.has('subTabBarStylePaddingTopNumber')) {
        if (data['subTabBarStylePaddingTopNumber']) {
          this.subTabBarStylePaddingTopNumber = data['subTabBarStylePaddingTopNumber'] as number;
        } else {
          this.subTabBarStylePaddingTopNumber = undefined
        }
      }

      if (data.has('subTabBarStylePaddingBottomNumber')) {
        if (data['subTabBarStylePaddingBottomNumber']) {
          this.subTabBarStylePaddingBottomNumber = data['subTabBarStylePaddingBottomNumber'] as number;
        } else {
          this.subTabBarStylePaddingBottomNumber = undefined
        }
      }

      if (data.has('subTabBarStylePaddingLeftNumber')) {
        if (data['subTabBarStylePaddingLeftNumber']) {
          this.subTabBarStylePaddingLeftNumber = data['subTabBarStylePaddingLeftNumber'] as number;
        } else {
          this.subTabBarStylePaddingLeftNumber = undefined
        }
      }

      if (data.has('subTabBarStylePaddingRightNumber')) {
        if (data['subTabBarStylePaddingRightNumber']) {
          this.subTabBarStylePaddingRightNumber = data['subTabBarStylePaddingRightNumber'] as number;
        } else {
          this.subTabBarStylePaddingRightNumber = undefined;
        }
      }

      if (data.has('subTabBarStylePaddingTopString')) {
        if (data['subTabBarStylePaddingTopString']) {
          this.subTabBarStylePaddingTopString = data['subTabBarStylePaddingTopString'] as string;
        } else {
          this.subTabBarStylePaddingTopString = undefined;
        }
      }

      if (data.has('subTabBarStylePaddingBottomString')) {
        if (data['subTabBarStylePaddingBottomString']) {
          this.subTabBarStylePaddingBottomString = data['subTabBarStylePaddingBottomString'] as string;
        } else {
          this.subTabBarStylePaddingBottomString = undefined;
        }
      }

      if (data.has('subTabBarStylePaddingLeftString')) {
        if (data['subTabBarStylePaddingLeftString']) {
          this.subTabBarStylePaddingLeftString = data['subTabBarStylePaddingLeftString'] as string;
        } else {
          this.subTabBarStylePaddingLeftString = undefined;
        }
      }

      if (data.has('subTabBarStylePaddingRightString')) {
        if (data['subTabBarStylePaddingRightString']) {
          this.subTabBarStylePaddingRightString = data['subTabBarStylePaddingRightString'] as string;
        } else {
          this.subTabBarStylePaddingRightString = undefined;
        }
      }

      if (data.has('bottomTabBarStylePaddingTopNumber')) {
        if (data['bottomTabBarStylePaddingTopNumber']) {
          this.bottomTabBarStylePaddingTopNumber = data['bottomTabBarStylePaddingTopNumber'] as number;
        } else {
          this.bottomTabBarStylePaddingTopNumber = undefined
        }
      }

      if (data.has('bottomTabBarStylePaddingBottomNumber') ) {
        if (data['bottomTabBarStylePaddingBottomNumber']) {
          this.bottomTabBarStylePaddingBottomNumber = data['bottomTabBarStylePaddingBottomNumber'] as number;
        } else {
          this.bottomTabBarStylePaddingBottomNumber = undefined
        }

      }

      if (data.has('bottomTabBarStylePaddingLeftNumber') ) {
        if (data['bottomTabBarStylePaddingLeftNumber']) {
          this.bottomTabBarStylePaddingLeftNumber = data['bottomTabBarStylePaddingLeftNumber'] as number;
        } else {
          this.bottomTabBarStylePaddingLeftNumber = undefined
        }
      }

      if (data.has('bottomTabBarStylePaddingRightNumber')) {
        if (data['bottomTabBarStylePaddingRightNumber']) {
          this.bottomTabBarStylePaddingRightNumber = data['bottomTabBarStylePaddingRightNumber'] as number;
        } else {
          this.bottomTabBarStylePaddingRightNumber = undefined;
        }

      }

      if (data.has('bottomTabBarStylePaddingTopString')) {
        if (data['bottomTabBarStylePaddingTopString']) {
          this.bottomTabBarStylePaddingTopString = data['bottomTabBarStylePaddingTopString'] as string;
        } else {
          this.bottomTabBarStylePaddingTopString = undefined;
        }
      }

      if (data.has('bottomTabBarStylePaddingBottomString')) {
        if (data['bottomTabBarStylePaddingBottomString']) {
          this.bottomTabBarStylePaddingBottomString = data['bottomTabBarStylePaddingBottomString'] as string;
        } else {
          this.bottomTabBarStylePaddingBottomString = undefined;
        }
      }

      if (data.has('bottomTabBarStylePaddingLeftString')) {
        if (data['bottomTabBarStylePaddingLeftString']) {
          this.bottomTabBarStylePaddingLeftString = data['bottomTabBarStylePaddingLeftString'] as string;
        } else {
          this.bottomTabBarStylePaddingLeftString = undefined;
        }
      }

      if (data.has('bottomTabBarStylePaddingRightString')) {
        if (data['bottomTabBarStylePaddingRightString']) {
          this.bottomTabBarStylePaddingRightString = data['bottomTabBarStylePaddingRightString'] as string;
        } else {
          this.bottomTabBarStylePaddingRightString = undefined;
        }
      }

      if (data.has('bottomTabBarStyleVerticalAlign')) {
        if (data['bottomTabBarStyleVerticalAlign']) {
          this.bottomTabBarStyleVerticalAlign = data['bottomTabBarStyleVerticalAlign'] as VerticalAlign;
        } else {
          this.bottomTabBarStyleVerticalAlign = VerticalAlign.Center
        }
      }

      if (data.has('bottomTabBarStyleLayoutMode') ) {
        if (data['bottomTabBarStyleLayoutMode']) {
          this.bottomTabBarStyleLayoutMode = data['bottomTabBarStyleLayoutMode'] as LayoutMode;
        } else {
          this.bottomTabBarStyleLayoutMode = LayoutMode.VERTICAL
        }
      }

      if (data['bottomTabBarStyleSymmetricExtensible'] != null &&
        data['bottomTabBarStyleSymmetricExtensible'] != 'null' &&
        data['bottomTabBarStyleSymmetricExtensible'] != 'undefined') {
        this.bottomTabBarStyleSymmetricExtensible = data['bottomTabBarStyleSymmetricExtensible'] as boolean;
      }

      if (data.has('bottomTabBarStyleLabelStyleOverflow') ) {
        if (data['bottomTabBarStyleLabelStyleOverflow']) {
          this.bottomTabBarStyleLabelStyleOverflow = data['bottomTabBarStyleLabelStyleOverflow'] as TextOverflow;
        } else {
          this.bottomTabBarStyleLabelStyleOverflow = undefined
        }
      }

      if (data.has('bottomTabBarStyleLabelStyleMaxLines')) {
        if (data['bottomTabBarStyleLabelStyleMaxLines']) {
          this.bottomTabBarStyleLabelStyleMaxLines = data['bottomTabBarStyleLabelStyleMaxLines'] as number;
        } else {
          this.bottomTabBarStyleLabelStyleMaxLines = undefined;
        }
      }

      if (data.has('bottomTabBarStyleLabelStyleMinFontSizeNumber')) {
        if (data['bottomTabBarStyleLabelStyleMinFontSizeNumber']) {
          this.bottomTabBarStyleLabelStyleMinFontSizeNumber =
            data['bottomTabBarStyleLabelStyleMinFontSizeNumber'] as number;
        } else {
          this.bottomTabBarStyleLabelStyleMinFontSizeNumber = undefined;
        }
      }

      if (data['bottomTabBarStyleLabelStyleMinFontSizeString'] != null &&
        data['bottomTabBarStyleLabelStyleMinFontSizeString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMinFontSizeString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMinFontSizeString =
          data['bottomTabBarStyleLabelStyleMinFontSizeString'] as string;
      }

      if (data.has('bottomTabBarStyleLabelStyleMaxFontSizeNumber')) {
        if (data['bottomTabBarStyleLabelStyleMaxFontSizeNumber']) {
          this.bottomTabBarStyleLabelStyleMaxFontSizeNumber =
            data['bottomTabBarStyleLabelStyleMaxFontSizeNumber'] as number;
        } else {
          this.bottomTabBarStyleLabelStyleMaxFontSizeNumber = undefined;
        }
      }

      if (data['bottomTabBarStyleLabelStyleMaxFontSizeString'] != null &&
        data['bottomTabBarStyleLabelStyleMaxFontSizeString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleMaxFontSizeString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleMaxFontSizeString =
          data['bottomTabBarStyleLabelStyleMaxFontSizeString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] != null &&
        data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] != 'null' &&
        data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleHeightAdaptivePolicy =
          data['bottomTabBarStyleLabelStyleHeightAdaptivePolicy'] as TextHeightAdaptivePolicy;
      }

      if (data.has('bottomTabBarStyleLabelStyleFontSizeNumber')) {
        if (data['bottomTabBarStyleLabelStyleFontSizeNumber']) {
          this.bottomTabBarStyleLabelStyleFontSizeNumber = data['bottomTabBarStyleLabelStyleFontSizeNumber'] as number;
        } else {
          this.bottomTabBarStyleLabelStyleFontSizeNumber = undefined;
        }
      }

      if (data['bottomTabBarStyleLabelStyleFontSizeString'] != null &&
        data['bottomTabBarStyleLabelStyleFontSizeString'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontSizeString'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontSizeString = data['bottomTabBarStyleLabelStyleFontSizeString'] as string;
      }

      if (data['bottomTabBarStyleLabelStyleFontWeight'] != null &&
        data['bottomTabBarStyleLabelStyleFontWeight'] != 'null' &&
        data['bottomTabBarStyleLabelStyleFontWeight'] != 'undefined') {
        this.bottomTabBarStyleLabelStyleFontWeight = data['bottomTabBarStyleLabelStyleFontWeight'] as FontWeight;
      }

      if (data.has('bottomTabBarStyleLabelStyleFontWeightNumber')) {
        if (data['bottomTabBarStyleLabelStyleFontWeightNumber']) {
          this.bottomTabBarStyleLabelStyleFontWeightNumber =
            data['bottomTabBarStyleLabelStyleFontWeightNumber'] as number;
        } else {
          this.bottomTabBarStyleLabelStyleFontWeightNumber = undefined
        }
      }

      if (data.has('bottomTabBarStyleLabelStyleFontWeightString') ) {
        if (data['bottomTabBarStyleLabelStyleFontWeightString']) {
          this.bottomTabBarStyleLabelStyleFontWeightString =
            data['bottomTabBarStyleLabelStyleFontWeightString'] as string;
        } else {
          this.bottomTabBarStyleLabelStyleFontWeightString = undefined
        }
      }

      if (data.has('bottomTabBarStyleLabelStyleFontFamilyString')) {
        if (data['bottomTabBarStyleLabelStyleFontFamilyString']) {
          this.bottomTabBarStyleLabelStyleFontFamilyString =
            data['bottomTabBarStyleLabelStyleFontFamilyString'] as string;
        } else {
          this.bottomTabBarStyleLabelStyleFontFamilyString = undefined
        }

      }

      if (data.has('bottomTabBarStyleLabelStyleFontStyle')) {
        if (data['bottomTabBarStyleLabelStyleFontStyle']) {
          this.bottomTabBarStyleLabelStyleFontStyle = data['bottomTabBarStyleLabelStyleFontStyle'] as FontStyle;
        } else {
          this.bottomTabBarStyleLabelStyleFontStyle = undefined;
        }

      }
    }
  }

  aboutToAppear() {
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
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of("tab1"))
        .key('subTabBarDefaultTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab2"))
        .key('bottomTabBarDefaultTest')
      }
      .vertical(false)
      .onTabBarClick((index: int): void => {
      })
      .barMode(BarMode.Fixed)
      .key('tabsDefaultTest')

      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar("tab1")

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab2"))
        .key('bottomTabBarDefaultTestJudge')
      }
      .vertical(false)
      .scrollable(true)
      .barWidth(350)
      .barHeight(70)
      .animationDuration(200)
      .height('90%')
      .width('90%')
      .onTabBarClick((index: int): void => {
      })
      .key('onTabBarClickTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        // padding 不能直接传值undefined，和1.1需判断
        .tabBar(this.subTabBarStylePaddingNumber == undefined ? SubTabBarStyle.of("tab1") : SubTabBarStyle.of("tab1")
          .padding(this.subTabBarStylePaddingNumber!)
        )
        .key('subTabBarNumberTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(this.bottomTabBarStylePaddingNumber != undefined ? BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding(this.bottomTabBarStylePaddingNumber!) : BottomTabBarStyle.of('app.media.icon', "tab1")
        )
        .key('bottomTabBarNumberTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: this.barGridAlignMarginNumber,
        gutter: this.barGridAlignGutterNumber,
        sm: this.barGridAlignSmNumber?.toInt(),
        md: this.barGridAlignMdNumber?.toInt(),
        lg: this.barGridAlignLgNumber?.toInt()
      })
      .barMode(this.barModeMode,
        { margin: this.barModeMarginNumber, nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
      .key('tabsNumberTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of("tab1")
          .padding(this.subTabBarStylePaddingString))
        .key('subTabBarStringTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding(this.bottomTabBarStylePaddingString))
        .key('bottomTabBarStringTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: this.barGridAlignMarginString,
        gutter: this.barGridAlignGutterString,
      })
      .barHeight(this.barHeightString)
      .barMode(this.barModeMode,
        { margin: this.barModeMarginString, nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
      .key('tabsStringTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of("tab1")
          .padding($r('app.float.SubTabBarStylePadding_Test')))
        .key('subTabBarResourceTest')

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding($r('app.float.BottomTabBarStylePadding_Test')))
        .key('bottomTabBarResourceTest')
      }
      .vertical(false)
      .barGridAlign({
        margin: $r('app.float.BarGridAlign_Test'),
        gutter: $r('app.float.BarGridAlign_Test'),
      })
      .barHeight($r('app.float.BarHeight_Test'))
      .barMode(this.barModeMode,
        { margin: $r('app.float.BarMode_Test'), nonScrollableLayoutStyle: this.barModeNonScrollableLayoutStyle })
      .key('tabsResourceTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }

        TabContent() {
          Column() {
            Text('Tab2').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Pink)
        }
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .key('marginPadding')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding({
            top: this.subTabBarStylePaddingTopNumber,
            bottom: this.subTabBarStylePaddingBottomNumber,
            left: this.subTabBarStylePaddingLeftNumber,
            right: this.subTabBarStylePaddingRightNumber
          } as Padding))
        .key('subTabBarStylePaddingNumberTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding({
            top: this.subTabBarStylePaddingTopString,
            bottom: this.subTabBarStylePaddingBottomString,
            left: this.subTabBarStylePaddingLeftString,
            right: this.subTabBarStylePaddingRightString
          } as Padding))
        .key('subTabBarStylePaddingStringTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(SubTabBarStyle.of("tab1")
          .padding({
            top: $r('app.float.SubTabBarStylePadding_Test'),
            bottom: $r('app.float.SubTabBarStylePadding_Test'),
            left: $r('app.float.SubTabBarStylePadding_Test'),
            right: $r('app.float.SubTabBarStylePadding_Test')
          } as Padding))
        .key('subTabBarStylePaddingResourceTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding({
            top: this.bottomTabBarStylePaddingTopNumber,
            bottom: this.bottomTabBarStylePaddingBottomNumber,
            left: this.bottomTabBarStylePaddingLeftNumber,
            right: this.bottomTabBarStylePaddingRightNumber
          } as Padding))
        .key('bottomTabBarStylePaddingNumberTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding({
            top: this.bottomTabBarStylePaddingTopString,
            bottom: this.bottomTabBarStylePaddingBottomString,
            left: this.bottomTabBarStylePaddingLeftString,
            right: this.bottomTabBarStylePaddingRightString
          } as Padding))
        .key('bottomTabBarStylePaddingStringTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .padding({
            top: $r('app.float.BottomTabBarStylePadding_Test'),
            bottom: $r('app.float.BottomTabBarStylePadding_Test'),
            left: $r('app.float.BottomTabBarStylePadding_Test'),
            right: $r('app.float.BottomTabBarStylePadding_Test')
          } as Padding))
        .key('bottomTabBarStylePaddingResourceTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .verticalAlign(this.bottomTabBarStyleVerticalAlign))
        .key('bottomTabBarStyleVerticalAlignTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .layoutMode(this.bottomTabBarStyleLayoutMode))
        .key('bottomTabBarStyleLayoutModeTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .symmetricExtensible(this.bottomTabBarStyleSymmetricExtensible))
        .key('bottomTabBarStyleSymmetricExtensibleTest')
      }
      .barMode(BarMode.Fixed)

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle(
            {
              overflow: this.bottomTabBarStyleLabelStyleOverflow,
              maxLines: this.bottomTabBarStyleLabelStyleMaxLines?.toInt(),
              heightAdaptivePolicy: this.bottomTabBarStyleLabelStyleHeightAdaptivePolicy,
              font: {
                size: $r('sys.float.ohos_id_text_size_caption'),
                weight: this.bottomTabBarStyleLabelStyleFontWeight,
                style: this.bottomTabBarStyleLabelStyleFontStyle
              }
            }))
        .key('bottomTabBarStyleLabelStyleTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle({
            minFontSize: this.bottomTabBarStyleLabelStyleMinFontSizeNumber,
            maxFontSize: this.bottomTabBarStyleLabelStyleMaxFontSizeNumber,
            font: {
              size: this.bottomTabBarStyleLabelStyleFontSizeNumber,
              weight: this.bottomTabBarStyleLabelStyleFontWeightNumber?.toInt(),
            }
          }))
        .key('bottomTabBarStyleLabelStyleNumberTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle({
            minFontSize: this.bottomTabBarStyleLabelStyleMinFontSizeString,
            maxFontSize: this.bottomTabBarStyleLabelStyleMaxFontSizeString,
            font: {
              size: this.bottomTabBarStyleLabelStyleFontSizeString,
              weight: this.bottomTabBarStyleLabelStyleFontWeightString,
              family: this.bottomTabBarStyleLabelStyleFontFamilyString,
            }
          }))
        .key('bottomTabBarStyleLabelStyleStringTest')
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('Tab1').fontSize(32)
          }.width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar(BottomTabBarStyle.of('app.media.icon', "tab1")
          .labelStyle({
            minFontSize: ($r('app.float.BottomTabBarStyleLabelStyle_minFontSize_Test')),
            maxFontSize: ($r('app.float.BottomTabBarStyleLabelStyle_maxFontSize_Test')),
            font: {
              size: ($r('app.float.BottomTabBarStyleLabelStyle_Font_Size_Test')),
              family: ($r('app.string.BottomTabBarStyleLabelStyle_family_Test'))
            }
          }))
        .key('bottomTabBarStyleLabelStyleResourceTest')
      }

      Button("Top")
        .width($r('sys.float.ohos_id_subtab_top_padding'))
        .key("subTabBarDefaultTestTopJudge")

      Button("Right")
        .width($r('sys.float.ohos_id_subtab_horizontal_padding'))
        .key("subTabBarDefaultTestRightJudge")

      Button("Bottom")
        .width($r('sys.float.ohos_id_subtab_bottom_padding'))
        .key("subTabBarDefaultTestBottomJudge")

      Button("Left")
        .width($r('sys.float.ohos_id_subtab_horizontal_padding'))
        .key("subTabBarDefaultTestLeftJudge")

    }
  }
}