'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
import Log from '../../common/Log';
import {
  $rawfile,
  Alignment,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DataChangeListener,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  IDataSource,
  Image,
  ItemAlign,
  LazyForEach,
  List,
  ListItem,
  Margin,
  Padding,
  Row,
  Scroll,
  Scroller,
  Stack,
  Text,
  TextAlign,
  TextArea,
  TextOverflow,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = []

  public totalCount(): int {
    return 0
  }

  public getData(index: int): string {
    return ''
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener')
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener')
      this.listeners.splice(pos, 1)
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index)
    })
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index)
    })
  }

  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to)
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = ['/path/image0']

  public totalCount(): int {
    return this.dataArray.length
  }

  public getData(index: int): string {
    let RealIndex: Int = index.toInt()
    return this.dataArray[RealIndex]
  }

  public addData(index: Int, data: string): void {
    this.dataArray.splice(index, 0, data)
    let datatest = this.dataArray.length
    console.info('lenghth = ' + datatest)
    for (let i = 0; i < datatest; i++) {
      console.info('after adding: ' + this.dataArray[i])
    }
    this.notifyDataAdd(index)
    this.notifyDataChange(index)
  }

  public pushData(data: string): void {
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length - 1)
    let datatest = this.dataArray.length
    console.info('lenghth = ' + datatest)
    for (let i = 0; i < datatest; i++) {
      console.info('after adding: ' + this.dataArray[i])
    }
  }

  public moveData(index1: number, index2: number): void {
    let RealIndex1: Int = index1.toInt()
    let RealIndex2: Int = index2.toInt()
    if (RealIndex1 < RealIndex2) {
      let temp = this.dataArray[RealIndex1]
      for (let i = RealIndex1; i < RealIndex2; i++) {
        this.dataArray[i] = this.dataArray[i+1]
      }
      this.dataArray[RealIndex2] = temp

      for (let j = 0; j < this.dataArray.length; j++) {
        console.info('after moving :' + this.dataArray[j])
      }
    } else if (RealIndex1 > RealIndex2) {
      let temp = this.dataArray[RealIndex1]
      for (let i = RealIndex1; i > RealIndex2; i--) {
        this.dataArray[i] = this.dataArray[i-1]
      }
      this.dataArray[RealIndex2] = temp

      for (let j = 0; j < this.dataArray.length; j++) {
        console.info('after moving :' + this.dataArray[j])
      }
    }
    this.notifyDataMove(index1.toInt(), index2.toInt())
  }

  public popData(): void {
    this.dataArray.pop()
    this.notifyDataDelete(this.dataArray.length)
    let datatest = this.dataArray.length
    console.info('lenghth = ' + datatest)
    for (let i = 0; i < datatest; i++) {
      console.info('after deleting: ' + this.dataArray[i])
    }
  }

  public changeData(index: int): void {
    this.dataArray[index] = 'apple'
    let datatest = this.dataArray.length
    console.info('lenghth = ' + datatest)
    for (let i = 0; i < datatest; i++) {
      console.info('after changing: ' + this.dataArray[i])
    }
    this.notifyDataChange(index)
  }
}

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct LazyForEachOnDataAdd {
  @State result_101: boolean = true
  @State result_102: boolean = true
  @State result_103: boolean = true
  @State result_104: boolean = true
  private data: MyDataSource = new MyDataSource()
  private scroller: Scroller = new Scroller()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear LazyForEachOnDataAdd start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear LazyForEachOnDataAdd end`)
  }

  build() {

    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({
            direction: FlexDirection.Column,
            alignItems: ItemAlign.Start,
            justifyContent: FlexAlign.SpaceBetween
          }) {

            Text("lazyForEach-OnDataAdd")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataAddText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 } as Margin)
                  }.margin({ left: 10, right: 10 } as Margin)
                }
                .key("listItemOne")
                .onClick((e: ClickEvent) => {
                  try {
                    this.data.pushData('/path/image' + this.data.totalCount())
                    console.info("this.data.totalCount() is :" + this.data.totalCount())
                  } catch (err) {
                    this.result_101 = false
                    console.info("LazyForEachOnDataAdd_101 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }

                  try {
                    let backData1: emitter.EventData = {
                      data: {
                        "result1": this.result_101,
                      } as Record<String,RecordData>
                    }
                    let backEvent1: emitter.InnerEvent = {
                      eventId: 60212,
                      priority: emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_101 onClick start to emit action")
                    emitter.emit(backEvent1, backData1)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_101 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }
                })
              }, (item: string) => item)
            }

            Text("lazyForEach-OnDataMove")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataMoveText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 } as Margin)
                  }.margin({ left: 10, right: 10 } as Margin)
                }
                .key("listItemTwo")
                .onClick((e: ClickEvent) => {
                  try {
                    this.data.moveData(3, 1)
                  } catch (err) {
                    this.result_102 = false
                    console.info("LazyForEachOnDataAdd_102 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }

                  try {
                    let backData2: emitter.EventData = {
                      data: {
                        "result2": this.result_102,
                      } as Record<String,RecordData>
                    }
                    let backEvent2: emitter.InnerEvent = {
                      eventId: 60213,
                      priority: emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_102 onClick start to emit action")
                    emitter.emit(backEvent2, backData2)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_102 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }
                })
              }, (item: string) => item)
            }

            Text("lazyForEach-OnDataDelete")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataDeleteText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 } as Margin)
                  }.margin({ left: 10, right: 10 } as Margin)
                }
                .key("listItemThree")
                .onClick((e: ClickEvent) => {
                  try {
                    this.data.popData()
                  } catch (err) {
                    this.result_103 = false
                    console.info("LazyForEachOnDataAdd_103 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }

                  try {
                    let backData3: emitter.EventData = {
                      data: {
                        "result3": this.result_103,
                      } as Record<String,RecordData>
                    }
                    let backEvent3: emitter.InnerEvent = {
                      eventId: 60214,
                      priority: emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_103 onClick start to emit action")
                    emitter.emit(backEvent3, backData3)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_103 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }

                })
              }, (item: string) => item)
            }

            Text("lazyForEach-OnDataChange")
              .width(300)
              .height(70)
              .fontSize(20)
              .opacity(1)
              .align(Alignment.TopStart)
              .fontColor(0xCCCCCC)
              .lineHeight(25)
              .border({ width: 1 })
              .padding(10)
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.None })
              .key("onDataChangeText")

            List({ space: 3 }) {
              LazyForEach(this.data, (item: string) => {
                ListItem() {
                  Row() {
                    Image(item).width("30%").height(50)
                    Text(item).fontSize(20).margin({ left: 10 } as Margin)
                  }.margin({ left: 10, right: 10 } as Margin)
                }
                .key("listItemFour")
                .onClick((e: ClickEvent) => {
                  try {
                    this.data.changeData(2)
                  } catch (err) {
                    this.result_104 = false
                    console.info("LazyForEachOnDataAdd_104 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }

                  try {
                    let backData4: emitter.EventData = {
                      data: {
                        "result4": this.result_104,
                      } as Record<String,RecordData>
                    }
                    let backEvent4: emitter.InnerEvent = {
                      eventId: 60215,
                      priority: emitter.EventPriority.LOW
                    }
                    console.info("LazyForEachOnDataAdd_104 onClick start to emit action")
                    emitter.emit(backEvent4, backData4)
                  } catch (err) {
                    console.info("LazyForEachOnDataAdd_104 onClick emit action err: " +
                    JSON.stringify((err as Error)?.message))
                  }
                })
              }, (item: string) => item)
            }
          }.width("100%").height("100%")
        }
      }
    }
  }
}

