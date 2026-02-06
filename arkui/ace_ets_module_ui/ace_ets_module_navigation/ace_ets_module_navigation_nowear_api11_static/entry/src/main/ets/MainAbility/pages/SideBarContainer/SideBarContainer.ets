'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  Row,
  ClickEvent,
  Margin,
  ButtonType,
  SideBarContainer,
  SideBarContainerType,
  ForEach,
  Color,
  ColumnOptions,
  Resource,
  ButtonStyle,
  TextOverflow,
  TextAlign,
  $r,
  SideBarPosition,
  DividerStyle,
  Length

} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct SideBarTest {
  @State strokeWidthStr: string = '10px'
  @State dividerColorStr: string  = '#000000'
  @State startMarginStr: string = '5px'
  @State endMarginStr: string = '5px'

  @State nullFlag: boolean = false

  @State dividerColor: Color = Color.Red

  @State strokeWidthNum: number = 10
  @State dividerColorNum: int = 0x000000
  @State startMarginNum: double = 5
  @State endMarginNum: number = 5

  @State strokeWidthRes: Resource = $r('app.string.Divider_width')
  @State dividerColorRes: Resource = $r('app.color.Divider_color')
  @State startMarginRes: Resource = $r('app.string.Divider_startMargin')
  @State endMarginRes: Resource = $r('app.string.Divider_endMargin')

  private stateChangCallBack:(eventData: events_emitter.EventData) => void  = (eventData: events_emitter.EventData) => {
    console.info("sideBar page state change called:" + JSON.stringify(eventData));
    const data = eventData.data as Record<String,RecordData>
    if (eventData != null) {
      if (data['dividerColorStr'] != null) {
        this.dividerColorStr = data['dividerColorStr'] as string;
        console.log("===================================== this.dividerColorStr" + this.dividerColorStr );
      }
      if (data['strokeWidthStr'] != null) {
        this.strokeWidthStr = data['strokeWidthStr'] as string;
      }
      if (data['startMarginStr']  != null) {
        this.startMarginStr = data['startMarginStr'] as string;
      }
      if (data['endMarginStr'] != null) {
        this.endMarginStr = data['endMarginStr'] as string;
        console.log("===================================== this.endMarginStr" + this.endMarginStr);
      }
      if (data['nullFlag'] != null) {
        this.nullFlag = data['nullFlag'] as boolean;
      }
      if (data['dividerColor'] != null) {
        this.dividerColor = data['dividerColor'] as Color;
      }
      if (data['strokeWidthNum'] != null) {
        this.strokeWidthNum = data['strokeWidthNum'] as double;
      }
      if (data['dividerColorNum'] != null) {
        this.dividerColorNum = data['dividerColorNum'] as int;
      }
      if (data['startMarginNum'] != null) {
        this.startMarginNum = data['startMarginNum'] as double;
      }
      if (data['endMarginNum'] != null) {
        this.endMarginNum = data['endMarginNum'] as double;
        console.log("===================================== " + this.endMarginNum);
      }

      if (data['dividerColorRes'] != null) {
        this.dividerColorRes = data['dividerColorRes'] as Resource;
      }
      if (data['strokeWidthRes'] != null) {
        this.strokeWidthRes = data['strokeWidthRes'] as Resource;
      }
      if (data['startMarginRes'] != null) {
        this.startMarginRes = data['startMarginRes'] as Resource;
      }
      if (data['endMarginRes'] != null) {
        this.endMarginRes = data['endMarginRes'] as Resource;
      }
    }
  }

  aboutToAppear(){
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      SideBarContainer(SideBarContainerType.Embed)
      {
        Column() {}
        Column() {}
      }
      .showSideBar(true)
      .sideBarWidth(120)
      .minSideBarWidth(100)
      .maxSideBarWidth(150)
      .sideBarPosition(SideBarPosition.Start)
      .height('200vp')
      .key('sideBarTest1')
      .controlButton({
        left: 16, top: 48, width: 32, height: 32,
        icons: {shown: $r("app.media.icon"),
          hidden: $r("app.media.icon"),
          switching: $r("app.media.icon")}
      })

      SideBarContainer(SideBarContainerType.Embed)
      {
        Column() {}
        Column() {}
      }
      .showSideBar(true)
      .sideBarWidth(120)
      .minSideBarWidth(100)
      .maxSideBarWidth(150)
      .sideBarPosition(SideBarPosition.Start)
      .height('200vp')
      .key('sideBarTest2')
      .controlButton({
        left: 16, top: 48, width: 32, height: 32,
        icons: {shown: $r("app.media.icon"),
          hidden: $r("app.media.icon"),
          switching: $r("app.media.icon")}
      })
      .divider(this.nullFlag ? null : { strokeWidth: this.strokeWidthNum,
                                        color: this.dividerColorNum,
                                        startMargin: this.startMarginNum,
                                        endMargin: this.endMarginNum
                                      } as DividerStyle)
      //待确认是否可以删除null
      SideBarContainer(SideBarContainerType.Embed)
      {
        Column() {}
        Column() {}
      }
      .showSideBar(true)
      .sideBarWidth(120)
      .minSideBarWidth(100)
      .maxSideBarWidth(150)
      .sideBarPosition(SideBarPosition.Start)
      .height('200vp')
      .key('sideBarTest3')
      .controlButton({
        left: 16, top: 48, width: 32, height: 32,
        icons: {shown: $r("app.media.icon"),
          hidden: $r("app.media.icon"),
          switching: $r("app.media.icon")}
      })
      .divider({ strokeWidth: this.strokeWidthStr,
        color: this.dividerColorStr,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      } as DividerStyle)

      SideBarContainer(SideBarContainerType.Embed)
      {
        Column() {}
        Column() {}
      }
      .showSideBar(true)
      .sideBarWidth(120)
      .minSideBarWidth(100)
      .maxSideBarWidth(150)
      .sideBarPosition(SideBarPosition.Start)
      .height('200vp')
      .key('sideBarTest4')
      .controlButton({
        left: 16, top: 48, width: 32, height: 32,
        icons: {shown: $r("app.media.icon"),
          hidden: $r("app.media.icon"),
          switching: $r("app.media.icon")}
      })
      .divider({ strokeWidth: this.strokeWidthRes,
        color: this.dividerColorRes,
        startMargin: this.startMarginRes,
        endMargin: this.endMarginRes
      } as DividerStyle)

      SideBarContainer(SideBarContainerType.Embed)
      {
        Column() {}
        Column() {}
      }
      .showSideBar(true)
      .sideBarWidth(120)
      .minSideBarWidth(100)
      .maxSideBarWidth(150)
      .sideBarPosition(SideBarPosition.Start)
      .height('200vp')
      .key('sideBarTest5')
      .controlButton({
        left: 16, top: 48, width: 32, height: 32,
        icons: {shown: $r("app.media.icon"),
          hidden: $r("app.media.icon"),
          switching: $r("app.media.icon")}
      })
      .divider({ strokeWidth: this.strokeWidthNum,
        color: this.dividerColor,
        startMargin: this.startMarginNum,
        endMargin: this.endMarginNum
      } as DividerStyle)

      SideBarContainer(SideBarContainerType.Embed)
      {
        Column() {}
        Column() {}
      }
      .showSideBar(true)
      .sideBarWidth(120)
      .minSideBarWidth(100)
      .maxSideBarWidth(150)
      .sideBarPosition(SideBarPosition.Start)
      .height('200vp')
      .key('sideBarTest6')
      .controlButton({
        left: 16, top: 48, width: 32, height: 32,
        icons: {shown: $r("app.media.icon"),
          hidden: $r("app.media.icon"),
          switching: $r("app.media.icon")}
      })
      .divider({ strokeWidth: this.strokeWidthNum })
    }
  }
}
