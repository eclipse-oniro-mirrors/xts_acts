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
struct getVisibleContentInfo {
  private timeTable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    },
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    },
    {
      title: '星期三',
      projects: ['历史', '地理', '政治']
    },
    {
      title: '星期四',
      projects: ['美术', '音乐', '体育']
    }
  ]
  private scroller: ListScroller = new ListScroller()
  @State listIndexInfo: VisibleListContentInfo = {index: -1}
  @State mess:string = 'null'
  @State itemBackgroundColorArr: boolean[] = [false]

  build() {
    Column() {
      List({ space: 5, scroller: this.scroller}) {
        ForEach(this.timeTable, (item: TimeTable, index: number) => {
          ListItemGroup() {
            ForEach(item.projects, (project: string, subIndex: number) => {
              ListItem() {
                Text(project)
                  .width('100%')
                  .height(50)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(this.itemBackgroundColorArr[index *3 +subIndex] ? 0x68B4FF: 0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
        },(item: string) => item)
      }
      .width('90%')
      .sticky(StickyStyle.Header | StickyStyle.Footer)
      .scrollBar(BarState.Off)
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event: GestureEvent) => {
            if (event.fingerList[0] != undefined &&
              event.fingerList[0].localX != undefined &&
              event.fingerList[0].localY != undefined) {
              this.listIndexInfo  = this.scroller.getVisibleListContentInfo(
                event.fingerList[0].localX,
                event.fingerList[0].localY
              );
              let itemIndex:string = 'undefined';
              if (this.listIndexInfo.itemIndexInGroup != undefined ) {
                itemIndex = this.listIndexInfo.itemIndexInGroup.toString()
                if (this.listIndexInfo.index != undefined &&
                  this.listIndexInfo.index >= 0 &&
                  this.listIndexInfo.itemIndexInGroup >= 0 ) {
                  this.itemBackgroundColorArr[
                    this.listIndexInfo.index * 3 + this.listIndexInfo.itemIndexInGroup
                  ] = true;
                }
              }
              this.mess = 'index:' + this.listIndexInfo.index.toString() + ' itemIndex:' + itemIndex
            }
          })
      )
      
      Text('Item: '+ this.mess)
        .id('list_getMess')
        .fontColor(Color.Red)
        .height(20)
      
    }.width('100%')
    .height('60%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}

interface TimeTable {
  title: string;
  projects: string[];
}