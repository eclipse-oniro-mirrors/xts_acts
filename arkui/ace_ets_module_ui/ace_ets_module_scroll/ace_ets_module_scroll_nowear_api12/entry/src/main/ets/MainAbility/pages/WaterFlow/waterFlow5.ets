/**
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
import { WaterFlowDataSource } from './WaterFlowDataSource'

@Reusable
@Component
struct ReusableFlowItemSec {
  @State item: number = 0

  // 从复用缓存中加入到组件树之前调用，可在此处更新组件的状态变量以展示正确的内容
  aboutToReuse(params: Record<string, number>) {
    this.item = params.item;
    console.info('Reuse item:' + this.item)
  }

  aboutToAppear() {
    console.info('new item:' + this.item)
  }

  build() {
    Text("N" + this.item).fontSize(16).height('100%')
  }
}

@Entry
@Component
struct WaterFlowSecDemo {
  minSize: number = 80
  maxSize: number = 180
  fontSize: number = 24
  colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  dataCount: number = this.dataSource.totalCount()
  private itemHeightArray: number[] = []
  @State hei:number = 0
  @State sections: WaterFlowSections = new WaterFlowSections()
  sectionMargin: Margin = { top: 10, left: 5, bottom: 10, right: 5 }
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
    onGetItemMainSizeByIndex: (index: number) => {
      return 100
    }
  }

  // 计算FlowItem高度
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的高度数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
    // 初始化瀑布流分组信息
    let sectionOptions: SectionOptions[] = []
    let count = 0
    while (count < this.dataCount) {
      sectionOptions.push(this.twoColumnSection)
      count += this.twoColumnSection.itemsCount

    }
    this.sections.splice(0, 0, sectionOptions)
  }

  build() {
    Column({ space: 2 }) {
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            ReusableFlowItemSec({ item: item })
          }
          .id('flowItem_hei')
          .width('100%')
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr') // 瀑布流使用sections参数时该属性无效
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('60%')
      .layoutWeight(1)
    }
  }
}