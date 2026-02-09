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
import { WaterFlowDataSource } from './WaterFlowDataSource'
import { Entry, Component, Scroller, SectionOptions, WaterFlowSections, Column, Text, Image, ImageFit, ColumnOptions,  WaterFlow, Margin, LazyForEach, FlowItem } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Component
struct ReusableFlowItem43 {
  @State item: number = 0
  aboutToAppear() {
    console.info('item:' + this.item)
  }

  build() {
    Column() {
      Text("N" + this.item).fontSize(12).height('16')
      Image('res/waterFlowTest (' + this.item % 5 + ').jpg')
        .objectFit(ImageFit.Fill)
        .width('100%')
        .layoutWeight(1)
    }
  }
}

@Entry
@Component
struct WaterFlowSectionDemo43 {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State fontSize: number = 24
  @State colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  @State columns: string = '1fr'
  scroller: Scroller = new Scroller()
  dataCount: int = 7
  dataSource: WaterFlowDataSource = new WaterFlowDataSource(this.dataCount)
  @State sections: WaterFlowSections = new WaterFlowSections()

  twoColumnSection: SectionOptions = {
    itemsCount: 5,
    crossCount: 3,
    columnsGap: 20,
    rowsGap: 20,
    onGetItemMainSizeByIndex: (index: int): number => {
      return 100.0
    }
  } as SectionOptions
  lastSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 1,
    onGetItemMainSizeByIndex: (index: int): number => {
      return 100.0
    }
  } as SectionOptions

  aboutToAppear() {
    let sectionOptions: SectionOptions[] = []
    let count = 0
    while (count < this.dataCount) {
      sectionOptions.push(this.twoColumnSection)
      this.lastSection.itemsCount = this.dataCount - this.twoColumnSection.itemsCount
      sectionOptions.push(this.lastSection)
      break;
    }
    this.sections.splice(0, 0, sectionOptions)
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            ReusableFlowItem43({ item: item })
          }
          .key(`WaterFlowSectionDemo43_${item}`)
          .width('100%')
          .height(100)
          .backgroundColor(this.colors[(item as int) % 5])
        }, (item: number) => String(item))
      }
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(10)
      .backgroundColor(0xFAEEE0)
      .width(300)
      .height('100%')
      .layoutWeight(1)

    }.margin({top:'10%',left:'10%'} as Margin)
  }
}