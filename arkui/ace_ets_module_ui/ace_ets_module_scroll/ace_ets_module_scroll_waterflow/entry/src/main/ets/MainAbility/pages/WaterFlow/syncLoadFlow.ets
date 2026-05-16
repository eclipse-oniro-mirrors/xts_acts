/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit'

// 实现IDataSource接口的对象，用于瀑布流组件加载数据
export class WaterFlowDataSource implements IDataSource {
  private dataArray: number[] = []
  private listeners: DataChangeListener[] = []

  constructor() {
    for (let i = 0; i < 100; i++) {
      this.dataArray.push(i)
    }
  }

  // 获取索引对应的数据
  public getData(index: number): number {
    return this.dataArray[index]
  }

  // 通知控制器数据重新加载
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  // 通知控制器数据增加
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }

  // 通知控制器数据变化
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index)
    })
  }

  // 通知控制器数据删除
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index)
    })
  }

  // 通知控制器数据位置变化
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to)
    })
  }

  // 获取数据总数
  public totalCount(): number {
    return this.dataArray.length
  }

  // 注册改变数据的控制器
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  // 注销改变数据的控制器
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

  // 增加数据
  public add1stItem(): void {
    this.dataArray.splice(0, 0, this.dataArray.length)
    this.notifyDataAdd(0)
  }

  // 在数据尾部增加一个元素
  public addLastItem(): void {
    this.dataArray.splice(this.dataArray.length, 0, this.dataArray.length)
    this.notifyDataAdd(this.dataArray.length - 1)
  }

  // 在指定索引位置增加一个元素
  public addItem(index: number): void {
    this.dataArray.splice(index, 0, this.dataArray.length)
    this.notifyDataAdd(index)
  }

  // 删除第一个元素
  public delete1stItem(): void {
    this.dataArray.splice(0, 1)
    this.notifyDataDelete(0)
  }

  // 删除第二个元素
  public delete2ndItem(): void {
    this.dataArray.splice(1, 1)
    this.notifyDataDelete(1)
  }

  // 删除最后一个元素
  public deleteLastItem(): void {
    this.dataArray.splice(-1, 1)
    this.notifyDataDelete(this.dataArray.length)
  }

  // 重新加载数据
  public reload(): void {
    this.dataArray.splice(1, 1)
    this.dataArray.splice(3, 2)
    this.notifyDataReload()
  }
}

@Entry
@Component
export struct syncLoadPageWaterFlow {
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  @State syncLoad1: boolean = false

  @Builder
  itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }
  }

  traceStart(): boolean {
    hiTraceMeter.startTrace('Test', 1)
    return true
  }

  traceEnd(): boolean {
    hiTraceMeter.finishTrace('Test', 1)
    return true
  }

  build() {
    NavDestination() {
      Column({ space: 2 }) {
        Button('syncLoad true')
          .id('flow_syncLoad_true')
          .onClick(() => {
            this.syncLoad1 = true
          })
        Button('scrollTo50')
          .id('flow_syncLoad_scrollTo')
          .onClick(() => {
            this.scroller.scrollToIndex(49)
          })
        WaterFlow({ layoutMode: WaterFlowLayoutMode.SLIDING_WINDOW, scroller: this.scroller }) {
          LazyForEach(this.dataSource, (item: number) => {
            FlowItem() {
              Column() {
                Text('N' + item).fontSize(12).height('16')
              }
            }
            .onAppear(() => {
              if (item + 20 == this.dataSource.totalCount()) {
                for (let i = 0; i < 100; i++) {
                  this.dataSource.addLastItem()
                }
              }
            })
            .width('100%')
            .height('5%')
            .backgroundColor(this.colors[item % 5])
          }, (item: string) => item)
        }
        .id('flow_syncLoad')
        .syncLoad(this.syncLoad1)
        .columnsTemplate('1fr 1fr')
        .scrollBar(BarState.On)
        .columnsGap(10)
        .rowsGap(5)
        .backgroundColor(0xFAEEE0)
        .width('90%')
        .height('60%')
        .onReachStart(() => {
          console.info('waterFlow reach start')
        })
        .onScrollStart(() => {
          console.info('waterFlow scroll start')
        })
        .onScrollStop(() => {
          console.info('waterFlow scroll stop')
        })
        .onScrollIndex((first:number, last:number)=>{
          console.info(`first:${first}, last:${last}`)
        })
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
          return { offsetRemain: offset }
        })
      }
    }
  }
}