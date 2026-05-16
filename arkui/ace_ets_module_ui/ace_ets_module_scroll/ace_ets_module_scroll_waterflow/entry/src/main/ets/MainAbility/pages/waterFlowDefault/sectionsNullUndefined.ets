/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { WaterFlowDataSource } from '../WaterFlowDataSource';

@Entry
@Component
struct WaterFlowSectionsNullUndefined {
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
    this.sections.splice(0, 0, sectionOptions)
  }

  build() {
    Column() {
      // ========== splice tests ==========
      Text('splice')
      Row() {
        // Test splice start with null
        Button('1null')
          .id('water_splice_nullUndefined_1')
          .onClick(() => {
            try {
              let spliceNull: boolean = this.sections.splice(null)
              AppStorage.setOrCreate('splice_start_null', spliceNull);
              console.log('ErrorJson splice_start_null:', spliceNull);
            } catch (error) {
              console.log('ErrorJson err splice_start_null:', error.code);
            }
          })

        // Test splice start with undefined
        Button('1undefined')
          .id('water_splice_nullUndefined_2')
          .onClick(() => {
            try {
              let spliceUndefined: boolean = this.sections.splice(undefined)
              AppStorage.setOrCreate('splice_start_undefined', spliceUndefined);
              console.log('ErrorJson splice_start_undefined:', spliceUndefined);
            } catch (error) {
              console.log('ErrorJson err splice_start_undefined:', error.code);
            }
          })
      }.height('5%')
      Row() {
        // Test splice deleteCount with null
        Button('2null')
          .id('water_splice_nullUndefined_3')
          .onClick(() => {
            try {
              let spliceNull: boolean = this.sections.splice(0, null)
              AppStorage.setOrCreate('splice_deleteCount_null', spliceNull);
              console.log('ErrorJson splice_deleteCount_null:', spliceNull);
            } catch (error) {
              console.log('ErrorJson err splice_deleteCount_null:', error.code);
            }
          })

        // Test splice deleteCount with undefined
        Button('2undefined')
          .id('water_splice_nullUndefined_4')
          .onClick(() => {
            try {
              let spliceUndefined: boolean = this.sections.splice(0, undefined)
              AppStorage.setOrCreate('splice_deleteCount_undefined', spliceUndefined);
              console.log('ErrorJson splice_deleteCount_undefined:', spliceUndefined);
            } catch (error) {
              console.log('ErrorJson err splice_deleteCount_undefined:', error.code);
            }
          })
      }.height('5%')
      Row() {
        // Test splice sections with null
        Button('3null')
          .id('water_splice_nullUndefined_5')
          .onClick(() => {
            try {
              let spliceNull: boolean = this.sections.splice(0, 1, null)
              AppStorage.setOrCreate('splice_sections_null', spliceNull);
              console.log('ErrorJson splice_sections_null:', spliceNull);
            } catch (error) {
              console.log('ErrorJson err splice_sections_null:', error.code);
            }
          })

        // Test splice sections with undefined
        Button('3undefined')
          .id('water_splice_nullUndefined_6')
          .onClick(() => {
            try {
              let spliceUndefined: boolean = this.sections.splice(0, 1, undefined)
              AppStorage.setOrCreate('splice_sections_undefined', spliceUndefined);
              console.log('ErrorJson splice_sections_undefined:', spliceUndefined);
            } catch (error) {
              console.log('ErrorJson err splice_sections_undefined:', error.code);
            }
          })

        // Test splice sections with empty array
        Button('3[]')
          .id('water_splice_nullUndefined_7')
          .onClick(() => {
            try {
              let spliceEmpty: boolean = this.sections.splice(0, 1, [])
              AppStorage.setOrCreate('splice_sections_empty', spliceEmpty);
              console.log('ErrorJson splice_sections_empty:', spliceEmpty);
            } catch (error) {
              console.log('ErrorJson err splice_sections_empty:', error.code);
            }
          })
      }.height('5%')

      // ========== push tests ==========
      Text('push')
      Row() {
        // Test push section with null
        Button('null')
          .id('water_push_nullUndefined_1')
          .onClick(() => {
            try {
              let pushNull: boolean = this.sections.push(null);
              AppStorage.setOrCreate('push_section_null', pushNull);
              console.log('ErrorJson push_section_null:', pushNull);
            } catch (error) {
              console.log('ErrorJson err push_section_null:', error.code);
            }
          })

        // Test push section with undefined
        Button('undefined')
          .id('water_push_nullUndefined_2')
          .onClick(() => {
            try {
              let pushUndefined: boolean = this.sections.push(undefined);
              AppStorage.setOrCreate('push_section_undefined', pushUndefined);
              console.log('ErrorJson push_section_undefined:', pushUndefined);
            } catch (error) {
              console.log('ErrorJson err push_section_undefined:', error.code);
            }
          })
      }.height('5%')

      // ========== update tests ==========
      Text('update')
      Row() {
        // Test update sectionIndex with null
        Button('1null')
          .id('water_update_nullUndefined_1')
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
            try {
              let updateNull: boolean = this.sections.update(null, newSection);
              AppStorage.setOrCreate('update_sectionIndex_null', updateNull);
              console.log('ErrorJson update_sectionIndex_null:', updateNull);
            } catch (error) {
              console.log('ErrorJson err update_sectionIndex_null:', error.code);
            }
          })

        // Test update sectionIndex with undefined
        Button('1undefined')
          .id('water_update_nullUndefined_2')
          .onClick(() => {
            let newSection: SectionOptions = {
              itemsCount: 10,
              crossCount: 5,
              columnsGap: 5,
              rowsGap: 10,
              onGetItemMainSizeByIndex: (index: number) => {
                return this.itemHeightArray[index % 100]
              }
            }
            try {
              let updateUndefined: boolean = this.sections.update(undefined, newSection);
              AppStorage.setOrCreate('update_sectionIndex_undefined', updateUndefined);
              console.log('ErrorJson update_sectionIndex_undefined:', updateUndefined);
            } catch (error) {
              console.log('ErrorJson err update_sectionIndex_undefined:', error.code);
            }
          })
      }.height('5%')

      Row() {
        // Test update section with null
        Button('2null')
          .id('water_update_nullUndefined_3')
          .onClick(() => {
            try {
              let updateNull: boolean = this.sections.update(1, null)
              AppStorage.setOrCreate('update_section_null', updateNull);
              console.log('ErrorJson update_section_null:', updateNull);
            } catch (error) {
              console.log('ErrorJson err update_section_null:', error.code);
            }
          })

        // Test update section with undefined
        Button('2undefined')
          .id('water_update_nullUndefined_4')
          .onClick(() => {
            try {
              let updateUndefined: boolean = this.sections.update(1, undefined)
              AppStorage.setOrCreate('update_section_undefined', updateUndefined);
              console.log('ErrorJson update_section_undefined:', updateUndefined);
            } catch (error) {
              console.log('ErrorJson err update_section_undefined:', error.code);
            }
          })
      }.height('5%')

      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Text('item' + item)
              .width('100%')
              .height('20%')
              .fontSize(14)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(0xFFE4E1)
          .borderWidth(1)
        }, (item: string) => item)
      }
      .id('waterFlow_sectionOptions_nullUndefined')
      .width('90%')
      .height('30%')
      .backgroundColor(0xFAEEE0)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}