/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State download: webview.WebDownloadItem = new webview.WebDownloadItem();
  failedData: Uint8Array = new Uint8Array();
  @State str: string = '';
  @State src: string | Resource = 'www.example.com';
  @State num: number = 0

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  public valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build(){
    Column() {

      Button('配置下载回调信息')
        .key('config')
        .onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_ACE_WEB_cancel_0100':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0200':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0300':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0400':
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/stora' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0200':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0300':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0400':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0500':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0600':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0100':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0200':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0300':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0400':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0500':
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/storage/el2he/web/' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1000':
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
                  Utils.emitEvent(webDownloadItem.getLastErrorCode(), 465)
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1001':
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
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
                Utils.emitEvent(true, 466)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1002':
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                  if (webDownloadItem.getPercentComplete() == 100) {
                    Utils.emitEvent(100, 467)
                  }
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
                Utils.emitEvent(true, 466)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1003':
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                  if (webDownloadItem.getPercentComplete() >= 2) {
                    this.num = 2
                  }
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1000':
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                  if (webDownloadItem.getPercentComplete() >= 2) {
                    this.num = 2
                  }
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1002':
              try {
                this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('will start a download.');
                  webDownloadItem.start('/data/storage/el2/base/cache/web/' + webDownloadItem.getSuggestedFileName());
                  this.download = webDownloadItem
                })
                this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download update percent complete: ' + webDownloadItem.getPercentComplete());
                  if (webDownloadItem.getPercentComplete() >= 2) {
                    this.num = 2
                  }
                })
                this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download failed guid: ' + webDownloadItem.getGuid());
                  console.log('download error code: ' + webDownloadItem.getLastErrorCode());
                  this.failedData = webDownloadItem.serialize();
                })
                this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
                  console.log('download finish guid: ' + webDownloadItem.getGuid());
                })
                this.controller.setDownloadDelegate(this.delegate);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Button('开始下载')
        .key('start')
        .onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_ACE_WEB_cancel_0100':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0300':
              try {
                this.controller.startDownload('https:' +
                  '//www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0400':
              try {
                this.controller.startDownload('https:' +
                  '//www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0200':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0300':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0400':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0500':
              try {
                this.controller.startDownload('https:' +
                  '//www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0600':
              try {
                this.controller.startDownload('https:' +
                  '//shows.youtube.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0200':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0300':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0400':
              try {
                this.controller.startDownload('https:' +
                  '//www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0500':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1000':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.c.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1001':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1002':
              try {
                this.controller.startDownload('https:' +
                  '//www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1003':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1002':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1000':
              try {
                this.controller.startDownload('https:' +
                  '//dldir1.qq.com/qqfile/qq/QQNT/Windows/QQ_9.9.15_240902_x64_01.exe');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Button('暂停下载')
        .key('pause11')
        .onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_ACE_WEB_cancel_0100':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0100':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 454)
              }
              break;
            case 'SUB_ACE_WEB_pause_0200':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 455)
              }
              break;
            case 'SUB_ACE_WEB_pause_0300':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 456)
              }
              break;
            case 'SUB_ACE_WEB_pause_0400':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 456)
              }
              break;
            case 'SUB_ACE_WEB_pause_0500':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 458)
              }
              break;
            case 'SUB_ACE_WEB_pause_0600':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 459)
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1000':
              try {
                this.download.pause();
                console.log('暂停下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Button('取消下载')
        .key('cancel11')
        .onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_ACE_WEB_cancel_0100':
              try {
                this.download.cancel();
                console.log('取消下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0200':
              try {
                this.download.cancel();
                console.log('取消下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0300':
              try {
                this.download.cancel();
                console.log('取消下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0400':
              try {
                this.download.cancel();
                console.log('取消下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0300':
              try {
                this.download.cancel();
                console.log('取消下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0300':
              try {
                this.download.cancel();
                console.log('取消下载')
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Button('恢复下载')
        .key('resume11')
        .onClick((event: ClickEvent) => {
          switch (this.str) {
            case 'SUB_ACE_WEB_pause_0400':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_resume_0100':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 460)
              }
              break;
            case 'SUB_ACE_WEB_resume_0200':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 461)
              }
              break;
            case 'SUB_ACE_WEB_resume_0300':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 462)
              }
              break;
            case 'SUB_ACE_WEB_resume_0400':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 463)
              }
              break;
            case 'SUB_ACE_WEB_resume_0500':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 464)
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1003':
              try {
                this.download.resume();
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code + error.message, 464)
              }
              break;

          }
        })

      Button('查看下载状态')
        .key('state11')
        .onClick(() => {
          switch (this.str) {
            case 'SUB_ACE_WEB_cancel_0100':
              try {
                console.log('查看下载状态0100')
                let status = this.download.getState();
                if (JSON.stringify(status) == '4') {
                  Utils.emitEvent(JSON.stringify(status), 450)
                  this.download.cancel()
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0200':
              try {
                console.log('查看下载状态0200')
                let status = this.download.getState();
                Utils.emitEvent(JSON.stringify(status), 451)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0300':
              try {
                console.log('查看下载状态0300')
                let status = this.download.getState();
                Utils.emitEvent(JSON.stringify(status), 452)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_cancel_0400':
              try {
                let status = this.download.getState();
                Utils.emitEvent(JSON.stringify(status), 453)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_pause_0400':
              try {
                let status = this.download.getState();
                Utils.emitEvent(JSON.stringify(status), 457)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_onDownloadUpdated_1003':
              try {
                let status = this.download.getState();
                Utils.emitEvent(this.num, 468)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1000':
              try {
                let status = this.download.getState();
                Utils.emitEvent(JSON.stringify(status), 469)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            case 'SUB_ACE_WEB_onDownloadFinish_1002':
              try {
                let status = this.download.getState();
                Utils.emitEvent(JSON.stringify(status), 470)
                this.download.cancel()
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Button('setConnectionTimeout')
        .id('setConnectionTimeout')
        .onClick(() => {
          switch (this.str) {
            case 'SUB_ACE_WEB_pause_0600':
              try {
                webview.WebviewController.setConnectionTimeout(5);
                console.log('setConnectionTimeout: 5s');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
          }
        })

      Web({ src: this.src, controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
    }
  }
}