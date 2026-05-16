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
import GlobalContext from './../../common/GlobalContext';
import { ValueT } from './../../common/Value';
import { MessageManager, Callback, Message } from './../../common/MessageManager';
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Scroller,
  Scroll,
  ForEach,
  Search,
  Color,
  EdgeEffect,
  ColumnOptions,
  BarState,
  GridDirection,
  Row,
  Grid,
  ForEach,
  GridItem,
  ItemDragInfo,
  ScrollState,
  OnScrollFrameBeginHandlerResult,
  TextAlign,
  Margin,
  ScrollState
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'



@Entry
@Component
struct GridPage {
  @State numberData: String[] = ['0', '1', '2', '3', '4']
  @State columnsTemplate: string = '1fr 1fr 1fr 1fr 1fr'
  @State rowsTemplate: string = '1fr 1fr 1fr 1fr 1fr'
  @State columnsGap: number = 10
  @State rowsGap: number = 10
  @State scrollBar: BarState = BarState.Off
  @State scrollBarColor: Color | string = Color.Grey
  @State scrollBarWidth: number = 20
  @State cachedCount: int = 1
  @State editMode: boolean = false
  @State layoutDirection: GridDirection = GridDirection.Column
  @State maxCount: int = Int.MAX_VALUE
  @State minCount: int = 1
  @State cellLength: number = 40
  @State multiSelectable: boolean = false
  @State supportAnimation: boolean = false
  @State onScrollIndex: number = 2
  @State buttonName: string = 'next page'
  @State onItemDragStart: string = 'onItemDragStart'
  @State onItemDragEnter: string = 'onItemDragEnter'
  @State onItemDragMove: string = 'onItemDragMove'
  @State onItemDragLeave: string = 'onItemDragLeave'
  @State onItemDrop: string = 'onItemDrop'
  @State onScrollText: string = 'onScroll'
  @State onScrollIndexText: string = 'onScrollIndex'
  @State onReachStartText: string = 'onReachStart'
  @State onReachEndText: string = 'onReachEnd'
  @State onScrollStartText: string = 'onScrollStart'
  @State onScrollStopText: string = 'onScrollStop'
  @State onScrollFrameBeginText: string = 'onScrollFrameBegin'
  @State myKey: number = 0
  scroller: Scroller = new Scroller()
  messageManager: MessageManager<string | int | number | boolean | BarState | Color | GridDirection> = new MessageManager<string | int | number | boolean | BarState | Color | GridDirection>()

