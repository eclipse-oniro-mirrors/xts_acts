/*
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import PrintExtension from '../testability/PrintExtension';

const DOMAIN: number = 0x0023
const TAG: string = 'printExtensionTestXTS';
let printExtension = new PrintExtension();

export default function printExtensionTest() {
  describe('printExtensionTest', () => {

    /**
     * @tc.number printExtension_function_0100
     * @tc.name Test printExtension
     * @tc.desc check the printExtension function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('printExtension_function_0100', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'printExtension_function_0100 onCreate begin');
      let want: Want = {
        bundleName: 'com.ohos.printxtstest',
        abilityName: 'PrintExtension'
      }
      printExtension.onCreate(want);
    })

    /**
     * @tc.number printExtension_function_0200
     * @tc.name Test printExtension
     * @tc.desc check the printExtension function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('printExtension_function_0200', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'printExtension_function_0200 onStartDiscoverPrinter begin');
      printExtension.onStartDiscoverPrinter();
    })

    /**
     * @tc.number printExtension_function_0300
     * @tc.name Test printExtension
     * @tc.desc check the printExtension function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('printExtension_function_0300', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'printExtension_function_0300 onStopDiscoverPrinter begin');
      printExtension.onStopDiscoverPrinter();
    })

    /**
     * @tc.number printExtension_function_0400
     * @tc.name Test printExtension
     * @tc.desc check the printExtension function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('printExtension_function_0400', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'printExtension_function_0400 onConnectPrinter begin');
      printExtension.onConnectPrinter();
    })

    /**
     * @tc.number printExtension_function_0500
     * @tc.name Test printExtension
     * @tc.desc check the printExtension function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('printExtension_function_0500', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'printExtension_function_0500 onDisconnectPrinter begin');
      printExtension.onDisconnectPrinter();
    })

    /**
     * @tc.number printExtension_function_0600
     * @tc.name Test printExtension
     * @tc.desc check the printExtension function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('printExtension_function_0600', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'printExtension_function_0600 onDestroy begin');
      printExtension.onDestroy();
    })
  })
}
