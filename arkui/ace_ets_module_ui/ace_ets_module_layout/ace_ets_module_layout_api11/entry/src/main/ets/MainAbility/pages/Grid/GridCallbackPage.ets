/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { Value } from './../../common/Value';
import { MessageManager, Callback } from './../../common/MessageManager';

type MessageData = string | number | boolean | BarState | Color | GridDirection

@Entry
@Component
struct GridCallbackPage {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  @State columnsTemplate: string = '1fr 1fr 1fr 1fr 1fr'
  @State rowsTemplate: string = '1fr 1fr 1fr 1fr 1fr'
  @State columnsGap: number = 10
  @State rowsGap: number = 10
  @State scrollBar: BarState = BarState.Off
  @State scrollBarColor: Color = Color.Grey
  @State scrollBarWidth: number = 20
  @State cachedCount: number = 1
  @State editMode: boolean = false
  @State layoutDirection: GridDirection = GridDirection.Column
  @State maxCount: number = Infinity
  @State minCount: number = 1
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
  @State onScrollBarUpdateText: string = 'onScrollBarUpdate'
  @State myKey: number = 0
  scroller: Scroller = new Scroller()
  messageManager: MessageManager<MessageData> = new MessageManager()

  onPageShow() {
    console.info('GridPage onPageShow')
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
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
        this.scrollBarColor = message.value as Color
      }
      if (message.name == 'scrollBarWidth') {
        this.scrollBarWidth = message.value as number
      }
      if (message.name == 'cachedCount') {
        this.cachedCount = message.value as number
      }
      if (message.name == 'editMode') {
        this.editMode = message.value as boolean
      }
      if (message.name == 'layoutDirection') {
        this.layoutDirection = message.value as GridDirection
      }
      if (message.name == 'maxCount') {
        this.maxCount = message.value as number
      }
      if (message.name == 'minCount') {
        this.minCount = message.value as number
      }
      if (message.name == 'cellLength') {
        this.cellLength = message.value as number
      }
      if (message.name == 'multiSelectable') {
        this.multiSelectable = message.value as boolean
      }
      if (message.name == 'supportAnimation') {
        this.supportAnimation = message.value as boolean
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 5 }) {
      Text('default').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid() {
        GridItem() {
          Text("abc").fontSize(16).backgroundColor(0xF9CF93).width('100%')
            .height(40).textAlign(TextAlign.Center)
        }.width('90%')
      }.columnsTemplate('1fr')
      .rowsTemplate('1fr')
      .height(50)
      .key('grid_default')

      Grid() {
        ForEach(this.Number, (day: string) => {
          ForEach(this.Number, (day: string) => {
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
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
        this.onItemDragStart = 'onItemDragStart:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y)
        console.info(itemIndex.toString())
      })
      .onItemDragEnter((event: ItemDragInfo) => {
        this.onItemDragEnter = 'onItemDragEnter:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y)
      })
      .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
        this.onItemDragMove = 'onItemDragMove:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y + ' itemIndex: ' + itemIndex + ' insertIndex: ' + insertIndex)
      })
      .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
        this.onItemDragLeave = 'onItemDragLeave:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y + ' itemIndex: ' + itemIndex)
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        this.onItemDrop = 'onItemDrop:succ'
        console.info('DragInfo_x: ' + event.x + ' DragInfo_y: ' + event.y + ' itemIndex: ' + itemIndex + ' insertIndex: ' + insertIndex + ' isSuccess: ' + isSuccess)
      })

      Text('scroll').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller) {
        ForEach(this.Number, (row: string) => {
          ForEach(this.Number, (column: string) => {
            GridItem() {
              Text(row +"-"+ column)
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
      .onScrollIndex((first: number) => {
        this.onScrollIndex = first
        console.info(first.toString())
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(200)
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.onScrollText = 'onScroll:succ'
        console.info('onScroll scrollOffset:' + scrollOffset.toString() + ' ScrollState:' + ScrollState.toString())
      })
      .onScrollIndex((first: number,last: number) => {
        this.onScrollIndexText = "onScrollIndex:succ"
        console.info("onScrollIndex first:" + first.toString() + " last:" + last.toString())
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
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        this.onScrollFrameBeginText = 'onScrollFrameBegin:succ'
        console.info('onScrollFrameBegin offset:' + offset +' state:' + state)
        return { offsetRemain: offset }
      })

       Row(){
        Button("scoll to bottom")
          .key("bottom")
          .onClick(() => { // 滑动到底部
            console.log("滑动到底部")
            this.scroller.scrollTo({xOffset:0,yOffset:2000})
          })
        Button(this.buttonName)
          .key('button')
          .onClick(() => { // 点击后滑到下一页
            this.buttonName = 'clicked'
            this.scroller.scrollPage({ next: true })
          })
      }
      Text('onScrollIndex:' + this.onScrollIndex).key('onScrollIndex')
      Text(this.onItemDragStart).key('onItemDragStart')
      Text(this.onItemDragEnter).key('onItemDragEnter')
      Text(this.onItemDragMove).key('onItemDragMove')
      Text(this.onItemDragLeave).key('onItemDragLeave')
      Text(this.onItemDrop).key('onItemDrop')
      Row()
      {
        Text(this.onScrollText).margin({right:10}).key('onScrollText')
        Text(this.onReachStartText).key('onReachStartText')
      }
      Row()
      {
        Text(this.onReachEndText).margin({right:10}).key('onReachEndText')
        Text(this.onScrollStartText).key('onScrollStartText')
      }
      Row()
      {
        Text(this.onScrollIndexText).margin({right:10}).key('onScrollIndexText')
        Text(this.onScrollStopText).key('onScrollStopText')
      }

      Text(this.onScrollFrameBeginText).key('onScrollFrameBeginText')
      Text(this.onScrollBarUpdateText).key('onScrollBarUpdateText')
    }.width('100%').margin({ top: 5 })
  }
}
