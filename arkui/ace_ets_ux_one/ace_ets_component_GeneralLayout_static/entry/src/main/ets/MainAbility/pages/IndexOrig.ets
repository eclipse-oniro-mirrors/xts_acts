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
import { Entry, Component, Column, Image, Button, Edges, $r, ClickEvent,
  LocalizedEdges, Button, Position } from '@ohos.arkui.component'

@Entry
@Component
struct IndexOrig {

  build() {
    Column() {
      Image($r('app.media.icon'))
        .key("top_orig")
        .width('30px').height('30px')
        .position({ left: 0, top: 0 } as Edges)
      Image($r('app.media.icon'))
        .key("bottom_orig")
        .width('30px').height('30px')
        .position({ left: '100%', top: '100%' } as Edges)
      Button('Original_0100').onClick((e: ClickEvent) => {
      })
        .key("Original_0100")
        .width('20%')
        .height('30px')
        .position({ left: '100px', top: 100 } as Edges)
      Button('Original_0200').onClick((e: ClickEvent) => {
      }).width(100)
        .height('30px')
        .key("Original_0200")
        .position({ right: '100fp', bottom: '100lpx' } as Edges)
      Button('Original_0300').onClick((e: ClickEvent) => {
      })
        .key("Original_0300")
        .width(20).height('30px')
        .position({ x: 100, y: 100 } as Position)
      Button('Original_0400').onClick((e: ClickEvent) => {
      })
        .key("Original_0400")
        .width('20%')
        .height('30px')
        .markAnchor({ x: '100px', y: -100 } as Position)
      Button('Original_0500').onClick((e: ClickEvent) => {
      }).width(100)
        .height('30px')
        .key("Original_0500")
        .markAnchor({ x: '-100fp', y: '-100lpx' } as Position)
      Button('Original_0600').onClick((e: ClickEvent) => {
      })
        .key("Original_0600")
        .width('20%')
        .height('30px')
        .offset({ left: '100px', top: 100 } as Edges)
      Button('Original_0700').onClick((e: ClickEvent) => {
      }).width(100)
        .height('30px')
        .key("Original_0700")
        .offset({ right: '100fp', bottom: '-100lpx' } as Edges)
      Button('Original_0800').onClick((e: ClickEvent) => {
      })
        .key("Original_0800")
        .width(20)
        .height('30px')
        .offset({ x: 100, y: 100 } as Position)
    }.height('100%').width('100%')
  }
}