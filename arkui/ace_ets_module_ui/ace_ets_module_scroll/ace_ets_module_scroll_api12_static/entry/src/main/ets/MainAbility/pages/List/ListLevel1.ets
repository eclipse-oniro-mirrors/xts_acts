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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Component,
  List,
  ColumnOptions,
  ListItem,
  Text,
  Column,
  Button,
  Margin,
  ForEach,
  ClickEvent,
  Color,
  Axis,
  BarState,
  ListScroller,
  RectResult,
  Scroll,
  Row,
  Builder,
  TextAlign,
  FlexAlign,
  SwipeEdgeEffect,
  EdgeEffect
} from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ListLevel1 {
  private arr1: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  private listScroller: ListScroller = new ListScroller();
  @State listDirection: Axis = Axis.Vertical;
  @State text: number = 0
  @State isShowRect: boolean = false
  @State itemRect: RectResult = {
    x: 0,
    y: 0,
    width: 0,
    height: 0
  } as RectResult
  @State isShowOffset: boolean = false
  @StoragePropRef('xoffset') xoffset: number = 0
  @StoragePropRef('yoffset') yoffset: number = 0
  @StoragePropRef('padding') num: number | string = 0
  @StoragePropRef('strokeWidth') strokeWidth: number = 2.000000;
  @StoragePropRef('startMargin') startMargin: number | string = 10.000000;
  @StoragePropRef('endMargin') endMargin: number | string = 10.000000;
  @StoragePropRef('contentStartOffset') contentStartOffset: number = 10.000000;
  @StoragePropRef('contentEndOffset') contentEndOffset: number = 10.000000;
  @StoragePropRef('startDeleteAreaDistance') startDeleteAreaDistance: number | string = 80;
  @StoragePropRef('endDeleteAreaDistance') endDeleteAreaDistance: number | string = 80;

  onPageShow() {
    console.info('[list] page show called');
  }

  @Builder
  pixelMapBuilder() {
    Column() {
      Text(`${this.text}`)
        .width('50%')
        .height(60)
        .fontSize(16)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
    }
  }

  @Builder
  itemEnd(item: number) {
    Row() {
      Button('删除').margin('4vp').onClick(() => {
        let index = this.arr1.indexOf(item)
        this.arr1.splice(index, 1)
      })
      Button('取消').margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly).width(0)
  }

  build() {
    Scroll() {
      Column() {
        if (this.isShowRect) {
          Text('itemRectY:' + Math.round(this.itemRect.y)).id('itemRectY')
          Text('itemRectWidth:' + Math.round(this.itemRect.width)).id('itemRectWidth')
          Text('itemRectHeight:' + Math.round(this.itemRect.height)).id('itemRectHeight')
        }
        if (this.isShowOffset) {
          Text('xoffset:' + Math.round(this.xoffset)).id('xoffset')
          Text('yoffset:' + Math.round(this.yoffset)).id('yoffset')
        }

        Button('GetItemRect')
          .onClick(() => {
            this.itemRect = this.listScroller.getItemRect(0)
            this.isShowRect = true
          })
          .id('GetItemRectButton')
        Button('currentOffset')
          .onClick(() => {
            console.log('test: xoffset: ' + this.listScroller.currentOffset()?.xOffset + '  yoffset: ' + this.listScroller.currentOffset()?.yOffset)
            this.xoffset = this.listScroller.currentOffset()?.xOffset ?? 0;
            this.yoffset = this.listScroller.currentOffset()?.yOffset ?? 0;
            this.isShowOffset = true
          })
          .id('currentOffsetButton')

        List({ space: 10, initialIndex: 0, scroller: this.listScroller }) {
          ForEach(this.arr1, (item: number) => {
            ListItem() {
              Text('item' + item)
                .width(200)
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor('0xFFFFFF')
            }
            .swipeAction({
              start: {
                builder: () => {
                  this.itemEnd(item)
                },
                actionAreaDistance: this.startDeleteAreaDistance,
                onAction: () => {
                  this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                    let index = this.arr1.indexOf(item)
                    this.arr1.splice(index, 1)
                  })
                }
              },
              end: {
                builder: () => {
                  this.itemEnd(item)
                },
                actionAreaDistance: this.endDeleteAreaDistance,
                onAction: () => {
                    this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                    let index = this.arr1.indexOf(item)
                    this.arr1.splice(index, 1)
                  })
                }
              },
              edgeEffect: SwipeEdgeEffect.None
            })
            .id('listitemlevel' + item)
          }, (item: number) => item.toString())
        }
        .id('listlevel1')
        .padding(this.num)
        .listDirection(this.listDirection)
        .width('90%')
        .height('80%')
        .divider({
          strokeWidth: this.strokeWidth,
          color: 0xFFFFFF,
          startMargin: this.startMargin,
          endMargin: this.endMargin
        })
        .edgeEffect(EdgeEffect.None)
        .chainAnimation(false)
        .contentStartOffset(this.contentStartOffset)
        .contentEndOffset(this.contentEndOffset)
      }.width('100%').height('100%')
    }
  }
}