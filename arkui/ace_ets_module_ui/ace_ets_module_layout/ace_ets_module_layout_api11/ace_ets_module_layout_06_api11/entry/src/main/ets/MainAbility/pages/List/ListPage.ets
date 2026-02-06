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

type MessageData = string | number | boolean | BarState | Color | EdgeEffect | ListItemAlign | StickyStyle

@Entry
@Component
struct ListPage {
  @State arr: string[] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  @State listPosition: number = 0 // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底
  @State space: number = 20
  @State initialIndex: number = 0
  @State listDirection: Axis  = Axis.Vertical
  @State strokeWidth: number = 2
  @State dividerColor: Color = Color.Blue
  @State startMargin: number = 3
  @State endMargin: number = 2
  @State scrollBar: BarState = BarState.Off
  @State cachedCount: number = 1
  @State editMode: boolean = false
  @State edgeEffect: EdgeEffect = EdgeEffect.Spring
  @State chainAnimation: boolean = false
  @State multiSelectable: boolean = false
  @State lanes: number = 1
  @State alignListItem: ListItemAlign = ListItemAlign.End
  @State sticky: StickyStyle = StickyStyle.None
  @State onScrollText: string = "onScroll"
  @State onReachStartText: string = "onReachStart"
  @State onReachEndText: string = "onReachEnd"
  @State onScrollBeginText: string = "onScrollBegin"
  @State onScrollStartText: string = "onScrollStart"
  @State onScrollStopText: string = "onScrollStop"
  @State onItemMoveText: string = "onItemMove"
  @State onItemDragText: string = "onItemDrag"
  @State onItemDropText: string = "onItemDrop"
  scroller: Scroller = new Scroller()
  messageManager: MessageManager<MessageData> = new MessageManager()

  onPageShow() {
    console.info('ListPage onPageShow')
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'space') {
        this.space = message.value as number
      }
      if (message.name == 'initialIndex') {
        this.initialIndex = message.value as number
      }
      if (message.name == 'listDirection') {
        this.listDirection = message.value as Axis
      }
      if (message.name == 'strokeWidth') {
        this.strokeWidth = message.value as number
      }
      if (message.name == 'dividerColor') {
        this.dividerColor = message.value as Color
      }
      if (message.name == 'startMargin') {
        this.startMargin = message.value as number
      }
      if (message.name == 'endMargin') {
        this.endMargin = message.value as number
      }
      if (message.name == 'scrollBar') {
        this.scrollBar = message.value as BarState
      }
      if (message.name == 'cachedCount') {
        this.cachedCount = message.value as number
      }
      if (message.name == 'editMode') {
        this.editMode = message.value as boolean
      }
      if (message.name == 'edgeEffect') {
        this.edgeEffect = message.value as EdgeEffect
      }
      if (message.name == 'chainAnimation') {
        this.chainAnimation = message.value as boolean
      }
      if (message.name == 'multiSelectable') {
        this.multiSelectable = message.value as boolean
      }
      if (message.name == 'lanes') {
        this.lanes = message.value as number
      }
      if (message.name == 'alignListItem') {
        this.alignListItem = message.value as ListItemAlign
      }
      if (message.name == 'sticky') {
        this.sticky = message.value as StickyStyle
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Row(){
        Text(this.onItemMoveText).fontSize(10).margin({right:10}).key('onItemMoveText')
        Text(this.onItemDragText).fontSize(10).margin({right:10}).key('onItemDragText')
        Text(this.onItemDropText).fontSize(10).key('onItemDropText')
      }
      Row(){
        Text(this.onScrollText).fontSize(10).margin({right:10}).key('onScrollText')
        Text(this.onScrollBeginText).fontSize(10).key('onScrollBeginText')
      }
      Row(){
        Text(this.onReachStartText).fontSize(10).margin({right:10}).key('onReachStartText')
        Text(this.onReachEndText).fontSize(10).key('onReachEndText')
      }
      Row(){
        Text(this.onScrollStartText).fontSize(10).margin({right:10}).key('onScrollStartText')
        Text(this.onScrollStopText).fontSize(10).key('onScrollStopText')
      }
      Button("点击更改alignListItem:" + this.alignListItem)
        .height('8%')
        .onClick(() => {
          if (this.alignListItem == ListItemAlign.Start) {
            this.alignListItem = ListItemAlign.Center
          } else if (this.alignListItem == ListItemAlign.Center) {
            this.alignListItem = ListItemAlign.End
          } else {
            this.alignListItem = ListItemAlign.Start
          }
        })
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('90%').height(20).fontSize(10)
              .textAlign(TextAlign.Center).backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
      }.key('list_default')
      .height('5%')

