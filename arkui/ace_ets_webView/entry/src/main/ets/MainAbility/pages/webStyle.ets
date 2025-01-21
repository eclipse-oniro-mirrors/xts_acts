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
        Web({ src:  $rawfile('index.html'), controller:null })
          .width('30%')
          .height('100%')
          .fileAccess(this.fileAccess)
          .key("webViewWidthPer")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width(100)
          .height('100%')
          .fileAccess(this.fileAccess)
          .key("webViewWidthPx")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('20%')
          .height('80%')
          .fileAccess(this.fileAccess)
          .key("webViewHeightPer")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width("20%")
          .height(50)
          .fileAccess(this.fileAccess)
          .key("webViewHeightPx")
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
      .height("30%")

      Divider().height("5%")

      Row(){
        Web({ src:  $rawfile('index.html'), controller:null })
          .width('20%')
          .height('100%')
          .padding(10)
          .fileAccess(this.fileAccess)
          .key("webViewPaddingAll")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('20%')
          .height('100%')
          .padding({left:10,right:5,top:5,bottom:5})
          .fileAccess(this.fileAccess)
          .key("webViewPadding")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('20%')
          .height('100%')
          .margin(10)
          .fileAccess(this.fileAccess)
          .key("webViewMarginAll")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('20%')
          .height('100%')
          .margin({left:10,right:5,top:5,bottom:5})
          .fileAccess(this.fileAccess)
          .key("webViewMargin")
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
      .height("30%")

      Divider().height("5%")

      Row(){
        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .border({width:2,color:0x317AF7,radius:5,style:BorderStyle.Dashed})
          .fileAccess(this.fileAccess)
          .key("webViewBorderAll")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .borderWidth(3)
          .fileAccess(this.fileAccess)
          .key("webViewBorderWidth")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .borderColor(0x317AF7)
          .fileAccess(this.fileAccess)
          .key("webViewBorderColor")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .borderRadius(6)
          .fileAccess(this.fileAccess)
          .key("webViewBorderRadius")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .borderStyle(BorderStyle.Dashed)
          .fileAccess(this.fileAccess)
          .key("webViewBorderStyleDashed")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .borderStyle(BorderStyle.Solid)
          .fileAccess(this.fileAccess)
          .key("webViewBorderStyleSolid")
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

        Web({ src:  $rawfile('index.html'), controller:null })
          .width('14%')
          .height('100%')
          .borderStyle(BorderStyle.Dotted)
          .fileAccess(this.fileAccess)
          .key("webViewBorderStyleDotted")
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
      .height("30%")

    }.width('100%')
    .height('100%').backgroundColor("#ff0000")
  }
}