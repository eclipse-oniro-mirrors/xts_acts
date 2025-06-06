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
@Component
struct ReusableFlowItem36 {
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
struct WaterFlowSectionDemo42 {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State fontSize: number = 24
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State columns: string = '1fr'
  scroller: Scroller = new Scroller()
  dataCount: number = 40
  dataSource: WaterFlowDataSource = new WaterFlowDataSource(this.dataCount)
  @State sections: WaterFlowSections = new WaterFlowSections()
  oneColumnSection: SectionOptions = {
    itemsCount: 8,
    crossCount: 1,
    columnsGap: 0,
    rowsGap: 0,
    onGetItemMainSizeByIndex: (index: number) => {
      return 30
    }
  }
  twoColumnSection: SectionOptions = {
    itemsCount: 8,
    crossCount: 2,
    columnsGap: 0,
    rowsGap: 0,
    onGetItemMainSizeByIndex: (index: number) => {
      return 30
    }
  }
  threeColumnSection: SectionOptions = {
    itemsCount: 8,
    crossCount: 4,
    columnsGap: 0,
    rowsGap: 0,
    onGetItemMainSizeByIndex: (index: number) => {
      return 30
    }
  }
  fourColumnSection: SectionOptions = {
    itemsCount: 8,
    crossCount: 8,
    columnsGap: 0,
    rowsGap: 0,
    onGetItemMainSizeByIndex: (index: number) => {
      return 30
    }
  }
  lastSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 1,
    onGetItemMainSizeByIndex: (index: number) => {
      return 30
    }
  }

  aboutToAppear() {
    let sectionOptions: SectionOptions[] = []
    let count = 0
    while (count < this.dataCount) {
      sectionOptions.push(this.oneColumnSection)
      sectionOptions.push(this.twoColumnSection)
      sectionOptions.push(this.threeColumnSection)
      sectionOptions.push(this.fourColumnSection)
      this.lastSection.itemsCount = this.dataCount -this.oneColumnSection.itemsCount - this.twoColumnSection.itemsCount - this.threeColumnSection.itemsCount - this.fourColumnSection.itemsCount
      sectionOptions.push(this.lastSection)
      break;
    }
    this.sections.splice(0, 0, sectionOptions)

  }

  build() {
    Column({ space: 2 }) {
      Text(`${this.sections.values()?.length > 0 ? this.sections.values()[0]?.itemsCount : 'undefined'}`).key('WaterFlowSectionDemo42_text')
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            ReusableFlowItem36({ item: item })
          }
          .key(`WaterFlowSectionDemo42_${item}`)
          .height(100)
          .width(100)
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(10)
      .backgroundColor(0xFAEEE0)
      .width(400)
      .height(200)
      .layoutWeight(1)

    }.margin({top:'10%',left:'10%'})
  }
}