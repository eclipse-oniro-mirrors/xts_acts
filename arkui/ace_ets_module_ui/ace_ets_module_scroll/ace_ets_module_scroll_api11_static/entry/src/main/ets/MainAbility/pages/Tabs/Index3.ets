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
import hilog from '@ohos.hilog';
import {
  Entry,
  Component,
  Margin,
  TabsController,
  Resource,
  Color,
  SelectedMode,
  Column,
  $r,
  Tabs,
  BarPosition,
  TabContent,
  BarMode,
  SubTabBarStyle,
  TextOverflow,
  TextHeightAdaptivePolicy,
  DividerStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct TabsExample {
  private controller: TabsController = new TabsController()
  private controller2: TabsController = new TabsController()
  private controller3: TabsController = new TabsController()
  private controller4: TabsController = new TabsController()
  @State strokeWidthStr: string = '10px'
  @State dividerColorStr: string = 'red'
  @State startMarginStr: string = '5px'
  @State endMarginStr: string = '5px'
  @State nullFlag: boolean = false
  @State strokeWidthNum: number = 10
  @State dividerColorNum: number = 0xFF0000
  @State startMarginNum: number = 5
  @State endMarginNum: number = 5
  @State strokeWidthRes: Resource = $r("app.string.Divider_Stroke_Width")
  @State dividerColorRes: Resource = $r("app.color.Divider_Color")
  @State startMarginRes: Resource = $r("app.string.Divider_Start_Margin")
  @State endMarginRes: Resource = $r("app.string.Divider_End_Margin")
  @State dividerColor: Color = Color.Red
  @State overflowFlag: boolean = false
  @State selfIndicatorColor: Color | string = Color.Red
  @State selfIndicatorHeight: number = 10
  @State selfIndicatorWidth: number = 30
  @State selfIndicatorBorderRadius: number = 5
  @State selfSubTabBorderRadius: number = 20
  @State selfMarginTop: number = 10
  @State selfIndicatorColorStr: string = "#FFFF0000"
  @State selfIndicatorHeightStr: string = "10vp"
  @State selfIndicatorWidthStr: string = "30vp"
  @State selfIndicatorBorderRadiusStr: string = "5vp"
  @State selfSubTabBorderRadiusStr: string = "20vp"
  @State selfMarginTopStr: string = "10vp"
  @State defaultDividerColor: Resource = $r("sys.color.ohos_id_color_list_separator")
  @State defaultIndicatorColor: Resource = $r("sys.color.ohos_id_color_subtab_line_on")
  @State defaultIndicatorMarginTop: Resource = $r("sys.float.ohos_id_subtab_line_gap")
  @State defaultIndicatorHeight: Resource = $r("sys.float.ohos_id_subtab_line_height")
  @State defaultSubTabBorderRadius: Resource = $r("sys.float.ohos_id_corner_radius_clicked")
  @State defaultSubTabTextSize: Resource = $r("sys.float.ohos_id_text_size_body1")
  @State selfSelectedMode: SelectedMode = SelectedMode.INDICATOR
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("tabs page state change called:" + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>
      if (data['dividerColorStr'] != null) {
        this.dividerColorStr = data['dividerColorStr'] as string;
      }
      if (data['strokeWidthStr'] != null) {
        this.strokeWidthStr = data['strokeWidthStr'] as string;
      }
      if (data['startMarginStr'] != null) {
        this.startMarginStr = data['startMarginStr'] as string;
      }
      if (data['endMarginStr'] != null) {
        this.endMarginStr = data['endMarginStr'] as string;
      }
      if (data['nullFlag'] != null) {
        this.nullFlag = data['nullFlag'] as boolean;
      }
      if (data['dividerColor'] != null) {
        this.dividerColor = data['dividerColor'] as Color;
      }
      if (data['strokeWidthNum'] != null) {
        this.strokeWidthNum = data['strokeWidthNum'] as number;
      }
      if (data['startMarginNum'] != null) {
        this.startMarginNum = data['startMarginNum'] as number;
      }
      if (data['endMarginNum'] != null) {
        this.endMarginNum = data['endMarginNum'] as number;
      }

      if (data['dividerColorRes'] != null) {
        this.dividerColorRes = data['dividerColorRes'] as Resource;
      }
      if (data['strokeWidthRes'] != null) {
        this.strokeWidthRes = data['strokeWidthRes'] as Resource;
      }
      if (data['startMarginRes'] != null) {
        this.startMarginRes = data['startMarginRes'] as Resource;
      }
      if (data['endMarginRes'] != null) {
        this.endMarginRes = data['endMarginRes'] as Resource;
      }

      if (data['overflowFlag'] != null) {
        this.overflowFlag = data['overflowFlag'] as boolean;
      }

      if (data['selfIndicatorColor'] != null) {
        if (data['selfIndicatorColor'] instanceof string) {
          this.selfIndicatorColor = data['selfIndicatorColor'] as string;
        } else {
          this.selfIndicatorColor = data['selfIndicatorColor'] as Color;
        }
      }

      if (data['selfIndicatorHeight'] != null) {
        this.selfIndicatorHeight = data['selfIndicatorHeight'] as number;
      }

      if (data['selfIndicatorWidth'] != null) {
        this.selfIndicatorWidth = data['selfIndicatorWidth'] as number;
      }

      if (data['selfIndicatorBorderRadius'] != null) {
        this.selfIndicatorBorderRadius = data['selfIndicatorBorderRadius'] as number;
      }

      if (data['selfSelectedMode'] != null) {
        this.selfSelectedMode = data['selfSelectedMode'] as SelectedMode;
      }

      if (data['selfSubTabBorderRadius'] != null) {
        this.selfSubTabBorderRadius = data['selfSubTabBorderRadius'] as number;
      }

      if (data['selfMarginTop'] != null) {
        this.selfMarginTop = data['selfMarginTop'] as number;
      }

      if (data['selfIndicatorColorStr'] != null) {
        this.selfIndicatorColorStr = data['selfIndicatorColorStr'] as string;
      }

      if (data['selfIndicatorHeightStr'] != null) {
        this.selfIndicatorHeightStr = data['selfIndicatorHeightStr'] as string;
      }

      if (data['selfIndicatorWidthStr'] != null) {
        this.selfIndicatorWidthStr = data['selfIndicatorWidthStr'] as string;
      }

      if (data['selfIndicatorBorderRadiusStr'] != null) {
        this.selfIndicatorBorderRadiusStr = data['selfIndicatorBorderRadiusStr'] as string;
      }

      if (data['selfSubTabBorderRadiusStr'] != null) {
        this.selfSubTabBorderRadiusStr = data['selfSubTabBorderRadiusStr'] as string;
      }

      if (data['selfMarginTopStr'] != null) {
        this.selfMarginTopStr = data['selfMarginTopStr'] as string;
      }
    }
  }

  onPageShow() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }
        .tabBar(SubTabBarStyle.of('pink')
          .indicator({
            color: this.selfIndicatorColor,
            height: this.selfIndicatorHeight,
            width: this.selfIndicatorWidth,
            borderRadius: this.selfIndicatorBorderRadius,
            marginTop: this.selfMarginTop
          })
          .selectedMode(this.selfSelectedMode)
          .board({ borderRadius: this.selfSubTabBorderRadius })
          .labelStyle({
            overflow: TextOverflow.Ellipsis,
            maxLines: 1,
            minFontSize: 5,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
            font: { size: 15 }
          }))
        .key('indicatorTest1')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }
        .tabBar(SubTabBarStyle.of('pink')
          .indicator({
            color: this.selfIndicatorColorStr,
            height: this.selfIndicatorHeightStr,
            width: this.selfIndicatorWidthStr,
            borderRadius: this.selfIndicatorBorderRadiusStr,
            marginTop: this.selfMarginTopStr
          })
          .selectedMode(this.selfSelectedMode)
          .board({ borderRadius: this.selfSubTabBorderRadiusStr })
          .labelStyle({
            overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 5,
            maxFontSize: 20,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST,
            font: { size: 15 }
          }))
        .key('indicatorTest2')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }
        .tabBar(SubTabBarStyle.of('pink')
          .indicator({
            color: $r("app.color.Indicator_Color"),
            height: $r("app.string.Indicator_Height"),
            width: $r("app.string.Indicator_Width"),
            borderRadius: $r("app.string.Indicator_Radius"),
            marginTop: $r("app.string.Indicator_Space")
          })
          .selectedMode(this.selfSelectedMode)
          .board({ borderRadius: $r("app.string.Indicator_Sub_Radius") })
          .labelStyle({
            overflow: TextOverflow.None,
            maxLines: 2,
            minFontSize: 5,
            maxFontSize: 20,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST,
            font: { size: 15 }
          }))
        .key('indicatorTest3')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of('pink')
          .indicator({
            color: 0xFF0000,
          })
          .selectedMode(this.selfSelectedMode)
          .board({ borderRadius: this.selfSubTabBorderRadius })
          .labelStyle({
            overflow: TextOverflow.None,
            maxLines: 10,
            minFontSize: 5,
            maxFontSize: 20,
            heightAdaptivePolicy: TextHeightAdaptivePolicy.MAX_LINES_FIRST,
            font: { size: 15 }
          }))
        .key('indicatorTest4')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of('pink'))
        .key('indicatorTest5')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(SubTabBarStyle.of('pink')
          .labelStyle({
            overflow: undefined,
            maxLines: undefined,
            minFontSize: undefined,
            maxFontSize: undefined,
            heightAdaptivePolicy: undefined,
            font: {
              size: undefined,
              weight: undefined,
              family: undefined,
              style: undefined
            }
          }))
        .key('indicatorTest6')
      }
      .vertical(true)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      // .barWidth(70)
      // .barHeight('100%')
      .animationDuration(400)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .height('200vp')
      .width('90%')
      .divider(this.nullFlag ? null : {
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColorStr,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      } as DividerStyle)

      .fadingEdge(this.overflowFlag)
      .key('tabsTest')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller2 }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')
      }
      .vertical(true)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      // .barWidth(70)
      // .barHeight('100%')
      .animationDuration(400)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .height('200vp')
      .width('90%')
      .divider({
        strokeWidth: this.strokeWidthNum,
        color: this.dividerColorNum.toInt(),
        startMargin: this.startMarginNum,
        endMargin: this.endMarginNum
      })
      .key('tabsTest2')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller3 }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')
      }
      .vertical(true)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      // .barWidth(70)
      // .barHeight('100%')
      .animationDuration(400)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .height('200vp')
      .width('90%')
      .divider({
        strokeWidth: this.strokeWidthRes,
        color: this.dividerColorRes,
        startMargin: this.startMarginRes,
        endMargin: this.endMarginRes
      })
      .key('tabsTest3')


      Tabs({ barPosition: BarPosition.Start, controller: this.controller4 }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')
      }
      .vertical(true)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      // .barWidth(70)
      // .barHeight('100%')
      .animationDuration(400)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .height('200vp')
      .width('90%')
      .divider({
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColor,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      })
      .key('tabsTest4')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller4 }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')
      }
      .vertical(true)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      // .barWidth(70)
      // .barHeight('100%')
      .animationDuration(400)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .height('200vp')
      .width('90%')
      .key('tabsTest5')

      Tabs({ barPosition: BarPosition.Start, controller: this.controller2 }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }
        .key('defaultSubTab')
        .tabBar(SubTabBarStyle.of('pink')
          .indicator({
            marginTop: this.defaultIndicatorMarginTop,
            color: this.defaultIndicatorColor,
            height: this.defaultIndicatorHeight
          })
          .board({
            borderRadius: this.defaultSubTabBorderRadius
          })
          .labelStyle({
            font: { size: this.defaultSubTabTextSize }
          })
        )

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')
      }
      .vertical(true)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      // .barWidth(70)
      // .barHeight('100%')
      .animationDuration(400)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .divider({
        strokeWidth: '1vp',
        color: this.defaultDividerColor
      })
      .height('200vp')
      .width('90%')
      .key('defaultTabs')

    }
  }
}