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

import events_emitter from '@ohos.events.emitter';

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
  @State dividerColorNum: number = 0x000000
  @State startMarginNum: number = 5
  @State endMarginNum: number = 5

  @State strokeWidthRes: Resource = $r('app.string.Divider_width')
  @State dividerColorRes: Resource = $r('app.color.Divider_color')
  @State startMarginRes: Resource = $r('app.string.Divider_startMargin')
  @State endMarginRes: Resource = $r('app.string.Divider_endMargin')

  private stateChangCallBack = (eventData) => {
    console.info("sideBar page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      if (eventData.data.dividerColorStr != null) {
        this.dividerColorStr = eventData.data.dividerColorStr;
      }
      if (eventData.data.strokeWidthStr != null) {
        this.strokeWidthStr = eventData.data.strokeWidthStr;
      }
      if (eventData.data.startMarginStr != null) {
        this.startMarginStr = eventData.data.startMarginStr;
      }
      if (eventData.data.endMarginStr != null) {
        this.endMarginStr = eventData.data.endMarginStr;
      }
      if (eventData.data.nullFlag != null) {
        this.nullFlag = eventData.data.nullFlag;
      }
      if (eventData.data.dividerColor != null) {
        this.dividerColor = eventData.data.dividerColor;
      }
      if (eventData.data.strokeWidthNum != null) {
        this.strokeWidthNum = eventData.data.strokeWidthNum;
      }
      if (eventData.data.dividerColorNum != null) {
        this.dividerColorNum = eventData.data.dividerColorNum;
      }
      if (eventData.data.startMarginNum != null) {
        this.startMarginNum = eventData.data.startMarginNum;
      }
      if (eventData.data.endMarginNum != null) {
        this.endMarginNum = eventData.data.endMarginNum;
      }

      if (eventData.data.dividerColorRes != null) {
        this.dividerColorRes = eventData.data.dividerColorRes;
      }
      if (eventData.data.strokeWidthRes != null) {
        this.strokeWidthRes = eventData.data.strokeWidthRes;
      }
      if (eventData.data.startMarginRes != null) {
        this.startMarginRes = eventData.data.startMarginRes;
      }
      if (eventData.data.endMarginRes != null) {
        this.endMarginRes = eventData.data.endMarginRes;
      }
    }
  }

  aboutToAppear(){
    var stateChangeEvent = {
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
