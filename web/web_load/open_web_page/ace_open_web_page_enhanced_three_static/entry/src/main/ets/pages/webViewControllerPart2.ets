import webView from '@ohos.web.webview'
import { Callback, RecordData } from '@ohos.base';
import { Entry, Column, Component, Button, ClickEvent, Row, OnOverScrollEvent} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import { Web } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test.ets';

@Entry
@Component
struct webViewControllerPart2 {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ' '

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column(undefined) {
      Row() {
        Button('WebViewControllerPart2 click').key('WebViewControllerPart2Button').onClick((e: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case 'testGetCustomUserAgent001': {
              try {
                  Utils.emitEvent(this.controller.getCustomUserAgent().indexOf('OpenHarmony') >= 0, 37018)
              } catch (error) {
                hilog.info(0X0000,'testTag',`Errorcode: `+error);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}
