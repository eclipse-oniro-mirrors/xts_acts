/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct IndexMark {
  build() {
    Column() {
      Image($r('app.media.icon'))
        .key("top_mark")
        .width(20).height(20)
        .position({ left: 0, top: 0 })
      Image($r('app.media.icon'))
        .key("bottom_mark")
        .width(20).height(20)
        .position({ left: '100%', top: '-100%' })
      Button('0100_TextM')
        .onClick(() => {
        })
        .key("0100_TextM")
        .width(20)
        .height('30px')
        .markAnchor({ start: LengthMetrics.px(100), top: LengthMetrics.px(-100) })
      Button('0200_ButtonM')
        .onClick(() => {
        })
        .width(100)
        .height('30px')
        .key("0200_ButtonM")
        .markAnchor({ start: LengthMetrics.vp(100), top: LengthMetrics.vp(-120) })
      Button('0300_ImageM')
        .onClick(() => {
        })
        .key("0300_ImageM")
        .width(20).height('30px')
        .markAnchor({ start: LengthMetrics.fp(100), top: LengthMetrics.fp(-200) })
      Button('0400_TextM')
        .onClick(() => {
        })
        .key("0400_TextM")
        .width(20)
        .height('30px')
        .markAnchor({ start: LengthMetrics.lpx(100), top: LengthMetrics.lpx(-400) })
      Button('0500_ButtonM')
        .onClick(() => {
        })
        .width(100)
        .height('30px')
        .key("0500_ButtonM")
        .markAnchor({ start: LengthMetrics.px(0), top: LengthMetrics.px(0) })
      Button('0600_ImageM')
        .onClick(() => {
        })
        .key("0600_ImageM")
        .width('30px').height('30px')
        .markAnchor({ start: LengthMetrics.percent(0.5), top: LengthMetrics.percent(-0.5) })
      Button('0700_ImageM')
        .onClick(() => {
        })
        .key("0700_ImageM")
        .width(20).height('30px')
        .markAnchor({ start: null, top: null })
      Button('0800_ButtonM')
        .onClick(() => {
        })
        .width(100)
        .height('30px')
        .key("0800_ButtonM")
        .markAnchor({ start: undefined, top: undefined })
      Button('0900_TextM')
        .onClick(() => {
        })
        .key("0900_TextM")
        .width(20)
        .height('30px')
        .markAnchor({ start: LengthMetrics.percent(null), top: LengthMetrics.percent(undefined) })
    }.height('100%').width('100%')
  }
}