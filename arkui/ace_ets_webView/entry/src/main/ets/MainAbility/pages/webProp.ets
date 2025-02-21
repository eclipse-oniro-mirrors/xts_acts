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

@Entry
@Component
struct Index {
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;

  build() {
    Column() {
      Row(){
        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .domStorageAccess(true)
          .key("webViewDomStorageAccessTrue")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .domStorageAccess(false)
          .key("webViewDomStorageAccessFalse")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .fileAccess(true)
          .key("webViewFileAccessTrue")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .fileAccess(false)
          .key("webViewFileAccessFalse")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })
      }
      .width("100%")
      .height("20%")

      Divider().height("5%")

      Row(){
        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .imageAccess(true)
          .key("webViewImageAccessTrue")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .imageAccess(false)
          .key("webViewImageAccessFalse")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .javaScriptAccess(true)
          .key("webViewJavaScriptAccessTrue")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .javaScriptAccess(false)
          .key("webViewJavaScriptAccessFalse")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })
      }
      .width("100%")
      .height("20%")

      Divider().height("5%")

      Row(){
        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .onlineImageAccess(true)
          .key("webViewOnlineImageAccessTrue")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .onlineImageAccess(false)
          .key("webViewOnlineImageAccessFalse")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .zoomAccess(true)
          .key("webViewZoomAccessTrue")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .zoomAccess(false)
          .key("webViewZoomAccessFalse")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })
      }
      .width("100%")
      .height("20%")

      Divider().height("5%")

      Row(){
        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .mixedMode(MixedMode.None)
          .key("webViewMixedModeNone")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .mixedMode(MixedMode.All)
          .key("webViewMixedModeAll")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")

        Web({ src:$rawfile('test.html'), controller:null })
          .width('20%')
          .height('100%')
          .mixedMode(MixedMode.Compatible)
          .key("webViewMixedModeCompatible")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })
          .onHttpErrorReceive((event?: {
            request: WebResourceRequest,
            response: WebResourceResponse
          }) => {
            console.log("onHttpErrorReceive: message -- " + event.response.getReasonMessage()
            +";code -- " + event.response.getResponseCode()
            +";data -- " + event.response.getResponseData()
            +";enCoding -- " + event.response.getResponseEncoding()
            +";header -- " + JSON.stringify(event.response.getResponseHeader())
            +";mimeType -- " +event.response.getResponseMimeType())
          })

        Divider().width("3%")
      }
      .width("100%")
      .height("20%")

    }.width('100%')
    .height('100%').backgroundColor("#ff0000")
  }
}