/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import Utils from '../../test/Util';
import { BusinessError } from '@kit.BasicServicesKit';
import events_emitter from '@ohos.events.emitter';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct testWebView_Geolocation {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  origin: string = 'file:///';
  @State str: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  build(){
    Column() {
      Button('getAccessibleGeolocation1')
        .key('getAccessibleGeolocation1')
        .onClick(async () => {
          console.info('key==>' + this.str);
          this.isReceive = -1;
          try {
            webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
              .then(result => {
                console.log('getAccessibleGeolocationPromise result: ' + result);
                Utils.emitEvent(result, 160270);
              }).catch((error: BusinessError) => {
              console.error(`getAccessibleGeolocationPromise error, ErrorCode: ${error.code}, Message: ${error.message}`);
              Utils.emitEvent(error.message, 160270);
            });
          } catch (error) {
            console.error(`ErrorCode: ${error.message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller,incognitoMode: true})


      Button('getAccessibleGeolocation2')
        .key('getAccessibleGeolocation2')
        .onClick(async () => {
          console.info('key==>' + this.str);
          this.isReceive = -1;
          try {
            webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
              .then(result => {
                console.log('getAccessibleGeolocationPromise result: ' + result);
                Utils.emitEvent(result, 160280);
              }).catch((error: BusinessError) => {
              console.error(`getAccessibleGeolocationPromise error, ErrorCode: ${error.code}, Message: ${error.message}`);
              Utils.emitEvent(error.message, 160280);
            });
          } catch (error) {
            console.error(`ErrorCode: ${error.message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller})


      Button('getStoredGeolocation1')
        .key('getStoredGeolocation1')
        .onClick(async () => {
          console.info('key==>' + this.str);
          this.isReceive = -1;
          webview.GeolocationPermissions.getStoredGeolocation()
            .then(origins => {
              let originsStr = origins.join();
              console.log('getStoredGeolocationPromise origins: ' + originsStr);
              if (originsStr === '') {
                console.log('No geolocation data available');
                Utils.emitEvent('No data', 160290);
              } else {
                Utils.emitEvent(originsStr, 160290);
              }
            })
            .catch((error:BusinessError) => {
              console.error(`getStoredGeolocationPromise error, ErrorCode: ${error.message}`);
              Utils.emitEvent('Error occurred', 160290);
            });
        })
      Web({ src: 'www.example.com', controller: this.controller,incognitoMode: true})

      Button('getStoredGeolocation2')
        .key('getStoredGeolocation2')
        .onClick(async () => {
          console.info('key==>' + this.str);
          this.isReceive = -1;
          webview.GeolocationPermissions.getStoredGeolocation()
            .then(origins => {
              let originsStr = origins.join();
              console.log('getStoredGeolocationPromise origins: ' + originsStr);
              if (originsStr === '') {
                console.log('No geolocation data available');
                Utils.emitEvent('No data', 160300);
              } else {
                Utils.emitEvent(originsStr, 160300);
              }
            })
            .catch((error:BusinessError) => {
              console.error(`getStoredGeolocationPromise error, ErrorCode: ${error.message}`);
              Utils.emitEvent('Error occurred', 160300);
            });
        })
      Web({ src: 'www.example.com', controller: this.controller})

    }
    .justifyContent(FlexAlign.Center)

  }
}