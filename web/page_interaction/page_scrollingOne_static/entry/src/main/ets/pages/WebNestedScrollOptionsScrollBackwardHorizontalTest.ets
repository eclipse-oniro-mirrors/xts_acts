/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import { Driver } from '@ohos.UiTest';
import Utils from '../../src/test/Util.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium';
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import {
  $rawfile,
  BarPosition,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Edge,
  Entry,
  NestedScrollMode,
  NestedScrollOptions,
  OnScrollEvent,
  Row,
  Scroll,
  ScrollDirection,
  Scroller,
  ScrollResult,
  ScrollSource,
  ScrollState,
  TabContent,
  Tabs,
  Text,
  Web
} from '@ohos.arkui.component'

@Entry
@Component
struct WebNestedScrollOptionsScrollBackwardHorizontalTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  scroller: Scroller = new Scroller()
  @State str: string = '';
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0
  @State scrollForwardEnums: NestedScrollMode = NestedScrollMode.SELF_FIRST
  @State scrollBackwardEnums: NestedScrollMode = NestedScrollMode.SELF_FIRST
  @State userAgentPC: string = "";

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Button("NestedScrollOptionsScrollBackwardHorizontal click")
        .key('NestedScrollOptionsScrollBackwardHorizontalTestButton')
        .onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testNestedScrollOptionsScrollBackwardHorizontal003": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(40, 0)
                setTimeout(() => {
                  Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 9003)
                }, 2000)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })

      Scroll(this.scroller) {
        Row() {
          Column().width('20%').height('100%').backgroundColor(Color.Green)
            Web({ src: $rawfile('nestedScrollTwo.html'), controller: this.controller })
              .nestedScroll({
                scrollForward: this.scrollForwardEnums,
                scrollBackward: this.scrollBackwardEnums,
              } as NestedScrollOptions)
              .width('90%')
              .height('100%')
              .onScroll((event: OnScrollEvent) => {
                console.info("WebView onScroll x = " + event.xOffset)
                console.info("WebView onScroll y = " + event.yOffset)
                if ((event.xOffset != 0 || event.yOffset != 0) && this.selfScrollTime == 0) {
                  this.selfScrollTime = Utils.getSystemTime()
                }
              } as Callback<OnScrollEvent>)
          Column().width('20%').height('100%').backgroundColor(Color.Red)
        }
      }
      .onWillScroll((xOffset: Double, yOffset: Double) => {
        if ((xOffset != 0 || yOffset != 0) && this.parentScrollTime == 0) {
          this.parentScrollTime = Utils.getSystemTime()
        }
        return {xOffset, yOffset};
      })
      .scrollable(ScrollDirection.Horizontal)
      .width('100%')
      .height('100%')
    }
    .key('RowSize')
  }
}