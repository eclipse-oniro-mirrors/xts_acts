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
import { URL } from '../../test/Config';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  time: number = 0;
  counters: number = 0;

  onPageHide(): void {
    this.counters = 0;
  }

  onPageShow(): void {
    this.counters = 0;
  }

  build(){
    Column() {
      Button('runJavaScript')
        .onClick(() => {
          this.controller.loadUrl('resource://rawfile/navigationStart.html')
        })
        .key('001')

      Web({ src: URL, controller: this.controller })
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log('onFirstContentfulPaint:' + '[navigationStartTick]:' +
            event.navigationStartTick + ', [firstContentfulPaintMs]:' +
            event.firstContentfulPaintMs);
            this.time = event.navigationStartTick
          }
        })
        .onPageEnd(() => {
          if (this.counters == 0) {
            this.counters = 1
            return
          }
          console.info(`runJavaScript onPageEnd`);
          try {
            this.controller.runJavaScript(
              'test()',
              (error, result) => {
                if (error) {
                  console.error(`runJavaScript ErrorCode1: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                console.info(`runJavaScript1 SUCCESS, ${Number(result).valueOf().toString().substring(0, 8)}`,
                  this.time.toString().substring(0, 8));

                if (Number(result).valueOf().toString().substring(0, 8)) {
                  console.info(`runJavaScript onPageEnd result`);
                  LocalContext.context.eventHub.emit('navigationStartTick')
                }
              });
            console.log('runJavaScript SUCCESS')
          } catch (error) {
            console.error(`runJavaScript ErrorCode2: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .onlineImageAccess(true)
    }
  }
}