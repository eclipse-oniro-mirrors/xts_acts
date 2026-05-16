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
import { UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct makeObserved0140 {
  colors: number[] = [0XFFC0CB, 0XDA70D6, 0X6B8E23, 0X6A5ACD, 0x00FFF, 0X00FF7F]
  sections: WaterFlowSections = UIUtils.makeObserved(new WaterFlowSections())
  scroller: Scroller = new Scroller()
  @Local private arr: Array<number> = new Array(8).fill(0)
  oneColumnSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 1,
  }
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
  }
  lastSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 3
  }

  aboutToAppear(): void {
    let sectionOptions: SectionOptions[] = [this.oneColumnSection, this.twoColumnSection, this.lastSection]
    this.sections.splice(0, 0, sectionOptions)
  }

  build() {
    Column() {
      Text(`${this.arr.length}`).height('5%')
      Button('push option').height('5%').onClick(() => {
        this.arr.push(100)
        this.arr.push(101)
        this.arr.push(102)
        this.arr.push(103)
        let section: SectionOptions = { itemsCount: 4, crossCount: 2 }
        this.sections.push(section)
      }).id('buttonPush')
      Button('splice option').height('5%').onClick(() => {
        let section: SectionOptions = { itemsCount: 12, crossCount: 3 }
        this.sections.splice(0, this.arr.length, [section])
      }).id('buttonSplice')
      Button('update option').height('5%').onClick(() => {
        let section: SectionOptions = { itemsCount: 12, crossCount: 4 }
        this.sections.update(0, section)
      }).id('buttonUpdate')
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        ForEach(this.arr, (item: number, index: number) => {
          FlowItem() {
            Text(`${item}`)
              .border({ width: 1 })
              .backgroundColor(this.colors[index % 6])
              .height('5%')
              .id(`flowItem${index}`)
          }
        })
      }.id('waterFlowTest')
    }
  }
}