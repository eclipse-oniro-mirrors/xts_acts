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
import Utils from '../../test/Utils';
import { BusinessError } from '@kit.BasicServicesKit';
import { WebNetErrorList } from '@ohos.web.netErrorList';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State uri1: string = 'https:'
  @State uri2: string = '//www.zubo662.com:30473'
  @State uri: string = this.uri1 + this.uri2

  build(){
    Column() {
      Button('enableSafeBrowsing')
        .key('enableSafeBrowsing')
        .onClick(() => {
           try {
             this.controller.enableSafeBrowsing(true);
             console.log('enableSafeBrowsing: true');
             let result = this.controller.isSafeBrowsingEnabled();
             console.log('result: ' + result);
             if(result){
              Utils.emitEvent('policy=0', 5009);
             } else {
                 Utils.emitEvent(false, 5009);
             }

           } catch (error) {
             console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent('', 5009);
           }
        })
      Web({ src: this.uri, controller: this.controller });
    }
  }
}