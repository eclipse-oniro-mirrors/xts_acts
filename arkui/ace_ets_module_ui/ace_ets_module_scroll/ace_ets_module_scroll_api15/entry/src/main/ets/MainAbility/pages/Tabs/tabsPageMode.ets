/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { MyDataSource } from '../../../MainAbility/pages/data/BasicDataSource'
class MyTabsModifier implements AttributeModifier<TabsAttribute> {
  public isDark: boolean = false

  applyNormalAttribute(instance: TabsAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Red)
    } else {
      instance.backgroundColor(Color.Green)
    }
  }
}

@Entry
@Component
struct TabsPageFlipModeDemo1 {
  private controller: TabsController = new TabsController()
  @State selfFadingFade: boolean = false;
  private data: MyDataSource = new MyDataSource();
  @State modifier: MyTabsModifier = new MyTabsModifier()
  @State onWillShow: number = 0;
  @State onWillHide: number = 0;
  @State onChange: number = 0;
  @State currentIndex: number = 0;
  @State comingIndex: number = 0;
  @State onTabBarClick: number = 0;
  @State text1: string = '连续'
  @State PageFlipMode1: PageFlipMode = PageFlipMode.CONTINUOUS

  aboutToAppear(): void {
    for (let i = 1; i <= 10; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column({ space: 7 }) {
      Text('PageFlipMode: ' + this.text1)
      Button('单次翻页')
        .id('tabs_PageMode_single')
        .onClick(()=>{
          this.text1 = 'SINGLE'
          this.PageFlipMode1 == PageFlipMode.SINGLE
        })
      Button('连续翻页')
        .id('tabs_PageMode_continuous')
        .onClick(()=>{
          this.text1 = 'CONTINUOUS'
          this.PageFlipMode1 == PageFlipMode.CONTINUOUS
        })

      Text('' + this.onChange)
        .id('tabs_PageMode_onChange')
        .onClick(()=>{
          this.currentIndex = 0
        })

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            Text('2')
              .fontSize(25)
          }.width('100%').justifyContent(FlexAlign.Center).height('100%').backgroundColor(Color.Yellow)
        }.tabBar('2')
        .onWillShow(() => {
          this.onWillShow = 2;
        })
        .onWillHide(() => {
          this.onWillHide = 2;
        })

        TabContent() {
          Column() {
            Text('3')
          }.width('100%').justifyContent(FlexAlign.Center).height('100%').backgroundColor(Color.Blue)
        }.tabBar('3')
        .onWillShow(() => {
          this.onWillShow = 3;
        })
        .onWillHide(() => {
          this.onWillHide = 3;
        })

        TabContent() {
          Column() {
            Text('4')
          }.width('100%').justifyContent(FlexAlign.Center).height('100%').backgroundColor(Color.Green)
        }.tabBar('4')
        .onWillShow(() => {
          this.onWillShow = 4;
        })
        .onWillHide(() => {
          this.onWillHide = 4;
        })

        TabContent() {
          Column() {
            Text('5')
          }.width('100%').justifyContent(FlexAlign.Center).height('100%').backgroundColor(Color.Green)
        }.tabBar('5')
        .onWillShow(() => {
          this.onWillShow = 5;
        })
        .onWillHide(() => {
          this.onWillHide = 5;
        })
      }
      .id('tabs_pageFlipMode')
      .vertical(false)
      .attributeModifier(this.modifier)
      .pageFlipMode(this.PageFlipMode1)
      .scrollable(true)
      .barMode(BarMode.Scrollable)
      .barWidth('80%')
      .animationDuration(400)
      .fadingEdge(this.selfFadingFade)
      .width('80%')
      .height('60%')
      .onChange((index: number) => {
        this.onChange = index
      })
      .onTabBarClick((index: number) => {
        this.onTabBarClick = index
      })
      .onContentWillChange((currentIndex: number, comingIndex: number) => {
        this.currentIndex = currentIndex
        this.comingIndex = comingIndex
        return true
      })
    }
  }
}