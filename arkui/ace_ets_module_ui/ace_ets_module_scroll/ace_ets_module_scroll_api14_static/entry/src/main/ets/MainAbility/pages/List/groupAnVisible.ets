'use static';
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
import {
  BarState,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  Flex,
  FlexDirection,
  ItemAlign,
  LazyForEach,
  List,
  ListItem,
  ListItemGroup,
  ListItemGroupStyle,
  ListItemStyle,
  ListScroller,
  NodeContainer,
  Row,
  Scroller,
  Text,
  Visibility,
  VisibleListContentInfo
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

import { MyDataSource } from '../../../MainAbility/pages/data/BasicDataSource'

class DataBean {
  value: MyDataSource<string> = new MyDataSource<string>()

  constructor(value: MyDataSource<string>) {
    this.value = value
  }
}

@Entry
@Component
struct groupAnimationVisibleExample {
  @State dataBean: MyDataSource<DataBean> = new MyDataSource<DataBean>();
  scroller: Scroller = new Scroller()
  @State mHeight: string[] = ['11%', '0%']
  @State mHeightIndex: number = 0
  @State mViewShow: Visibility[] = [Visibility.Visible, Visibility.Hidden, Visibility.None]
  @State mViewShowIndex: number = 0
  @State mViewShow1: Visibility[] = [Visibility.Visible, Visibility.Hidden, Visibility.None]
  @State mViewShowIndex1: number = 0
  @State firstViewIndex: number = 0
  @State lastViewIndex: number = 0
  @State onText: string = 'message'

  aboutToAppear(): void {
    for (let i = 1; i <= 4; i++) {
      let mList: MyDataSource<string> = new MyDataSource<string>()
      for (let j = 1; j <= 3; j++) {
        mList.pushData(j + '')
      }
      let data: DataBean = new DataBean(mList)
      this.dataBean.pushData(data)
    }

    let jsonString = JSON.stringify(this.dataBean);
    console.log('dataBean: ' + jsonString);
  }

  build() {
    Column() {
      Button('group设置显隐: ' + this.mViewShow[this.mViewShowIndex.toInt()])
        .id('group_visible_change')
        .onClick((e: ClickEvent) => {
          if (this.mViewShowIndex == 2) {
            this.mViewShowIndex = -1
          }
          this.mViewShowIndex++
        })
      Button('listItem设置显隐: ' + this.mViewShow1[this.mViewShowIndex1.toInt()])
        .id('listItem_visible_change')
        .onClick((e: ClickEvent) => {
          if (this.mViewShowIndex1 == 2) {
            this.mViewShowIndex1 = -1
          }
          this.mViewShowIndex1++
        })
      Button('scrollPage:向下带动画翻页')
        .id('visible_anTrue_group')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollPage({ next: true, animation: true })
        })

      Text(this.onText)
        .id('group_visible_mess')
      List({ scroller: this.scroller }) {
        LazyForEach(this.dataBean, (item0: DataBean, groupIndex: int) => {
          ListItemGroup({
            style: ListItemGroupStyle.CARD
          }) {
            LazyForEach(item0.value, (item: string, itemIndex: int) => {
              ListItem({
                style: ListItemStyle.CARD
              }) {
                Text('Group:' + groupIndex + ',Item:' + item + ',itemIndex:' + itemIndex)
                  .focusable(true)
              }
              .onAppear(() => {
                console.info('LIST_TEST:Group:' + item0 + ', onAppear:' + item)
              })
              .onDisAppear(() => {
                console.info('LIST_TEST:Group:' + item0 + ', onDisAppear:' + item)
              })
              .height(itemIndex % 2 == 0 ? this.mHeight[this.mHeightIndex.toInt()] : this.mHeight[0])
              .borderColor(Color.Pink)
              .borderWidth(2)
              .visibility(itemIndex % 2 == 0 ? this.mViewShow1[this.mViewShowIndex1.toInt()] : Visibility.Visible)
            }, (item: string, itemIndex: int) => item + itemIndex)
          }
          .onAppear(() => {
            console.info('LIST_TEST:Group:' + item0 + ':onAppear')
          })
          .onDisAppear(() => {
            console.info('LIST_TEST:Group:' + item0 + ':onDisAppear')
          })
          .divider({
            strokeWidth: 1,
            color: Color.Blue,
            startMargin: 12,
            endMargin: 12
          })
          .borderColor(Color.Green)
          .borderWidth(2)
          .visibility(groupIndex % 3 == 0 ? this.mViewShow[this.mViewShowIndex.toInt()] : Visibility.Visible)
        }, (item0: DataBean, groupIndex: int) => groupIndex.toString())
      }
      .width('100%')
      .height('40%')
      .backgroundColor(0xDCDCDC)
      .maintainVisibleContentPosition(true)
      .borderWidth(1)
      .onScrollIndex((firstIndex: int, lastIndex: int, centerIndex: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
        console.info('center' + centerIndex)
        this.firstViewIndex = firstIndex
        this.lastViewIndex = lastIndex
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        this.onText = 'onScrollVisibleContentChange: ' + start.index
        console.log(' start index: ' + start.index +
          ' start item group area: ' + start.itemGroupArea +
          ' start index in group: ' + start.itemIndexInGroup)
        console.log(' end index: ' + end.index +
          ' end item group area: ' + end.itemGroupArea +
          ' end index in group: ' + end.itemIndexInGroup)
      })

    }
    .width('100%')
    .height('100%')
  }
}