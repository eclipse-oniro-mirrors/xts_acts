import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State download: webview.WebDownloadItem = new webview.WebDownloadItem();
  failedData: Uint8Array = new Uint8Array();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130930,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(130930);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Button('web click')
        .key('startDownload')
        .onClick(async () => {
          console.info('key==>' + this.emitKey)
          await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          switch (this.emitKey) {
            case 'FILE_FAILED': {
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/123456' + webDownloadItem.getSuggestedFileName());
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  Utils.emitEvent(webDownloadItem.getLastErrorCode(), 130940);
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              try {
                console.log('开始下载')
                this.controller.startDownload('https:' +
                  '//www.baidu.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'startDownloadUrlFail': {
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  Utils.emitEvent(webDownloadItem.getLastErrorCode(), 130950);
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              try {
                console.log('开始下载')
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })

      Web({ src: 'www.example.com', controller: this.controller })
        .onErrorReceive((event) => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo());
            console.log('getErrorCode:' + event.error.getErrorCode());
          }
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}