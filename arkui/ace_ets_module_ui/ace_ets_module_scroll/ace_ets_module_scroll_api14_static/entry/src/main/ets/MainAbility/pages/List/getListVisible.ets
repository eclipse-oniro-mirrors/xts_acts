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
  ForEach,
  GestureEvent,
  ItemAlign,
  List,
  ListItem,
  ListItemGroup,
  ListScroller,
  NodeContainer,
  Padding,
  Row,
  StickyStyle,
  TapGesture,
  Text,
  TextAlign,
  VisibleListContentInfo,
  Builder,
  PanGesture
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct getVisibleContentInfo {
  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(10)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '节课')
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(5)
  }

  private timeTable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    } as TimeTable,
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    } as TimeTable,
    {
      title: '星期三',
      projects: ['历史', '地理', '政治']
    } as TimeTable,
    {
      title: '星期四',
      projects: ['美术', '音乐', '体育']
    } as TimeTable
  ]
  private scroller: ListScroller = new ListScroller()
  @State listIndexInfo: VisibleListContentInfo = { index: -1 } as VisibleListContentInfo
  @State mess: string = 'null'
  @State itemBackgroundColorArr: boolean[] = new Array<boolean>(1000).fill(false)

  build() {
    Column() {
      List({ space: 5, scroller: this.scroller }) {
        ForEach(this.timeTable, (item: TimeTable, index: int) => {
          ListItemGroup({
            header: () => {
              this.itemHead(item.title)
            }, footer: () => {
              this.itemFoot(item.projects.length)
            }
          }) {
            ForEach(item.projects, (project: string, subIndex: int) => {
              ListItem() {
                Text(project)
                  .width('100%')
                  .height(50)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(this.itemBackgroundColorArr[(index * 3 + subIndex).toInt()] ? 0x68B4FF :
                    0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
        }, (item: TimeTable) => item.title)
      }
      .width('90%')
      .sticky(StickyStyle.BOTH)
      .scrollBar(BarState.Off)
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event: GestureEvent) => {
            if (event.fingerList[0] != undefined && event.fingerList[0].localX != undefined &&
              event.fingerList[0].localY != undefined) {
              this.listIndexInfo =
                this.scroller.getVisibleListContentInfo(event.fingerList[0].localX!, event.fingerList[0].localY!);
              let itemIndex: string = 'undefined';
              if (this.listIndexInfo.itemIndexInGroup != undefined) {
                itemIndex = this.listIndexInfo.itemIndexInGroup!.toString();
                if (this.listIndexInfo.index != undefined && this.listIndexInfo.index >= 0 &&
                  this.listIndexInfo.itemIndexInGroup! >= 0) {
                  this.itemBackgroundColorArr[(this.listIndexInfo.index * 3 + this.listIndexInfo.itemIndexInGroup!).toInt()] = true;
                }
              }
              this.mess = 'index:' + this.listIndexInfo.index.toString() + ' itemIndex:' + itemIndex;
            }
          })
      )

      Text('Item: ' + this.mess)
        .id('list_getMess')
        .fontColor(Color.Red)
        .height(20)

    }.width('100%')
    .height('60%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}

interface TimeTable {
  title: string;
  projects: string[];
}