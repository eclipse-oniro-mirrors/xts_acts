import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 182201;
let driver: Driver = Driver.create();

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webgetPageOffsetButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitgetPageOffset001": {
              try {
                this.controller.scrollTo(0, 150);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                Utils.emitEvent(this.controller.getPageOffset().y, 182210)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitgetPageOffset002": {
              try {
                this.controller.scrollTo(50, 0);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                Utils.emitEvent(this.controller.getPageOffset().x, 182220)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitgetPageOffset003": {
              try {
                this.controller.scrollBy(0, 200);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                Utils.emitEvent(this.controller.getPageOffset().y, 182230)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onScroll((event) => {
          console.log("getPageOffset x:" + this.controller.getPageOffset().x + ",y:" +
          this.controller.getPageOffset().y);

        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}