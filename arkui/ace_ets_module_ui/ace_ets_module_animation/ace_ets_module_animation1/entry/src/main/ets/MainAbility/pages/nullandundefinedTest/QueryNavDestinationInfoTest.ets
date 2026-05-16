/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { uiObserver } from '@kit.ArkUI';

@Entry
@Component
struct QueryNavDestinationInfoTest {
  @State navDesInfo: uiObserver.NavDestinationInfo | undefined = undefined;
  @State text: string = '';

  build() {
    NavDestination() {
      Column() {
        Text('QueryNavDestinationInfo Test').fontSize(20).margin(20)

        Button('queryNavDestinationInfo null').onClick(() => {
          this.navDesInfo = this.queryNavDestinationInfo(null);
          this.text = JSON.stringify(this.navDesInfo);
        }).id('queryNavDestinationInfo_null')

        Button('queryNavDestinationInfo undefined').onClick(() => {
          this.navDesInfo = this.queryNavDestinationInfo(undefined);
          this.text = JSON.stringify(this.navDesInfo);
        }).id('queryNavDestinationInfo_undefined')

        Text('Result: ' + this.text).id('queryNavDestinationInfo_result')
      }
    }.title('NavDestinationPage')
  }
}