      List({ space: this.space, initialIndex: this.initialIndex, scroller: this.scroller }) {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('30%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .key('' + item)
          }
          .border({ width: 2, color: Color.Green })
        }, (item: string) => item)
      }
      .height('60%')
      .width("90%")
      .border({ width: 3, color: Color.Red })
      .key("list")
      .listDirection(this.listDirection)
      .divider({strokeWidth: this.strokeWidth, color: this.dividerColor,
        startMargin: this.startMargin, endMargin: this.endMargin })
      .scrollBar(this.scrollBar)
      .cachedCount(this.cachedCount)
      .editMode(this.editMode)
      .edgeEffect(this.edgeEffect)
      .chainAnimation(this.chainAnimation)
      .multiSelectable(this.multiSelectable)
      .lanes(this.lanes)
      .alignListItem(this.alignListItem)
      .onItemDelete((index: number) => {
        this.onScrollText = "onItemDelete:succ"
        console.info('onItemDelete index: ' + index)
        return true
      })
      .onScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.onScrollText = "onScroll:succ"
        console.info('scrollState:' + scrollState + ', scrollOffset:' + scrollOffset)
      })
      .onReachStart(() => {
        this.onReachStartText = "onReachStart:succ"
        console.info('onReachStart')
      })
      .onReachEnd(() => {
        this.onReachEndText = "onReachEnd:succ"
        console.info('onReachEnd')
      })
      .onScrollFrameBegin((offset: number, state: number) => {
        if ((this.listPosition == 0 && offset >= 0) || (this.listPosition == 2 && offset <= 0)) {
          this.scroller.scrollBy(0, -offset)
          this.onScrollBeginText = "onScrollBegin:succ"
          console.info('onScrollBegin: offset: ' + offset + ' state: ' + state)
          return { offsetRemain: 0 }
        }
        this.listPosition = 1;
        this.onScrollBeginText = "onScrollBegin:succ"
        console.info('onScrollBegin: offset: ' + offset + ' state: ' + state)
        return { offsetRemain: offset }
      })
      .onScrollStart(() => {
        this.onScrollStartText = "onScrollStart:succ"
        console.info('onScrollStart succ')
      })
      .onScrollStop(() => {
        this.onScrollStopText = "onScrollStop:succ"
        console.info('onScrollStop  succ')
      })
      .onItemMove((from: number, to: number) => {
        this.onItemMoveText = "onItemMove:succ"
        console.info('onItemMove: from: ' + from + ' to: ' + to)
        return true
      })
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
        this.onItemDragText = "onItemDragStart:succ"
        console.info('onItemDragStart: event: ' + event + ', itemIndex: ' + itemIndex)
      })
      .onItemDragEnter((event: ItemDragInfo) => {
        this.onItemDragText = "onItemDragEnter:succ"
        console.info('onItemDragEnter event: ' + event)
      })
      .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
        this.onItemDragText = "onItemDragMove:succ"
        console.info('onItemDragMove: event: ' + event + ', itemIndex: ' + itemIndex + ', insertIndex: ' + insertIndex)
      })
      .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
        this.onItemDragText = "onItemDragLeave:succ"
        console.info('onItemDragLeave: event: ' + event + ', itemIndex: ' + itemIndex)
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        this.onItemDropText = "onItemDrop:succ"
        console.info('onItemDrop: event: ' + event + ', itemIndex: ' + itemIndex + ', insertIndex: ' + insertIndex + ', isSuccess: ' + isSuccess)
      })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
  }
}