// xxx.ets
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  condition: string[] = ['WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET','WebBypassVsyncCondition.NONE'];
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Button("web click").key('BypassVsyncConditionButton').onClick(async () => {
        console.info("key==>" + this.str)
        await waitForExist(()=>this.isReceive, this.str, 0);
        switch (this.str) {
          case "emitBypassVsyncCondition01": {
            await Utils.sleep(2000)
            Utils.emitEvent(this.condition[0], 20250729)
            break;
          }
          case "emitBypassVsyncCondition02": {
            await Utils.sleep(2000)
            Utils.emitEvent(this.condition[1], 20250730)
            break;
          }
        }
      })

      Web({ src: 'www.example.com', controller: this.controller })
        .bypassVsyncCondition(WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET)
    }
  }
}