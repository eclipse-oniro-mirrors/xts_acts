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

import {
  Entry, Component,
  Column, ColumnOptions, Row, RowOptions, Color,
  Text, Button, FontWeight, ClickEvent, Margin,
  OnErrorReceiveEvent, OnHttpErrorReceiveEvent, OnPageBeginEvent, OnPageEndEvent,
  // AtomicServiceWeb, AtomicServiceWebController,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct WebComponent {
  // @State controller: AtomicServiceWebController = new AtomicServiceWebController();

  build() {
    Column() {
      // AtomicServiceWeb({
      //   src: $rawfile('index.html'),
      //   controller: this.controller,
      //   // 网页加载遇到错误时触发该回调
      //   onErrorReceive: (event: OnErrorReceiveEvent) => {
      //     console.log(`AtomicServiceWebLog onErrorReceive event=${JSON.stringify({
      //       requestUrl: event.request?.getRequestUrl(),
      //       requestMethod: event.request?.getRequestMethod(),
      //       errorCode: event.error?.getErrorCode(),
      //       errorInfo: event.error?.getErrorInfo()
      //     })}`);
      //   },
      //   // 网页加载遇到HTTP资源加载错误时触发该回调
      //   onHttpErrorReceive: (event: OnHttpErrorReceiveEvent) => {
      //     console.log(`AtomicServiceWebLog onHttpErrorReceive event=${JSON.stringify({
      //       requestUrl: event.request?.getRequestUrl(),
      //       requestMethod: event.request?.getRequestMethod(),
      //       responseCode: event.response?.getResponseCode(),
      //       responseData: event.response?.getResponseData(),
      //     })}`);
      //   },
      //   // 页面开始加载，触发该回调
      //   onPageBegin: (event: OnPageBeginEvent) => {
      //     console.log(`AtomicServiceWebLog onPageBegin event=${JSON.stringify({
      //       url: event.url
      //     })}`);
      //   },
      //   // 页面加载完成，触发该回调
      //   onPageEnd: (event: OnPageEndEvent) => {
      //     console.log(`AtomicServiceWebLog onPageEnd event=${JSON.stringify({
      //       url: event.url
      //     })}`);
      //   }
      // })
    }
  }
}