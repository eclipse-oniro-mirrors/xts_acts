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
struct ListItemGroupAnimationPage {
  @State message: string = 'mess'
  private scroller: ListScroller = new ListScroller()
  private tableAnimation: TableAnimation[] = [
    {
      title: '星期一',
      projects: ['语文', '数学']
    },
    {
      title: '星期二',
      projects: ['英语', '物理', '生物']
    },
    {
      title: '星期三',
      projects: ['历史', '政治']
    }
  ]

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '节课')
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width('100%')
  }

  build() {
    Column() {
      Text(this.message).id('group_change_mess')
      Button('next page2')
        .id('group_animation_true')
        .onClick(() => {
          this.scroller.scrollPage({ next: true, animation: true })
        })
		
      List({ scroller: this.scroller }) {
        ForEach(this.tableAnimation, (item: TableAnimation) => {
          ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
            ForEach(item.projects, (project: string) => {
              ListItem() {
                Text(project)
                  .width('100%')
                  .height('20%')
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue })
        })
      }
      .scrollBar(BarState.On)
      .width('90%')
      .height('60%')
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        this.message = 'onScrollVisibleContentChange: '+ start.index
        console.log(' start index: ' + start.index +
          ' start item group area: ' + start.itemGroupArea +
          ' start index in group: ' + start.itemIndexInGroup)
        console.log(' end index: ' + end.index +
          ' end item group area: ' + end.itemGroupArea +
          ' end index in group: ' + end.itemIndexInGroup)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}

interface TableAnimation {
  title: string;
  projects: string[];
}