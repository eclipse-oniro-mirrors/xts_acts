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
import { ComponentContent } from '@ohos.arkui.node';

class HeadBuilderParams {
  public text: string | Resource;
  public colorMode: boolean = false

  constructor(text: string | Resource) {
    this.text = text;
  }
}

class FootBuilderParams {
  public num: number | Resource;
  public colorMode: boolean = false

  constructor(num: number | Resource) {
    this.num = num;
  }
}

@Builder
function itemHead(params: HeadBuilderParams) {
  Text(params.text)
    .fontSize(20)
    .height('20vp')
    .width('100%')
    .padding(5)
    .fontColor($r('sys.color.font_secondary'))
    .backgroundColor(0xAABBCC)
}

@Builder
function itemFoot(params: FootBuilderParams) {
  Text('共' + params.num + '节课')
    .fontSize(20)
    .height('20vp')
    .width('100%')
    .padding(5)
    .fontColor($r('sys.color.font_secondary'))
    .backgroundColor(0xAABBCC)
}

@Component
struct MyItemGroup {
  item: TimeTable = { title: '', projects: [] }
  header ?: ComponentContent<HeadBuilderParams> = undefined
  footer ?: ComponentContent<FootBuilderParams> = undefined
  headerParam = new HeadBuilderParams(this.item.title)
  footerParam = new FootBuilderParams(this.item.projects.length)

  aboutToAppear(): void {
    this.header = new ComponentContent(this.getUIContext(), wrapBuilder(itemHead), this.headerParam)
    this.footer = new ComponentContent(this.getUIContext(), wrapBuilder(itemFoot), this.footerParam)
  }
  GetHeader() {
    this.header?.update(new HeadBuilderParams(this.item.title));
    return this.header;
  }

  GetFooter() {
    this.footer?.update(new FootBuilderParams(this.item.projects.length));
    return this.footer;
  }

  build() {
    ListItemGroup({
      headerComponent: this.GetHeader(),
      footerComponent: this.GetFooter()
    }) {
      ForEach(this.item.projects, (project: string) => {
        ListItem() {
          Text(project)
            .width('100%')
            .height(30)
            .fontSize(20)
            .textAlign(TextAlign.Center)
        }
      }, (item: string) => item)
    }
    .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
  }
}

@Entry
@Component
struct ListItemGroupExample {
  @State timeTable: TimeTable[] = [
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
      projects: ['英语', '地理', '语文', '体育']
    }
  ]

  build() {
    Column() {
      Text('title: '+ this.timeTable[0].title)
        .id('list_title')
      Button('update')
        .id('list_header')
        .width(100)
        .height(20)
        .onClick(() => {
          this.timeTable[0] = {
            title: 'Monday',
            projects: ['政治', '美术', '历史', '体育']
          }
        })
      List({ space: 5 }) {
        ForEach(this.timeTable, (item: TimeTable) => {
          MyItemGroup({ item: item })
        })
      }
      .width('90%')
      .sticky(StickyStyle.Header | StickyStyle.Footer)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('60%')
    .backgroundColor($r('sys.color.background_primary'))
    .padding({ top: 5 })
  }
}
interface TimeTable {
  title: string;
  projects: string[];
}