'use static';
/*
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
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node';
import { Entry, Component, Column, Image, Button, Edges, $r, ClickEvent, LocalizedEdges } from '@ohos.arkui.component'

@Entry
@Component
struct IndexOff {
  build() {
    Column() {
      Image($r('app.media.icon'))
        .key("top_off")
        .width(20).height(20)
        .position({ left: 0, top: 0 } as Edges)
      Image($r('app.media.icon'))
        .key("bottom_off")
        .width(20).height(20)
        .position({ left: '100%', top: '100%' } as Edges)
      Button('0100_Text')
        .onClick((e: ClickEvent) => {
        })
        .key("0100_Text")
        .width(20)
        .height('30px')
        .offset({ start: LengthMetrics.px(100), top: LengthMetrics.px(100) } as LocalizedEdges)
      Button('0200_Button')
        .onClick((e: ClickEvent) => {
        })
        .width(100)
        .height('30px')
        .key("0200_Button")
        .offset({ end: LengthMetrics.vp(100), top: LengthMetrics.vp(120) } as LocalizedEdges)
      Button('0300_Image')
        .onClick((e: ClickEvent) => {
        })
        .key("0300_Image")
        .width(20).height('30px')
        .offset({ start: LengthMetrics.fp(100), bottom: LengthMetrics.fp(-200) } as LocalizedEdges)
      Button('0400_Text')
        .onClick((e: ClickEvent) => {
        })
        .key("0400_Text")
        .width(20)
        .height('30px')
        .offset({ end: LengthMetrics.lpx(100), bottom: LengthMetrics.lpx(-400) } as LocalizedEdges)
      Button('0500_Button')
        .onClick((e: ClickEvent) => {
        })
        .width(100)
        .height('30px')
        .key("0500_Button")
        .offset({ start: LengthMetrics.percent(0), top: LengthMetrics.percent(0) } as LocalizedEdges)
      Button('0600_Image')
        .onClick((e: ClickEvent) => {
        })
        .key("0600_Image")
        .width(20).height('30px')
        .offset({ end: LengthMetrics.percent(0.5), bottom: LengthMetrics.percent(-0.5) } as LocalizedEdges)
      Button('0700_Image')
        .onClick((e: ClickEvent) => {
        })
        .key("0700_Image")
        .width(20).height('30px')
        .offset({ start: undefined, top: undefined } as LocalizedEdges)
      Button('0800_Button')
        .onClick((e: ClickEvent) => {
        })
        .width(100)
        .height('30px')
        .key("0800_Button")
        .offset({ start: undefined, top: undefined } as LocalizedEdges)
      Button('0900_Text')
        .onClick((e: ClickEvent) => {
        })
        .key("0900_Text")
        .width(20)
        .height('30px')
        .offset({ start: LengthMetrics.percent(0), top: LengthMetrics.percent(0) } as LocalizedEdges)
    }.height('100%').width('100%')
  }
}