  onPageShow() {
    console.info('GridPage onPageShow')
    AppStorage.setOrCreate<MessageManager<string | int | number | boolean | BarState | Color | GridDirection>>("messageManager",  this.messageManager);
    let callback: Callback<string | int | number | boolean | BarState | Color | GridDirection> = (message: Message<string | int | number | boolean | BarState | Color | GridDirection>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'columnsTemplate') {
        this.columnsTemplate = message.value as string
      }
      if (message.name == 'rowsTemplate') {
        this.rowsTemplate = message.value as string
      }
      if (message.name == 'columnsGap') {
        this.columnsGap = message.value as number
      }
      if (message.name == 'rowsGap') {
        this.rowsGap = message.value as number
      }
      if (message.name == 'scrollBar') {
        this.scrollBar = message.value as BarState
      }
      if (message.name == 'scrollBarColor') {
        this.scrollBarColor = message.value as string
      }
      if (message.name == 'scrollBarWidth') {
        this.scrollBarWidth = message.value as number
      }
      if (message.name == 'cachedCount') {
        this.cachedCount = message.value as int
      }
      if (message.name == 'editMode') {
        this.editMode = Boolean(message.value as string)
      }
      if (message.name == 'layoutDirection') {
        this.layoutDirection = message.value as GridDirection
      }
      if (message.name == 'maxCount') {
        this.maxCount = message.value as int
      }
      if (message.name == 'minCount') {
        this.minCount = message.value as int
      }
      if (message.name == 'cellLength') {
        this.cellLength = message.value as number
      }
      if (message.name == 'multiSelectable') {
        this.multiSelectable = Boolean(message.value as string)
      }
      if (message.name == 'supportAnimation') {
        this.supportAnimation = Boolean(message.value as string)
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row(){
        Text(this.onItemDragStart).fontSize(10).margin({right:10} as Margin).key('onItemDragStart')
        Text(this.onItemDragEnter).fontSize(10).key('onItemDragEnter')
      }
      Row(){
        Text(this.onItemDragMove).fontSize(10).margin({right:5} as Margin).key('onItemDragMove')
        Text(this.onItemDragLeave).fontSize(10).margin({right:5} as Margin).key('onItemDragLeave')
        Text(this.onItemDrop).fontSize(10).key('onItemDrop')
      }
      Row(){
        Text('onScrollIndex:' + this.onScrollIndex).fontSize(10).margin({right:10} as Margin).key('onScrollIndex')
        Text(this.onScrollFrameBeginText).fontSize(10).key('onScrollFrameBeginText')
      }
      Row()
      {
        Text(this.onScrollText).fontSize(10).margin({right:10} as Margin).key('onScrollText')
        Text(this.onReachStartText).fontSize(10).key('onReachStartText')
      }
      Row()
      {
        Text(this.onReachEndText).fontSize(10).margin({right:10} as Margin).key('onReachEndText')
        Text(this.onScrollStartText).fontSize(10).key('onScrollStartText')
      }
      Row()
      {
        Text(this.onScrollIndexText).fontSize(10).margin({right:10} as Margin).key('onScrollIndexText')
        Text(this.onScrollStopText).fontSize(10).key('onScrollStopText')
      }
      Button(this.buttonName)
        .key('button')
        .height('8%')
        .onClick((e:ClickEvent) => { 
          this.buttonName = 'clicked'
          this.scroller.scrollPage({ next: true })
        })
      
      Text('default').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid() {
        GridItem() {
          Text("abc").fontSize(16).backgroundColor(0xF9CF93).width('100%')
            .height(40).textAlign(TextAlign.Center)
        }.width('90%')
      }.columnsTemplate('1fr')
      .rowsTemplate('1fr')
      .height('5%')
      .key('grid_default')

      Grid() {
        ForEach(this.numberData, (day: string) => {
          ForEach(this.numberData, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width(40)
                .height(40)
                .textAlign(TextAlign.Center)
                .key(day)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate(this.columnsTemplate)
      .rowsTemplate(this.rowsTemplate)
      .columnsGap(this.columnsGap)
      .rowsGap(this.rowsGap)
      .scrollBar(this.scrollBar)
      .cachedCount(this.cachedCount)
      .editMode(this.editMode)
      .layoutDirection(this.layoutDirection)
      .maxCount(this.maxCount)
      .minCount(this.minCount)
      .cellLength(this.cellLength)
      .multiSelectable(this.multiSelectable)
      .supportAnimation(this.supportAnimation)
      .width('90%')
      .key('grid1')
      .backgroundColor(0xFAEEE0)
      .height(150)
      .edgeEffect(EdgeEffect.Spring)
      .onItemDragStart((event: ItemDragInfo, itemIndex: int): undefined => {
        this.onItemDragStart = 'onItemDragStart:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y)
        console.info(String(itemIndex))
        return undefined
      })
      .onItemDragEnter((event: ItemDragInfo) => {
        this.onItemDragEnter = 'onItemDragEnter:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y)
      })
      .onItemDragMove((event: ItemDragInfo, itemIndex: int, insertIndex: int) => {
        this.onItemDragMove = 'onItemDragMove:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y + ' itemIndex: ' + itemIndex + ' insertIndex: ' + insertIndex)
      })
      .onItemDragLeave((event: ItemDragInfo, itemIndex: int) => {
        this.onItemDragLeave = 'onItemDragLeave:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y + ' itemIndex: ' + itemIndex)
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: int, insertIndex: int, isSuccess: boolean) => {
        this.onItemDrop = 'onItemDrop:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y + ' itemIndex: ' + itemIndex + ' insertIndex: ' + insertIndex + ' isSuccess: ' + isSuccess)
      })

      Text('scroll').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller) {
        ForEach(this.numberData, (day: string) => {
          ForEach(this.numberData, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .key('grid2')
      .scrollBar(this.scrollBar)
      .scrollBarColor(this.scrollBarColor)
      .scrollBarWidth(this.scrollBarWidth)
      .onScrollIndex((first: int,last: int):void => {
        this.onScrollIndex = first
        console.info(String(first))
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('30%')
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.onScrollText = 'onScroll:succ'
        console.info('onScroll scrollOffset:' + JSON.stringify(scrollOffset) + ' ScrollState:' + JSON.stringify(scrollState))
      })
      .onScrollIndex((first: int,last: int):void => {
        this.onScrollIndexText = "onScrollIndex:succ"
        console.info("onScrollIndex first:" + String(first) + " last:" + last)
      })
      .onReachStart(() => {
        this.onReachStartText = 'onReachStart:succ'
        console.info('onReachStart !')
      })
      .onReachEnd(() => {
        this.onReachEndText = 'onReachEnd:succ'
        console.info('onReachEnd !')
      })
      .onScrollStart(() => {
        this.onScrollStartText = 'onScrollStart:succ'
        console.info('onScrollStart !')
      })
      .onScrollStop(() => {
        this.onScrollStopText = 'onScrollStop:succ'
        console.info('onScrollStop !')
      })
      .onScrollFrameBegin((offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult  => {
        this.onScrollFrameBeginText = 'onScrollFrameBegin:succ'
        console.info('onScrollFrameBegin offset:' + offset +' state:' + state)
        return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult
      })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}
