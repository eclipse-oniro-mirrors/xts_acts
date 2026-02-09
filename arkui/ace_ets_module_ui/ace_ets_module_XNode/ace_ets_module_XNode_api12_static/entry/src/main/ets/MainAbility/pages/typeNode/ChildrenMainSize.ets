'use static';
/*
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
import { 
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, ListScroller, ChildrenMainSize, List,
  ForEach, BarState, ListItemAlign, ListItem,TextAlign,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ListExample {
  private arr: Array<number> = new Array<number>()
  private scroller: ListScroller = new ListScroller()
  @State listSpace: number = 10
  @State listChildrenSize: ChildrenMainSize = new ChildrenMainSize(100)
  @State text:string="init"
  aboutToAppear(){
    // 初始化数据源。
    for (let i = 0; i < 10; i++) {
      this.arr.push(i)
    }
    // 前5个item的主轴大小不是默认大小100，因此需要通过ChildrenMainSize通知List。
    this.listChildrenSize.splice(0, 5, [300, 300, 300, 300, 300])
  }
  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: 4, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item-' + item)
              .height( item < 5 ? 300 : this.listChildrenSize.childDefaultSize)
              .width('90%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        }, (item: number) => item.toString())
      }
      .backgroundColor(Color.Gray)
      .layoutWeight(1)
      .scrollBar(BarState.On)
      .childrenMainSize(this.listChildrenSize)
      .alignListItem(ListItemAlign.Center)
      Row(){
        Button('') { Text('item size + 50') }.onClick((e:ClickEvent)=>{
          this.listChildrenSize.childDefaultSize = 100
        }).height('50%').width('30%').id("ChildernMainSize_1")
        Button('') { Text('item size + 50') }.onClick((e:ClickEvent)=>{
          this.listChildrenSize.childDefaultSize = 50
        }).height('50%').width('30%').id("ChildernMainSize_2")
        Button(this.text) .onClick((e:ClickEvent)=>{
          this.text=this.listChildrenSize.childDefaultSize+""
        }).height('50%').width('30%').id("ChildernMainSize_")

        Button('') { Text('item size - 50') }
        .onClick((e:ClickEvent)=>{
          if (this.listChildrenSize.childDefaultSize === 0) {
            return
          }
          this.listChildrenSize.childDefaultSize = 50
        }).height('50%').width('30%')
        Button('') { Text('scrollTo (0, 310)') }.onClick((e:ClickEvent)=>{
          // 310: 跳转到item 1顶部与List顶部平齐的位置。
          // 如果不设置childrenMainSize，item高度不一致时scrollTo会不准确。
          this.scroller.scrollTo({xOffset: 0, yOffset: 310})
        }).height('50%').width('30%')
      }.height('20%')
    }
  }
}