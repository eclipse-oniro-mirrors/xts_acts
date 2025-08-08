import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';


@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
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
      Row() {
        Button("web click").key('webgetPageOffsetButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          switch (this.str) {
            case "emitgetPageOffset001": {
              try {
                this.controller.scrollTo(0, 150);
                await Utils.sleep(1000);
                Utils.emitEvent(this.controller.getPageOffset().y, 20250710)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitgetPageOffset002": {
              try {
                this.controller.scrollTo(50, 0);
                await Utils.sleep(1000);
                Utils.emitEvent(this.controller.getPageOffset().x, 20250711)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitgetPageOffset003": {
              try {
                this.controller.scrollBy(0, 200);
                await Utils.sleep(1000);
                Utils.emitEvent(this.controller.getPageOffset().y, 20250712)
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
    }
  }
}