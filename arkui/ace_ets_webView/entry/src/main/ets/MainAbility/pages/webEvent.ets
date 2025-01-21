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
        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnAlert")
          .onAlert((event?: {
            url: string,
            message: string,
            result: JsResult
          }) => {
            console.log("onAlert: url -- " + event.url)
            console.log("onAlert: message -- " + event.message)
            event.result.handleCancel(()=>{
              console.log("onAlert: handleCancel -- ")
            })
            event.result.handleConfirm()(()=>{
              console.log("onAlert: handleConfirm -- ")
            })
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnBeforeUnload")
          .onBeforeUnload((event?: {
            url: string,
            message: string,
            result: JsResult
          }) => {
            console.log("onBeforeUnload: url -- " + event.url)
            console.log("onBeforeUnload: message -- " + event.message)
            event.result.handleCancel(()=>{
              console.log("onBeforeUnload: handleCancel -- ")
            })
            event.result.handleConfirm()(()=>{
              console.log("onBeforeUnload: handleConfirm -- ")
            })
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnConfirm")
          .onConfirm((event?: {
            url: string,
            message: string,
            result: JsResult
          }) => {
            console.log("onConfirm: url -- " + event.url)
            console.log("onConfirm: message -- " + event.message)
            event.result.handleCancel(()=>{
              console.log("onConfirm: handleCancel -- ")
            })
            event.result.handleConfirm()(()=>{
              console.log("onConfirm: handleConfirm -- ")
            })
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnConfirm")
          .onConsole((event?: {
            message: ConsoleMessage
          }) => {
            console.log("onConsole: getLineNumber -- " + event.message.getLineNumber())
            console.log("onConsole: getSourceId -- " + event.message.getSourceId())
            console.log("onConsole: getMessageLevel -- " + event.message.getMessageLevel())
            console.log("onConsole: getMessage -- " + event.message.getMessage())
          })
      }
      .width("100%")
      .height("20%")

      Divider().height("5%")

      Row(){
        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnDownloadStart")
          .onDownloadStart((event?: {
            url:string,
            userAgent:string,
            contentDisposition:string,
            mimetype: string,
            contentLength: number
          }) => {
            console.log("onDownloadStart: url -- " + event.url)
            console.log("onDownloadStart: userAgent -- " + event.userAgent)
            console.log("onDownloadStart: contentDisposition -- " + event.contentDisposition)
            console.log("onDownloadStart: mimetype -- " + event.mimetype)
            console.log("onDownloadStart: contentLength -- " + event.contentLength)
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnErrorReceive")
          .onErrorReceive((event?: {
            request: WebResourceRequest,
            error: WebResourceError
          }) => {
            console.log("onErrorReceive: errCode -- " + event.error.getErrorCode() +";errInfo -- " + event.error.getErrorInfo())
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnHttpErrorReceive")
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

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnPageBegin")
          .onPageBegin((event?: {
            url: string
          }) => {
            console.log("onPageBegin: url -- " + event.url)
          })
      }
      .width("100%")
      .height("20%")

      Divider().height("5%")

      Row(){
        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnPageEnd")
          .onPageEnd((event?: {
            url: string
          }) => {
            console.log("onPageEnd: url -- " + event.url)
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .key("webViewOnProgressChange")
          .onProgressChange((event?: {
            newProgress: number
          }) => {
            console.log("onProgressChange: newProgress -- " + event.newProgress)
          })

        Divider().width("3%")

        Web({ src:'www.baidu.com', controller:null })
          .width('20%')
          .height('100%')
          .zoomAccess(true)
          .key("webViewOnTitleReceive")
          .onTitleReceive((event?: {
            title: string
          }) => {
            console.log("onTitleReceive: title -- " + event.title)
          })
      }
      .width("100%")
      .height("20%")

    }.width('100%')
    .height('100%').backgroundColor("#ff0000")
  }
}