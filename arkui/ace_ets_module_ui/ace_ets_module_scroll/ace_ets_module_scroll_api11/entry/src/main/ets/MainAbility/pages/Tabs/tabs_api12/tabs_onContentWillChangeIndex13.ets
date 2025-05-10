/*
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


@Entry
@Component
struct TabsExampleApi12I13 {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @Builder tabBuilder(title: string,targetIndex: number) {
    Column(){
      Text(title).fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Column() {
      Text(this.currentIndex + "").key("currentIndex13x")

      Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
        TabContent() {
          Column(){
            Text('首页的内容')
          }.width('100%').height('100%').backgroundColor('#00CB87').justifyContent(FlexAlign.Center).key("content13x")
        }.tabBar(this.tabBuilder('首页',0))

        TabContent() {
          Column(){
            Text('发现的内容')
          }.width('100%').height('100%').backgroundColor('#007DFF').justifyContent(FlexAlign.Center).key("content13x4")
        }.tabBar(this.tabBuilder('发现',1))

        TabContent() {
          Column(){
            Text('推荐的内容')
          }.width('100%').height('100%').backgroundColor('#FFBF00').justifyContent(FlexAlign.Center).key("content3x4")
        }.tabBar(this.tabBuilder('推荐',2))

        TabContent() {
          Column(){
            Text('我的内容')
          }.width('100%').height('100%').backgroundColor('#E67C92').justifyContent(FlexAlign.Center).key("content4x4")
        }.tabBar(this.tabBuilder('我的',3))

        TabContent() {
          Column(){
            Text('党史1949')
          }.width('100%').height('100%').backgroundColor('#E67C92').justifyContent(FlexAlign.Center).key("content5x4")
        }.tabBar(this.tabBuilder('党史1949',3))
      }
      .vertical(true)
      .barMode(BarMode.Fixed)
      .barWidth(60)
      .barHeight(360)
      .animationDuration(0)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width('90%')
      .height('60%')
      .scrollable(true)
      .backgroundColor('#F1F3F5')
      .onContentWillChange((currentIndex, comingIndex) => {
        this.currentIndex = currentIndex
        if (comingIndex == 3) {
           return false
        }
        return true
      })

      Button('动态修改index').width('50%')
        .onClick(()=>{
          this.currentIndex = (this.currentIndex + 1) % 4
        }).key("changeIndex13")

      Button('changeIndex').width('50%')
        .onClick(()=>{
          this.currentIndex = (this.currentIndex + 1) % 4
          this.controller.changeIndex(this.currentIndex)
        }).key("changeIndexTest13")
    }.width('100%')
  }
}