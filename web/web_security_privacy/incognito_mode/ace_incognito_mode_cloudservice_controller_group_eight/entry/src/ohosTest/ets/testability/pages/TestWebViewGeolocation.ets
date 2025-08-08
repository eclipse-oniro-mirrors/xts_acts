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

@Entry
@Component
struct testWebView_Geolocation {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  origin: string = 'file:///';

  build(){
    Column() {
      Button('getAccessibleGeolocation1')
        .key('getAccessibleGeolocation1')
        .onClick(() => {
          try {
            webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
              .then(result => {
                console.log('getAccessibleGeolocationPromise result: ' + result);
                Utils.emitEvent(result, 5005);
              }).catch((error: BusinessError) => {
              console.error(`getAccessibleGeolocationPromise error, ErrorCode: ${error.code}, Message: ${error.message}`);
              Utils.emitEvent(error.message, 5005);
            });
          } catch (error) {
            console.error(`ErrorCode: ${error.message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller,incognitoMode: true});

      Button('getAccessibleGeolocation2')
        .key('getAccessibleGeolocation2')
        .onClick(() => {
          try {
            webview.GeolocationPermissions.getAccessibleGeolocation(this.origin)
              .then(result => {
                console.log('getAccessibleGeolocationPromise result: ' + result);
                Utils.emitEvent(result, 5006);
              }).catch((error: BusinessError) => {
              console.error(`getAccessibleGeolocationPromise error, ErrorCode: ${error.code}, Message: ${error.message}`);
              Utils.emitEvent(error.message, 5006);
            });
          } catch (error) {
            console.error(`ErrorCode: ${error.message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller});

      Button('getStoredGeolocation1')
        .key('getStoredGeolocation1')
        .onClick(() => {
          webview.GeolocationPermissions.getStoredGeolocation()
            .then(origins => {
              let originsStr = origins.join();
              console.log('getStoredGeolocationPromise origins: ' + originsStr);
              if (originsStr === '') {
                console.log('No geolocation data available');
                Utils.emitEvent('No data', 5007);
              } else {
                Utils.emitEvent(originsStr, 5007);
              }
            })
            .catch((error:BusinessError) => {
              console.error(`getStoredGeolocationPromise error, ErrorCode: ${error.message}`);
              Utils.emitEvent('Error occurred', 5007);
            });
        })
      Web({ src: 'www.example.com', controller: this.controller,incognitoMode: true});

      Button('getStoredGeolocation2')
        .key('getStoredGeolocation2')
        .onClick(() => {
          webview.GeolocationPermissions.getStoredGeolocation()
            .then(origins => {
              let originsStr = origins.join();
              console.log('getStoredGeolocationPromise origins: ' + originsStr);
              if (originsStr === '') {
                console.log('No geolocation data available');
                Utils.emitEvent('No data', 5008);
              } else {
                Utils.emitEvent(originsStr, 5008);
              }
            })
            .catch((error:BusinessError) => {
              console.error(`getStoredGeolocationPromise error, ErrorCode: ${error.message}`);
              Utils.emitEvent('Error occurred', 5008);
            });
        })
      Web({ src: 'www.example.com', controller: this.controller});
    }
    .justifyContent(FlexAlign.Center)
  }
}