/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct webviewGetAndSetHttpAuthUsernamePassword {
  controller: WebviewController = new webview.WebviewController();
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth : number = 300;
  @State nodeHeight : number = 150;
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  host: string = 'www.spincast.org';
  realm: string = 'protected example';
  usernamePassword: string[] = [];
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130000,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
      events_emitter.off(130000);
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

  build() {
    Column() {
      Row() {
        Button('web click').key('webviewGetAndSetHttpAuthUsernamePasswordButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          this.isShouldOverlay = true
          this.isCallback = false
          webview.WebDataBase.deleteHttpAuthCredentials();
          await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          switch (this.emitKey) {
            case 'emitWebviewGetAndSetHttpAuthUsernamePassword': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  console.info('WebviewGetAndSetHttpAuthUsernamePassword failed');
                  Utils.emitEvent('fail', 130010);
                  break;
                }
                Utils.emitEvent('success', 130010);
              } catch (error) {
                Utils.emitEvent('fail', 130010);
              }
              break;
            }
            case 'emitWebviewUpdateHttpAuthPassword': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  console.info('WebviewUpdateHttpAuthPassword failed');
                  Utils.emitEvent('fail', 130020);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'newPassword');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'newPassword')) {
                  console.info('WebviewUpdateHttpAuthPassword update failed');
                  Utils.emitEvent('fail', 130020);
                  break;
                }
                Utils.emitEvent('success', 130020);
              } catch (error) {
                Utils.emitEvent('fail', 130020);
              }
              break;
            }
            case 'emitWebviewUpdateHttpAuthUsername': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  console.info('WebviewUpdateHttpAuthUsername failed');
                  Utils.emitEvent('fail', 130030);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'newUser', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'newUser' ||
                    this.usernamePassword[1] != 'password')) {
                  console.info('WebviewUpdateHttpAuthUsername update failed');
                  Utils.emitEvent('fail', 130030);
                  break;
                }
                Utils.emitEvent('success', 130030);
              } catch (error) {
                Utils.emitEvent('fail', 130030);
              }
              break;
            }
            case 'emitWebviewSetHttpAuthUsernameToNull': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 130040)
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, null, 'password');
                console.info('WebviewSetHttpAuthUsernameToNull failed');
                Utils.emitEvent('fail', 130040);
              } catch (error) {
                Utils.emitEvent('success', 130040);
              }
              break;
            }
            case 'emitWebviewSetHttpAuthPasswordToNull': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 130050);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', null);
                console.info('WebviewSetHttpAuthPasswordToNull failed');
                Utils.emitEvent('fail', 130050);
              } catch (error) {
                Utils.emitEvent('success', 130050);
              }
              break;
            }
            case 'emitWebviewSetHttpAuthUsernamePasswordToNull': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 130060);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, null, null);
                console.info('WebviewSetHttpAuthUsernamePasswordToNull failed');
                Utils.emitEvent('fail', 130060);
              } catch (error) {
                Utils.emitEvent('success', 130060);
              }
              break;
            }
            case 'emitWebviewDeleteHttpAuthUsernamePassword': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 130070);
                  break;
                }
                webview.WebDataBase.deleteHttpAuthCredentials();
                let ret = webview.WebDataBase.existHttpAuthCredentials();
                if (ret) {
                  console.info('WebviewDeleteHttpAuthUsernamePassword failed');
                  Utils.emitEvent('fail', 130070);
                  break;
                }
                Utils.emitEvent('success', 130070);
              } catch (error) {
                Utils.emitEvent('fail', 130070);
              }
              break;
            }
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}