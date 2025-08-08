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

@Entry
@Component
struct ListVisibleExample {
  scroller: Scroller = new Scroller()
  @State message: string = 'mess'
  @State message1: string = 'mess1'
  private visTable: visTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    },
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    }
  ]

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .height(vp2px(50))
      .padding(10)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + "节课")
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .height(vp2px(80))
      .padding(10)
  }

  build() {
    Column() {
      Text(this.message).id('listVisible_mess')
      Text(this.message1).id('itemVisible_mess')
      Button('scroll vp2px(100)').id('listVisible_1')
        .height('5%')
        .onClick(() => {
          this.scroller.scrollBy(0, vp2px(100))
        })

      Button('scroll vp2px(150)').id('listVisible_2')
        .height('5%')
        .onClick(() => {
          this.scroller.scrollBy(0, vp2px(150))
        })

      List({ space: 20, initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.visTable, (item: visTable) => {
          ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
            ForEach(item.projects, (project: string) => {
              ListItem() {
                Text(project)
                  .width("100%")
                  .height(vp2px(50))
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
        })
      }
      .id('list_Visible')
      .scrollBar(BarState.On)
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        this.message = 'onScrollVisibleContentChange: '+ start.itemGroupArea
        this.message1 = 'itemIndexInGroup: '+ start.itemIndexInGroup
        console.log(' start index: ' + start.index +
          ' start item group area: ' + start.itemGroupArea +
          ' start index in group: ' + start.itemIndexInGroup)
        console.log(' end index: ' + end.index +
          ' end item group area: ' + end.itemGroupArea +
          ' end index in group: ' + end.itemIndexInGroup)
      })
      .width('90%')
      .height('70%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}

interface visTable {
  title: string;
  projects: string[];
}