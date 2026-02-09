'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Flex,
  ClickEvent,
  Scroller,
  Color,
  ResourceColor,
  OnScrollFrameBeginHandlerResult,
  Image,
  TextAlign,
  Scroll,
  ScrollState,
  ForEach,
  EdgeEffect,
  Resource,
  Builder,
  Padding,
  $r,
  StickyStyle,
  Text,
  Button,
  ClickEvent,
  List,
  ListItem,
  ListItemGroup,
  BarState,
  wrapBuilder,CustomBuilderT
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class HeadBuilderParams {
  public text: string | Resource;
  public colorMode: boolean = false

  constructor(text: string | Resource) {
    this.text = text;
  }
}

class FootBuilderParams {
  public num: int | Resource;
  public colorMode: boolean = false

  constructor(num: int | Resource) {
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
    .backgroundColor('0xAABBCC')
}

@Builder
function itemFoot(params: FootBuilderParams) {
  Text('共' + params.num + '节课')
    .fontSize(20)
    .height('20vp')
    .width('100%')
    .padding(5)
    .fontColor($r('sys.color.font_secondary'))
    .backgroundColor('0xAABBCC')
}

@Component
struct MyItemGroup {
  @State item: TimeTable = { title: '', projects: [] } as TimeTable
  header ?: ComponentContent<HeadBuilderParams> = undefined
  footer ?: ComponentContent<FootBuilderParams> = undefined
  headerParam:HeadBuilderParams = new HeadBuilderParams(this.item.title)
  footerParam:FootBuilderParams = new FootBuilderParams(this.item.projects.length)

  aboutToAppear(): void {
    this.header = new ComponentContent<HeadBuilderParams>(this.getUIContext(), wrapBuilder(itemHead), this.headerParam)
    this.footer = new ComponentContent<FootBuilderParams>(this.getUIContext(), wrapBuilder(itemFoot), this.footerParam)
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
    } as TimeTable,
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    } as TimeTable,
    {
      title: '星期三',
      projects: ['英语', '地理', '语文', '体育']
    } as TimeTable
  ]

  build() {
    Column(undefined) {
      Text('title: '+ this.timeTable[0].title)
        .id('list_title')
      Button('update')
        .id('list_header')
        .width(100)
        .height(20)
        .onClick((e:ClickEvent) => {
          this.timeTable[0] = {
            title: 'Monday',
            projects: ['政治', '美术', '历史', '体育']
          }
        })
      List({ space: 5 }) {
        ForEach(this.timeTable, (item: TimeTable) => {
          MyItemGroup({ item: item })
        }, (item: TimeTable) => item.title )
      }
      .width('90%')
      .sticky(StickyStyle.BOTH)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('60%')
    .backgroundColor($r('sys.color.background_primary'))
    .padding({ top: 5 } as Padding)
  }
}
interface TimeTable {
  title: string;
  projects: string[];
}