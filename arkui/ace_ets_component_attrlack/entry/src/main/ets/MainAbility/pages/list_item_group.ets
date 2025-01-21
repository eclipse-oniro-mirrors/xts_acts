/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';
const TAG = 'ets_apiLack_add';

function itemHeadBuilder(text: string) {
  @Builder function itemHead() {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(10)
  }
  return itemHead
}

function itemFootBuilder(num: number) {
  @Builder function itemFoot() {
    Text('共' + num + "节课")
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(5)
  }
  return itemFoot
}

@Entry
@Component
struct ListItemGroupExample {
  private timetable: any = [
    {
      title:'Mon',
      projects:['语文', '数学', '英语']
    },
    {
      title:'Tues',
      projects:['物理', '化学', '生物']
    },
    {
      title:'Wens',
      projects:['历史', '地理', '政治']
    },
    {
      title:'Thur',
      projects:['美术', '音乐', '体育']
    }
  ]

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.timetable, (item) => {
          ListItemGroup({ header:itemHeadBuilder(item.title), footer:itemFootBuilder(item.projects.length) }) {
            ForEach(item.projects, (project) => {
              ListItem() {
                Text(project)
                  .width("100%").height(100).fontSize(20)
                  .textAlign(TextAlign.Center).backgroundColor(0xFFFFFF)
              }
            }, item => item)
          }
          .key(item)
          .borderRadius(20)
          .divider({ strokeWidth: 1, color: Color.Blue}) // 每行之间的分界线
          })
        }
          .width('90%')
          .sticky(StickyStyle.Header | StickyStyle.Footer)
      }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 })
    }
  }