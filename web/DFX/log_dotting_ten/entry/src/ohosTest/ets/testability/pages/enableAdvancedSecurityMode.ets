/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';

@Entry
@Component
struct EnableAdvancedSecurityMode {
  @State emitKey: string = '';
  @State isReceive: number = -1;
  controller: webview.WebviewController = new webview.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('EnableAdvancedSecurityMode valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Web({ src: 'about:blank', controller: this.controller })
        .width('100%')
        .height('50%')
      Button('enableAdvancedSecurityMode')
        .key('EnableAdvancedSecurityModeButton')
        .onClick(async () => {
          await Utils.waitForExist(() => this.isReceive, 'EnableAdvancedSecurityModeIsReceive', 1, 1000);
          console.info("key==>" + this.emitKey);
          this.isReceive = -1;
          switch (this.emitKey) {
            case 'emitEnableAdvancedSecurityMode001': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: true
                });
                Utils.emitEvent(true, 210001);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode001 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210001);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode002': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: false
                });
                Utils.emitEvent(true, 210002);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode002 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210002);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode003': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableWebAssembly: true
                });
                Utils.emitEvent(true, 210003);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode003 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210003);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode004': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableWebAssembly: false
                });
                Utils.emitEvent(true, 210004);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode004 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210004);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode005': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableWebGL: true
                });
                Utils.emitEvent(true, 210005);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode005 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210005);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode006': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableWebGL: false
                });
                Utils.emitEvent(true, 210006);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode006 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210006);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode007': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disablePDFViewer: true
                });
                Utils.emitEvent(true, 210007);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode007 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210007);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode008': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disablePDFViewer: false
                });
                Utils.emitEvent(true, 210008);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode008 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210008);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode009': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableMathML: true
                });
                Utils.emitEvent(true, 210009);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode009 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210009);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode010': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableMathML: false
                });
                Utils.emitEvent(true, 210010);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode010 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210010);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode011': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableServiceWorker: true
                });
                Utils.emitEvent(true, 210011);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode011 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210011);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode012': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableServiceWorker: false
                });
                Utils.emitEvent(true, 210012);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode012 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210012);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode013': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableNonProxyUDP: true
                });
                Utils.emitEvent(true, 210013);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode013 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210013);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode014': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableNonProxyUDP: false
                });
                Utils.emitEvent(true, 210014);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode014 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210014);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode015': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: true,
                  disableWebAssembly: true,
                  disableWebGL: true,
                  disablePDFViewer: true,
                  disableMathML: true,
                  disableServiceWorker: true,
                  disableNonProxyUDP: true
                });
                Utils.emitEvent(true, 210015);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode015 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210015);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode016': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: false,
                  disableWebAssembly: false,
                  disableWebGL: false,
                  disablePDFViewer: false,
                  disableMathML: false,
                  disableServiceWorker: false,
                  disableNonProxyUDP: false
                });
                Utils.emitEvent(true, 210016);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode016 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210016);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode017': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: true,
                  disableWebAssembly: true,
                  disableWebGL: true,
                  disablePDFViewer: false,
                  disableMathML: false,
                  disableServiceWorker: false,
                  disableNonProxyUDP: false
                });
                Utils.emitEvent(true, 210017);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode017 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210017);
              }
              break;
            }
            case 'emitEnableAdvancedSecurityMode018': {
              try {
                webview.WebviewController.enableAdvancedSecurityMode({
                  disableJITCompilation: false,
                  disableWebAssembly: false,
                  disableWebGL: false,
                  disablePDFViewer: true,
                  disableMathML: true,
                  disableServiceWorker: true,
                  disableNonProxyUDP: true
                });
                Utils.emitEvent(true, 210018);
              } catch (error) {
                console.error('emitEnableAdvancedSecurityMode018 error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 210018);
              }
              break;
            }
            default:
              break;
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
