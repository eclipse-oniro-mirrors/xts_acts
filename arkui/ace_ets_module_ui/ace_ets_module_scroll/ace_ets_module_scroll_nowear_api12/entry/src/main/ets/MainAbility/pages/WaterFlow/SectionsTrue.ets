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
import { WaterFlowDataSource } from './WaterFlowDataSource';

@Entry
@Component
struct WaterFlowSectionsTrue {
  scroller: Scroller = new Scroller()
  @State minSize: number = 80
  @State maxSize: number = 180
  @State dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  dataCount: number = this.dataSource.totalCount();
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  @State sections: WaterFlowSections = new WaterFlowSections()
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize());
    }
  }
  oneColumnSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 3,
    columnsGap: 0,
    rowsGap: 15,
    margin: { top: '10vp', left: '15px', bottom: '5%', right: 1.0 },
    onGetItemMainSizeByIndex: (index: number) => {
      console.info('index:' + index + ' ' + this.itemHeightArray[index % 100])
      return this.itemHeightArray[index % 100]
    }
  }
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
    margin: { bottom: '20%'},
    onGetItemMainSizeByIndex: (index: number) => {
      return 100
    }
  }
  lastSection: SectionOptions = {
    itemsCount: 20,
    crossCount: 2,
    margin: { top: '10vp', left: '15px', bottom: '20', right: 1 },
    onGetItemMainSizeByIndex: (index: number) => {
      return this.itemHeightArray[index % 100]
    }
  }

  getItemHeight(index: number) {
    let i = index % 6
    if (i == 4 || i == 5) {
      return 100
    } else {
      return this.itemHeightArray[index % 100]
    }
  }

  aboutToAppear() {
    this.setItemSizeArray();
    let sectionOptions: SectionOptions[] = []
    let count = 0
    let oneOrTwo = 0
    while (count < this.dataCount) {
      if (this.dataCount - count < 20) {
        this.lastSection.itemsCount = this.dataCount - count
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
    let spliceTrue:boolean = this.sections.splice(0, 0, sectionOptions)
    AppStorage.SetOrCreate('spliceTrue', spliceTrue);
    console.log('spliceTrue 1111222: ' + spliceTrue)
  }

  build() {
    Column({ space: 2 }) {
      Button('values')
        .id('sections_true_values')
        .margin({ top: 10 })
        .onClick(() => {
          const iterator = this.sections.values();
          for (const value of iterator) {
            console.log(JSON.stringify(value));
          }
          AppStorage.SetOrCreate('values', iterator);

          let valuesLength:number = this.sections.length();
          console.log('values length: ' + valuesLength);
        })

      Row() {
        // 修改第二个分组的布局，新增四个item，改为三行(sectionIndex在此处设为-33效果等同于1)
        Button('update')
          .id('sections_true_update')
          .onClick(() => {
            let newSection: SectionOptions = {
              itemsCount: 6,
              crossCount: 2,
              columnsGap: 5,
              rowsGap: 10,
              margin: { top: 10, left: 5, bottom: 10, right: 5 },
              onGetItemMainSizeByIndex: (index: number) => {
                return this.itemHeightArray[index % 100]
              }
            }
            this.dataSource.addItem(this.oneColumnSection.itemsCount)
            this.dataSource.addItem(this.oneColumnSection.itemsCount + 1)
            this.dataSource.addItem(this.oneColumnSection.itemsCount + 2)
            this.dataSource.addItem(this.oneColumnSection.itemsCount + 3)

            const updateTrue = this.sections.update(-33, newSection)
            AppStorage.SetOrCreate('updateTrue', updateTrue);
          })
        Button('push')
          .id('sections_true_push')
          .onClick(() => {
            let newSection: SectionOptions = {
              itemsCount: 10,
              crossCount: 5,
              columnsGap: 5,
              rowsGap: 10,
              margin: { top: 10, left: 5, bottom: 10, right: 5 },
              onGetItemMainSizeByIndex: (index: number) => {
                return this.itemHeightArray[index % 100]
              }
            }
            for (let i = 0; i < 10; i++) {
              this.dataSource.addLastItem()
            }
            let pushTrue: boolean = this.sections.push(newSection)
            AppStorage.SetOrCreate('pushTrue', pushTrue);
          })
      }

      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12).height('16')
            }
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(0xFFE4E1)
          .borderWidth(2)
        }, (item: string) => item)
      }
      .scrollBar(BarState.On)
      .scrollBarWidth(30)
      .scrollBarColor('#00F5FF')
      .height('60%')
      .width('100%')
      .columnsGap(10)
      .rowsGap(10)
      .backgroundColor(0xFAEEE0)
      .borderWidth(2)
      .borderColor(Color.Red)
      .borderRadius(10)
    }
    .width('100%')
    .height('100%')
  }
}