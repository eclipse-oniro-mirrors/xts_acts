import webview from '@ohos.web.webview';
import { waitForExist} from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { Driver, MouseButton, UiWindow, ON, On  } from '@ohos.UiTest';

@Entry
@Component
struct Webdoubleinnernucleus {
  @State webviewcontroller: webview.WebviewController = new webview.WebviewController();
  controller: webview.WebviewController = new webview.WebviewController();
  @State result:number = 0;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 162000,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.emitKey = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebviewDoubleInnerNucleus').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          console.info('key==>' + this.emitKey);
          this.isReceive = -1;
          console.info("key==>" + this.emitKey)
          switch (this.emitKey) {
            // case "emitWebDoubleInnerNucleus001": {
            //     await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            //     Utils.emitEvent(webview.WebviewController.isActiveWebEngineEvergreen(),20250901)
            //     break;
            // }
            case "emitWebDoubleInnerNucleus001": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              Utils.emitEvent(webview.WebviewController.getActiveWebEngineVersion(),162010)
              break;
            }
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url：' + event.url);
          this.isPageEnd = 0;
          this.url = event.url;
        })

    }
  }
}