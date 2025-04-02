/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct WebEditText {
  controller: WebController = new WebController();
  webResourceResponse: WebResourceResponse = new WebResourceResponse();

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear WebEditText start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear WebEditText end`);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Web({ src: 'www.baidu.com', controller: this.controller })
        .javaScriptAccess(true)
        .height(500)
        .padding(20)
        .blur(2)// .fileFromUrlAccess(true)
        .initialScale(2)
        .onRenderExited((event) => {
          console.info('onRenderExited getAcceptType: ', event.renderExitReason);
        })
        .onShowFileSelector((event) => {
          console.info('onShowFileSelector getAcceptType: ', event.fileSelector.getAcceptType());
          console.info('onShowFileSelector getTitle: ', event.fileSelector.getTitle());
          console.info('onShowFileSelector getMode: ', event.fileSelector.getMode());
          console.info('onShowFileSelector isCapture: ', event.fileSelector.isCapture());
          event.result.handleFileList(["D:\DevEcoStudioProjects", "D:\DevEcoStudioProjects"])
          return true;
        })
        .onInterceptRequest((event) => {
          console.info('onInterceptRequest getRequestUrl: ', event.request.getRequestUrl());
          console.info('onInterceptRequest isMainFrame: ', event.request.isMainFrame());
          console.info('onInterceptRequest isRedirect: ', event.request.isRedirect());
          console.info('onInterceptRequest isRequestGesture: ', event.request.isRequestGesture());
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          return this.webResourceResponse;
        })
        .onPermissionRequest((event) => {
          AlertDialog.show({
            title: 'title',
            message: 'text',
            confirm: {
              value: 'onConfirm',
              action: () => {
                event.request.grant(event.request.getAccessibleResource());
              }
            },
            cancel: () => {
              event.request.deny();
            }
          })
        })
        .onHttpErrorReceive((event) => {
          console.log('setResponseHeader:' + event.response.setResponseHeader([]));
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          let resph = event.response.getResponseHeader();
          console.log('The response header result size is ' + resph.length);
          for (let i of resph) {
            console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
        })
    }
    .width("100%")
    .height("100%")
  }
}

