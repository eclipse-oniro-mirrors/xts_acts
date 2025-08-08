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
import Util from '../../test/Util';
import { waitForExist } from '../../test/WaitTest.test';


@Entry
@Component
struct WebComponent {
  @State controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State isComplete: number = -1;

  build(){
    Column() {
      Text('Main Page')
      Button('runJavaScript')
        .key('runJavaScript')
        .onClick(async (event: ClickEvent) => {
          console.log('isMainFrame ' + 'clicked!');
          await waitForExist(()=>this.isComplete, 'SUB_ACE_WEB_getRequestMethod', 0);
          await this.controller.runJavaScript('loadIframePage()')
        });
      Web({ src: $rawfile('main_page.html'), controller: this.controller })
        .onNavigationEntryCommitted((details) => {
          console.log('onNavigationEntryCommitted: [isMainFrame]= ' + details.isMainFrame +
            ', [isSameDocument]=' + details.isSameDocument +
            ', [didReplaceEntry]=' + details.didReplaceEntry +
            ', [navigationType]=' + details.navigationType +
            ', [url]=' + details.url);
          if (details.isMainFrame === false) {
            Util.emitEvent(details.isMainFrame, 5010);
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
