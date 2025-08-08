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
        this.emitKey = eventData.data.ACTION;
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
          await Utils.sleep(2000)

          webview.WebDataBase.deleteHttpAuthCredentials();
          switch (this.emitKey) {
            case 'emitWebviewGetAndSetHttpAuthUsernamePassword': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  console.info('WebviewGetAndSetHttpAuthUsernamePassword failed');
                  Utils.emitEvent('fail', 25001);
                  break;
                }
                Utils.emitEvent('success', 25001);
              } catch (error) {
                Utils.emitEvent('fail', 25001);
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
                  Utils.emitEvent('fail', 25002);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'newPassword');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'newPassword')) {
                  console.info('WebviewUpdateHttpAuthPassword update failed');
                  Utils.emitEvent('fail', 25002);
                  break;
                }
                Utils.emitEvent('success', 25002);
              } catch (error) {
                Utils.emitEvent('fail', 25002);
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
                  Utils.emitEvent('fail', 25003);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'newUser', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'newUser' ||
                    this.usernamePassword[1] != 'password')) {
                  console.info('WebviewUpdateHttpAuthUsername update failed');
                  Utils.emitEvent('fail', 25003);
                  break;
                }
                Utils.emitEvent('success', 25003);
              } catch (error) {
                Utils.emitEvent('fail', 25003);
              }
              break;
            }
            case 'emitWebviewSetHttpAuthUsernameToNull': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 25004)
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, null, 'password');
                console.info('WebviewSetHttpAuthUsernameToNull failed');
                Utils.emitEvent('fail', 25004);
              } catch (error) {
                Utils.emitEvent('success', 25004);
              }
              break;
            }
            case 'emitWebviewSetHttpAuthPasswordToNull': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 25005);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', null);
                console.info('WebviewSetHttpAuthPasswordToNull failed');
                Utils.emitEvent('fail', 25005);
              } catch (error) {
                Utils.emitEvent('success', 25005);
              }
              break;
            }
            case 'emitWebviewSetHttpAuthUsernamePasswordToNull': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 25006);
                  break;
                }
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, null, null);
                console.info('WebviewSetHttpAuthUsernamePasswordToNull failed');
                Utils.emitEvent('fail', 25006);
              } catch (error) {
                Utils.emitEvent('success', 25006);
              }
              break;
            }
            case 'emitWebviewDeleteHttpAuthUsernamePassword': {
              try {
                webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, 'user', 'password');
                this.usernamePassword = webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
                if (this.usernamePassword == null || (this.usernamePassword[0] != 'user' ||
                    this.usernamePassword[1] != 'password')) {
                  Utils.emitEvent('fail', 25007);
                  break;
                }
                webview.WebDataBase.deleteHttpAuthCredentials();
                let ret = webview.WebDataBase.existHttpAuthCredentials();
                if (ret) {
                  console.info('WebviewDeleteHttpAuthUsernamePassword failed');
                  Utils.emitEvent('fail', 25007);
                  break;
                }
                Utils.emitEvent('success', 25007);
              } catch (error) {
                Utils.emitEvent('fail', 25007);
              }
              break;
            }
          }
        })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .databaseAccess(true)
    }
  }
}


