import { hilog } from '@kit.PerformanceAnalysisKit';
import web_webview from '@ohos.web.webview'
import testNapi from 'libentry.so';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isRegister:number = -1;
  webTag: string = 'ArkWeb1';
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);
  aboutToAppear() {
    this.isRegister= testNapi.nativeWebInit(this.webTag);
    console.info("aboutToAppear" + this.isRegister)
  }
  build() {
    Column() {

      Row() {
        Web({ src: "https://www.baidu.com", controller: this.controller })
          .javaScriptAccess(true)
          .fileAccess(true)
          .borderRadius(10)
      }.height('80%')
    }
  }
}
