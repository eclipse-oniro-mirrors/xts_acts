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
import { TimeTable, ProjectsDataSource, TimeTableDataSource } from './ListDataSource';

@Entry
@Component
struct GroupStickyBothExample {
  itemGroupArray: TimeTableDataSource = new TimeTableDataSource([]);

  aboutToAppear(): void {
    let timeTable: TimeTable[] = [
      {
        title: '课程',
        projects: ['语文', '数学', '英语', '地理', '政治']
      }
    ];
    this.itemGroupArray = new TimeTableDataSource(timeTable);
  }

  @Builder
  itemHead(text: string) {
    Text(text)
      .id('sticky_both_head')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '节课')
      .id('sticky_both_foot')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
  }

  build() {
    Column() {
      List({ space: 10 }) {
        LazyForEach(this.itemGroupArray, (item: TimeTable) => {
          ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
            LazyForEach(new ProjectsDataSource(item.projects), (project: string) => {
              ListItem() {
                Text(project)
                  .width('100%')
                  .height('25%')
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue })
        })
      }
      .id('group_sticky_both')
      .width('90%')
      .height('60%')
      .sticky(StickyStyle.BOTH)
      .scrollBar(BarState.On)
      .margin({ top: 5 })
    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}