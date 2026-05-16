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
import hilog from '@ohos.hilog';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node';
import { Entry, Component, Column, Image, Button, Edges, $r, ClickEvent, LocalizedEdges } from '@ohos.arkui.component'

@Entry
@Component
struct Index {
  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      AppStorage.setOrCreate<UIContext>('uiContext', this.getUIContext());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Image($r('app.media.icon'))
        .key("top")
        .width(20).height(20)
        .position({ left: 0, top: 0 } as Edges)
      Image($r('app.media.icon'))
        .key("bottom")
        .width(20).height(20)
        .position({ left: '100%', top: '100%' } as Edges)
      Button('0100_ButtonA').onClick((e: ClickEvent) => {
      }).width(100)
        .key("0100_ButtonA")
        .position({ end: LengthMetrics.vp(100), top: LengthMetrics.vp(100) } as LocalizedEdges)
      Button('0200_TextA').onClick((e: ClickEvent) => {
      }).key("0200_TextA")
        .width('20%')
        .position({ start: LengthMetrics.px(100), top: LengthMetrics.px(100) } as LocalizedEdges)
      Button('0300_ImageA').onClick((e: ClickEvent) => {
      }).key("0300_ImageA")
        .width(20).height(20)
        .position({ start: LengthMetrics.fp(300), bottom: LengthMetrics.fp(300) } as LocalizedEdges)
      Button('0400_TextB').onClick((e: ClickEvent) => {
      }).key("0400_TextB")
        .width('20%')
        .position({ end: LengthMetrics.lpx(400), bottom: LengthMetrics.lpx(400) } as LocalizedEdges)
      Button('0500_ButtonB').onClick((e: ClickEvent) => {
      }).width(100)
        .key("0500_ButtonB")
        .position({ start: LengthMetrics.px(0), top: LengthMetrics.px(0) } as LocalizedEdges)
      Button('0600_ImageB').onClick((e: ClickEvent) => {
      }).key("0600_ImageB")
        .width(20).height(20)
        .position({ end: LengthMetrics.percent(0.5), bottom: LengthMetrics.percent(0.5) } as LocalizedEdges)
      Button('0700_TextC').onClick((e: ClickEvent) => {
      }).key("0700_TextC")
        .width('20%')
        .position({ start: undefined, top: undefined } as LocalizedEdges)
      Button('0800_ButtonC').onClick(() => {
      }).width(100)
        .key("0800_ButtonC")
        .position({ start: undefined, top: undefined } as LocalizedEdges)
      Button('0900_ImageC').onClick((e: ClickEvent) => {
      }).key("0900_ImageC")
        .width(20).height(20)
        .position({ start: LengthMetrics.px(0), top: LengthMetrics.px(0) } as LocalizedEdges)
    }.height('100%').width('100%')
  }
}