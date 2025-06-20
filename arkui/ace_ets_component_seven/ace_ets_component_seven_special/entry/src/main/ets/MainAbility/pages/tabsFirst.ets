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

class TabsFirModifier1 implements AttributeModifier<TabsAttribute> {
    strokeWidthStr: string = '10px'
    dividerColorStr: string = 'red'
    startMarginStr: string = '5px'
    endMarginStr: string = '5px'
    nullFlag: boolean = false
  
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.divider(null)
    }
  }
  
  class TabsFirModifier2 implements AttributeModifier<TabsAttribute> {
    nullFlag: boolean = false
    strokeWidthNum: number = 10
    dividerColorNum: number = 0xFF0000
    startMarginNum: number = 5
    endMarginNum: number = 5
  
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.divider({
        strokeWidth: this.strokeWidthNum,
        color: this.dividerColorNum,
        startMargin: this.startMarginNum,
        endMargin: this.endMarginNum
      })
    }
  }
  
  class TabsFirModifier3 implements AttributeModifier<TabsAttribute> {
    strokeWidthRes: Resource = $r("app.string.Divider_Stroke_Width")
    dividerColorRes: Resource = $r("app.color.Divider_Color")
    startMarginRes: Resource = $r("app.string.Divider_Start_Margin")
    endMarginRes: Resource = $r("app.string.Divider_End_Margin")
  
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.divider({
        strokeWidth: this.strokeWidthRes,
        color: this.dividerColorRes,
        startMargin: this.startMarginRes,
        endMargin: this.endMarginRes
      })
    }
  }
  
  class TabsFirModifier4 implements AttributeModifier<TabsAttribute> {
    strokeWidthStr: string = '10px'
    startMarginStr: string = '5px'
    endMarginStr: string = '5px'
    dividerColor: Color = Color.Red
  
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.divider({
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColor,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      })
    }
  }
  
  @Entry
  @Component
  struct TabsExample {
    private controller: TabsController = new TabsController()
    private controller2: TabsController = new TabsController()
    private controller3: TabsController = new TabsController()
    private controller4: TabsController = new TabsController()
    @State overflowFlag: boolean = false
    @State selfSubTabBorderRadius: number = 20
    // @State selfMarginTop: number = 10
    // @State selfSubTabBorderRadiusStr: string = "20vp"
    // @State selfMarginTopStr: string = "10vp"
    @State defaultDividerColor: Resource = $r("sys.color.ohos_id_color_list_separator")
    @State defaultIndicatorColor: Resource = $r("sys.color.ohos_id_color_subtab_line_on")
    @State defaultIndicatorMarginTop: Resource = $r("sys.float.ohos_id_subtab_line_gap")
    @State defaultIndicatorHeight: Resource = $r("sys.float.ohos_id_subtab_line_height")
    @State defaultSubTabBorderRadius: Resource = $r("sys.float.ohos_id_corner_radius_clicked")
    @State defaultSubTabTextSize: Resource = $r("sys.float.ohos_id_text_size_body1")
    @State selfSelectedMode: SelectedMode = SelectedMode.INDICATOR
    @State modifier1: TabsFirModifier1 = new TabsFirModifier1()
    @State modifier2: TabsFirModifier2 = new TabsFirModifier2()
    @State modifier3: TabsFirModifier3 = new TabsFirModifier3()
    @State modifier4: TabsFirModifier4 = new TabsFirModifier4()
  
    build() {
      Column() {
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar(SubTabBarStyle.of('pink')
          ).key('indicatorTest1')
  
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar(SubTabBarStyle.of('pink')
          ).key('indicatorTest2')
  
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
              overflow: null,
              maxLines: null,
              minFontSize: null,
              maxFontSize: null,
              heightAdaptivePolicy: null,
              font: { size: null, weight: null, family: null, style: null }
            }))
          .key('indicatorTest6')
        }
        .vertical(true)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .barWidth(70)
        .barHeight('100%')
        .animationDuration(400)
        .onChange((index: number) => {
          console.info(index.toString())
        })
        .height('200vp')
        .width('90%')
        .attributeModifier(this.modifier1)
        .fadingEdge(this.overflowFlag)
        .key('tabsTest1')
  
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
        .barWidth(70)
        .barHeight('100%')
        .animationDuration(400)
        .onChange((index: number) => {
          console.info(index.toString())
        })
        .height('200vp')
        .width('90%')
        .attributeModifier(this.modifier2)
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
        .barWidth(70)
        .barHeight('100%')
        .animationDuration(400)
        .onChange((index: number) => {
          console.info(index.toString())
        })
        .height('200vp')
        .width('90%')
        .attributeModifier(this.modifier3)
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
        .barWidth(70)
        .barHeight('100%')
        .animationDuration(400)
        .onChange((index: number) => {
          console.info(index.toString())
        })
        .height('200vp')
        .width('90%')
        .attributeModifier(this.modifier4)
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
        .barWidth(70)
        .barHeight('100%')
        .animationDuration(400)
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
        .barWidth(70)
        .barHeight('100%')
        .animationDuration(400)
        .onChange((index: number) => {
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