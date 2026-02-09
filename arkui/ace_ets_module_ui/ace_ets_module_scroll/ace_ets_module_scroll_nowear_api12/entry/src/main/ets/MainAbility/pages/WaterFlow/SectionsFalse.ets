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
struct WaterFlowSectionsFalse {
  minSize: number = 80;
  maxSize: number = 180;
  colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  scroller: Scroller = new Scroller();
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  dataCount: number = this.dataSource.totalCount();
  private itemHeightArray: number[] = [];
  @State sections: WaterFlowSections = new WaterFlowSections();

  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize());
    }
  }

  aboutToAppear() {
    this.setItemSizeArray();

    let sectionOptions: SectionOptions[] = [];

    // 将配置好的分组添加到WaterFlow中
    this.sections.splice(0, 0, sectionOptions);
  }

  build() {
    Column({ space: 2 }) {
      Button('WaterFlowSections false')
        .id('sections_false')
        .margin(10)
        .onClick(() => {
          let totalCount: number = this.dataSource.totalCount();
          let newSection: SectionOptions = {
            itemsCount: -1,
          };
          let oldLength: number = this.sections.length();

          let spliceFalse: boolean = this.sections.splice(0, oldLength, [newSection]);
          AppStorage.SetOrCreate('spliceFalse', spliceFalse);

          let pushFalse: boolean = this.sections.push(newSection);
          AppStorage.SetOrCreate('pushFalse', pushFalse);

          let updateFalse:boolean = this.sections.update(0, newSection);
          AppStorage.SetOrCreate('updateFalse', updateFalse);

          const valuesNull: SectionOptions[] = this.sections.values();
          AppStorage.SetOrCreate('valuesNull', valuesNull);
          let valuesLength:number = this.sections.length();
          console.log('values length: ' + valuesLength);
        })

      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12).height('16')
            }
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(this.colors[item % this.colors.length])
        }, (item: string) => item)
      }
      .width('90%')
      .height('50%')
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}