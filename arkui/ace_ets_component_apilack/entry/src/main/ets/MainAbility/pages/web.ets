// @ts-nocheck
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

import Log from '../common/Log.ets';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebComponent {
  @State progress: number = 0;
  @State hideProgress: boolean = true;
  fileAccess: boolean = true;
  // 定义Web组件的控制器controller
  controller: WebController = new WebController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  webResourceResponse: WebResourceResponse = new WebResourceResponse();
  build() {
    Column() {
      Text('Hello world!')
        .fontSize(20)
      Progress({value: this.progress, total: 100})
        .color('#0000ff')
        .visibility(this.hideProgress ? Visibility.None : Visibility.Visible)
      // 初始化Web组件，并绑定controller
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .key("getTitleText")
        .fileAccess(this.fileAccess)
        .javaScriptAccess(true)
        .height(500)
        .padding(20)
        .blur(2)
        .userAgent("Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36")
       // .fileFromUrlAccess(true)
        .initialScale(2)
        .onPrompt((event) => {
          console.info('onPrompt url: ', event.url);
          console.info('onPrompt message: ', event.message);
          console.info('onPrompt result: ', event.result);
          console.info('onPrompt handlePromptConfirm: ', event.result.handlePromptConfirm("confirm"));
          return true;
        })
        .onShowFileSelector((event) => {
          console.info('onShowFileSelector getAcceptType: ', event.fileSelector.getAcceptType());
          console.info('onShowFileSelector getTitle: ', event.fileSelector.getTitle());
          console.info('onShowFileSelector getMode: ', event.fileSelector.getMode());
          console.info('onShowFileSelector isCapture: ', event.fileSelector.isCapture());
          event.result.handleFileList(["D:\DevEcoStudioProjects","D:\DevEcoStudioProjects"])
          return true;
        })
        .onRenderExited((event) => {
          console.info('onRenderExited getAcceptType: ', event.renderExitReason);
        })
        .onProgressChange(e => {
          this.progress = e.newProgress;
          if (this.progress === 100) {
            this.hideProgress = true;
          } else {
            this.hideProgress = false;
          }
        })
        .onResourceLoad((event) => {
          console.info('onResourceLoad url: ', event.url);
          return true;
        })
        .onPageEnd(e => {
          // test()在index.html中定义
          this.controller.runJavaScript({ script: 'test()' });
          console.info('url: ', e.url);
        })
        .onHttpAuthRequest((event) => {
          console.info('onHttpAuthRequest host: ', event.host);
          console.info('onHttpAuthRequest realm: ', event.realm);
          console.info('onHttpAuthRequest isHttpAuthInfoSaved: ', event.handler.isHttpAuthInfoSaved());
          let result = event.handler;
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
//        .onContextMenuShow((event) => {
//          console.info("x coord = " + event.param.x());
//          console.info("y coord = " + event.param.y());
//          console.info("link url = " + event.param.getLinkUrl());
//          console.info("unfilterendLinkUrl = " + event.param.getUnfilteredLinkUrl());
//          console.info("sourceUrl = " + event.param.getSourceUrl());
//          console.info("existsImageContents = " + event.param.existsImageContents());
//          console.info("closeContextMenu = " + event.result.closeContextMenu());
//          console.info("copyImage = " + event.result.copyImage());
//        })
//        .onPermissionRequest((event) => {
//          AlertDialog.show({
//            title: 'title',
//            message: 'text',
//            confirm: {
//              value: 'onConfirm',
//              action: () => {
//                event.request.grant(event.request.getAccessibleResource());
//                console.info('onPermissionRequest getAccessibleResource: ', event.request.getAccessibleResource());
//                console.info('onPermissionRequest getOrigin: ', event.request.getOrigin());
//              }
//            },
//            cancel: () => {
//              event.request.deny();
//            }
//          })
//        })
      .onScaleChange((event) => {
        console.info('onScaleChange oldScale: ', event.oldScale);
        console.info('onScaleChange newScale: ', event.newScale);
      })
        .onHttpErrorReceive((event) => {
          try {
            console.log('url:' + event.request.getRequestUrl());
            console.log('isMainFrame:' + event.request.isMainFrame());
            console.log('isRedirect:' + event.request.isRedirect());
            console.log('isRequestGesture:' + event.request.isRequestGesture());
            console.log('getResponseData:' + event.response.getResponseData());
            console.log('getResponseEncoding:' + event.response.getResponseEncoding());
            console.log('getResponseMimeType:' + event.response.getResponseMimeType());
            console.log('getResponseCode:' + event.response.getResponseCode());
            console.log('getReasonMessage:' + event.response.getReasonMessage());
            console.log('setResponseData:' + event.response.setResponseData("ResponseData"));
            console.log('setReasonMessage:' + event.response.setReasonMessage("success"));
            console.log('setResponseCode:' + event.response.setResponseCode(200));
            console.log('setResponseEncoding:' + event.response.setResponseEncoding("UTF-8"));
            console.log('setResponseMimeType:' + event.response.setResponseMimeType("application/json"));
            console.log('setResponseHeader:' + event.response.setResponseHeader([]));
            console.log('web getExtra:' + this.controllerTwo.getHitTestValue().getExtra());
            console.log('web getType:' + this.controllerTwo.getHitTestValue().getType());
            console.log('web getCookieManager:' + this.controller.getCookieManager());
            console.log('web getCookie:' + this.controller.getCookieManager().getCookie("www.baidu.com"));
            console.log('web existCookie:' + this.controller.getCookieManager().existCookie());
            console.log('web deleteEntireCookie:' + this.controller.getCookieManager().deleteEntireCookie());
            console.log('web deleteExpiredCookie:' + this.controller.getCookieManager().deleteExpiredCookie());
            console.log('web deleteSessionCookie:' + this.controller.getCookieManager().deleteSessionCookie());
            console.log('web isCookieAllowed:' + this.controller.getCookieManager().isCookieAllowed());
            console.log('web isFileURICookieAllowed:' + this.controller.getCookieManager().isFileURICookieAllowed());
            console.log('web isThirdPartyCookieAllowed:' + this.controller.getCookieManager()
              .isThirdPartyCookieAllowed());
            console.log('web putAcceptCookieEnabled:' + this.controller.getCookieManager()
              .putAcceptCookieEnabled(true));
            console.log('web putAcceptFileURICookieEnabled:' + this.controller.getCookieManager()
              .putAcceptFileURICookieEnabled(true));
            console.log('web putAcceptThirdPartyCookieEnabled:' + this.controller.getCookieManager()
              .putAcceptThirdPartyCookieEnabled(true));
            console.log('web saveCookieSync:' + this.controller.getCookieManager().saveCookieSync());
            console.log('web zoomIn:' + this.controllerTwo.zoomIn());
            console.log('web zoomOut:' + this.controllerTwo.zoomOut());
            console.log('web zoom:' + this.controller.zoom(2));
            console.log('web getWebId:' + this.controllerTwo.getWebId());
            console.log('web getDefaultUserAgent:' + this.controller.getDefaultUserAgent());
            console.log('web getTitle:' + this.controller.getTitle());
            console.log('web getPageHeight:' + this.controller.getPageHeight());
            console.log('web backOrForward:' + this.controller.backOrForward(2));
          } catch (error) {
            console.info('the error is ' + JSON.stringify(error));
          }


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
      Text('End')
        .fontSize(20)
    }
  }
}