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
@ObservedV2
class ArrayHolder {
  @Trace arr: Array<number> = [];

  constructor(count: number) {
    for (let i = 0; i < count; ++i) {
      this.arr.push(i)
    }
  }
}

@ComponentV2
struct ReusableItem {
  @Param reusableItem: number = 0

  aboutToAppear(): void {
    console.info('item:' + this.reusableItem)
  }

  build() {
    Column() {
      Text('N' + this.reusableItem).height(16).fontSize(12)
    }
  }
}

@Entry
@ComponentV2
struct RepeatNoMakeObserved {
  @Local arrayHolder: ArrayHolder = new ArrayHolder(20);
  @Local totalCount: number = this.arrayHolder.arr.length
  @Local mes:string = 'sections: ' + this.totalCount
  @Local minSize: number = 50
  @Local maxSize: number = 100
  @Local colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  sections: WaterFlowSections = new WaterFlowSections();
  oneColumnSection: SectionOptions = {
    itemsCount: 4,
    crossCount: 1,
    columnsGap: '5vp',
    rowsGap: 10,
    margin: 5,
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100]
    }
  }
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
    margin: 5,
    onGetItemMainSizeByIndex: (index: number) => {
      return 100
    }
  }
  lastSection: SectionOptions = {
    itemsCount: 20,
    crossCount: 2,
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100]
    }
  }

  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 保存flow item宽/高
  getItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.getItemSizeArray()
    // 初始化瀑布流分组信息
    let sectionOptions: SectionOptions[] = []
    let count = 0
    let oneOrTwo = 0
    while (count < this.totalCount) {
      if (this.totalCount - count < 20) {
        this.lastSection.itemsCount = this.totalCount - count
        sectionOptions.push(this.lastSection)
        break;
      }
      if (oneOrTwo++ % 2 == 0) {
        sectionOptions.push(this.oneColumnSection)
        count += this.oneColumnSection.itemsCount
      } else {
        sectionOptions.push(this.twoColumnSection)
        count += this.twoColumnSection.itemsCount
      }
    }
    this.sections.splice(0, 0, sectionOptions)
  }


  build() {
    Column({ space: 2 }) {
      Row() {
        Button('update')
          .id('no_observed_update')
          .onClick(() => {
            // 在第二个分组增加4个FlowItem，注意保证LazyForEach中数据数量和所有分组itemsCount的和保持一致
            let newSection: SectionOptions = {
              itemsCount: 6,
              crossCount: 3,
              columnsGap: 5,
              rowsGap: 10,
              margin: 5,
              onGetItemMainSizeByIndex: (index: number) => {
                return this.itemHeightArray[index % 100]
              }
            }

            let oldCount = this.arrayHolder.arr.length
            for (let i = 0; i < 2; ++i) {
              this.arrayHolder.arr.push(oldCount + i)
            }
            this.totalCount = this.arrayHolder.arr.length
            const result: boolean = this.sections.update(0, newSection)
            console.info('update:' + result)
            this.mes = 'update: ' + result
          })

        Button('splice')
          .id('no_observed_splice')
          .onClick(() => {
            // 将所有分组替换成一个新分组，注意保证LazyForEach中数据数量和新分组itemsCount保持一致
            let totalCount: number = this.totalCount
            let newSection: SectionOptions = {
              itemsCount: totalCount,
              crossCount: 2,
              onGetItemMainSizeByIndex: (index: number) => {
                return this.itemHeightArray[index % 100]
              }
            }
            let oldLength: number = this.sections.length()
            const result: boolean = this.sections.splice(0, oldLength, [newSection])
            this.mes = 'splice: ' + result
          })

        Button('new section')
          .id('no_observed_new')
          .onClick(() => {
            // 将所有分组替换成一个新分组，注意保证LazyForEach中数据数量和新分组itemsCount保持一致
            let totalCount: number = this.totalCount
            this.arrayHolder.arr.push(...[totalCount])
            let newSection: SectionOptions = {
              itemsCount: totalCount + 1,
              crossCount: 2,
              onGetItemMainSizeByIndex: (index: number) => {
                return this.itemHeightArray[index % 100]
              }
            }
            this.sections = new WaterFlowSections()
            const result: boolean = this.sections.push(newSection)
            this.totalCount = this.arrayHolder.arr.length
            this.mes = 'new: ' + result
          })
      }

      Text(this.mes)
        .id('no_observed_mess')
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        Repeat(this.arrayHolder.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .key((item, index) => `${index}-${item}`)
          .each((r) => {
            FlowItem() {
              ReusableItem({ reusableItem: r.item })
            }
            .width('100%')
            .height(this.itemHeightArray[r.item % 100])
            .backgroundColor(this.colors[r.item % 5])
          })
      }
      .scrollBar(BarState.On)
      .scrollBarWidth(20)
      .itemConstraintSize({
        minWidth: 0,
        maxWidth: '100%',
        minHeight: 0,
        maxHeight: '100%'
      })
      .onReachEnd(() => {
        let oldCount = this.arrayHolder.arr.length
        let newData: number[] = []
        for (let i = 0; i < 10; ++i) {
          newData.push(oldCount + i)
        }
        this.arrayHolder.arr.push(...newData)
        this.totalCount = this.arrayHolder.arr.length
        const sections: SectionOptions[] = this.sections.values();
        let newSection: SectionOptions = sections[this.sections.length() - 1];
        newSection.itemsCount += 10;
        this.sections.update(-1, newSection);
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
        return { offsetRemain: offset }
      })
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('45%')

    }.width('100%')
    .margin({ top: 5 })
  }
}