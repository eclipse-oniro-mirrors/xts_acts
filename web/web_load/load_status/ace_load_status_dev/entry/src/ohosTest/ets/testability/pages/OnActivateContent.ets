// xxx.ets
import { webview } from '@kit.ArkWeb';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@kit.BasicServicesKit';

// 在同一page页有两个Web组件。在WebComponent新开窗口时，会跳转到NewWebViewComp。
@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController;
  webviewController1: webview.WebviewController = new webview.WebviewController();



  build() {
    Column() {
      Web({ src: "https://www.zhihu.com/", controller: this.webviewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(false)
        .onWindowExit(() => {
          console.info("NewWebViewComp onWindowExit");
          if (this.controller) {
            this.controller.close();
          }
        })
        .onActivateContent(()=>{
          Utils.emitEvent(true, 141310);
          // 执行切换标签
          console.log("NEU-onActivateContent");
        })
    }
  }
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  dialogController: CustomDialogController | null = null;
  // 使用 @State 记录偏移量
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State isReceive: number = -1;
  @State str:string = 'emitOnActivateContent'
  @State isEnd: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141301,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.once(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  onPageHide(){
    events_emitter.off(141300)
  }



  build() {
    Column() {
      Row() {
        Button('web click').key('onActivateContentButton').onClick(async () => {
          console.info('key==>' + this.str);
          await waitForExist(()=>this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitOnActivateContent': {
              let driver = Driver.create();
              await waitForExist(()=>this.isEnd, this.str, true);
              Utils.findAndClickComponent('第一次调用',driver)
              break;
            }

          }
        })
      }

      Web({ src: $rawfile("name12.html"), controller: this.controller })
        .javaScriptAccess(true)
        .allowWindowOpenMethod(true)
        // 需要使能multiWindowAccess
        .multiWindowAccess(true)
        .onPageEnd(()=>{
          this.isEnd = true;
        })
        .onWindowNew((event) => {
          console.log("NEU-onWindowNew");
          if (this.dialogController) {
            this.dialogController.close();
          }
          this.offsetX += 25;
          this.offsetY += 25;

          let popController: webview.WebviewController = new webview.WebviewController();
          this.dialogController = new CustomDialogController({
            width: 80,
            height: 80,
            builder: NewWebViewComp({ webviewController1: popController }),
            isModal:false,
            offset: { dx: this.offsetX, dy: this.offsetY }
          })

          this.dialogController.open();
          // 将新窗口对应WebviewController返回给Web内核。
          // 若不调用event.handler.setWebController接口，会造成render进程阻塞。
          // 如果没有创建新窗口，调用event.handler.setWebController接口时设置成null，通知Web没有创建新窗口。
          event.handler.setWebController(popController);
          // event.handler.setWebController(null);
        })

        .width("100%")
        .height("50%")

    }
  }
}
