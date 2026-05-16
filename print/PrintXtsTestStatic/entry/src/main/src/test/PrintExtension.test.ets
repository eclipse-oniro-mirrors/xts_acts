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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import Want from '@ohos.app.ability.Want';
import PrintExtension from '../testability/PrintExtension';

const DOMAIN: int = 0x0023
const TAG: string = 'printExtensionTestXTS';
let printExtension = new PrintExtension();

export default function printExtensionTest() {
  describe('printExtensionTest', (): void => {

    /**
     * @tc.name   printExtension_function_0100
     * @tc.number printExtension_function_0100
     * @tc.desc   check the printExtension function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('printExtension_function_0100', Level.LEVEL2, ():void => {
        hilog.info(DOMAIN, TAG, 'printExtension_function_0100 onCreate begin');
        try {
            let want: Want = {
                bundleName: 'com.ohos.printxtstest',
                abilityName: 'PrintExtension'
            }
            printExtension.onCreate(want);
        } catch (err) {
            hilog.error(DOMAIN, TAG, 'printExtension_function_0100 error');
            expect().assertFail();
        }
    })

    /**
     * @tc.name   printExtension_function_0200
     * @tc.number printExtension_function_0200
     * @tc.desc   check the printExtension function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('printExtension_function_0200', Level.LEVEL2, ():void => {
        try {
            hilog.info(DOMAIN, TAG, 'printExtension_function_0200 onStartDiscoverPrinter begin');
            printExtension.onStartDiscoverPrinter();
        } catch (err) {
            hilog.error(DOMAIN, TAG, 'printExtension_function_0200 error');
            expect().assertFail();
        }
    })

    /**
     * @tc.name   printExtension_function_0300
     * @tc.number printExtension_function_0300
     * @tc.desc   check the printExtension function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('printExtension_function_0300', Level.LEVEL2, ():void => {
        try {
            hilog.info(DOMAIN, TAG, 'printExtension_function_0300 onStopDiscoverPrinter begin');
            printExtension.onStopDiscoverPrinter();
        } catch (err) {
            hilog.error(DOMAIN, TAG, 'printExtension_function_0300 error');
            expect().assertFail();
        }
    })

    /**
     * @tc.name   printExtension_function_0400
     * @tc.number printExtension_function_0400
     * @tc.desc   check the printExtension function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('printExtension_function_0400', Level.LEVEL2, ():void => {
        try {
            hilog.info(DOMAIN, TAG, 'printExtension_function_0400 onConnectPrinter begin');
            printExtension.onConnectPrinter();
        } catch (err) {
            hilog.error(DOMAIN, TAG, 'printExtension_function_0400 error');
            expect().assertFail();
        }
    })

    /**
     * @tc.name   printExtension_function_0500
     * @tc.number printExtension_function_0500
     * @tc.desc   check the printExtension function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('printExtension_function_0500', Level.LEVEL2, ():void => {
        try {
            hilog.info(DOMAIN, TAG, 'printExtension_function_0500 onDisconnectPrinter begin');
            printExtension.onDisconnectPrinter();
        } catch (err) {
            hilog.error(DOMAIN, TAG, 'printExtension_function_0500 error');
            expect().assertFail();
        }
    })

    /**
     * @tc.name   printExtension_function_0600
     * @tc.number printExtension_function_0600
     * @tc.desc   check the printExtension function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('printExtension_function_0600', Level.LEVEL2, ():void => {
        try {
            hilog.info(DOMAIN, TAG, 'printExtension_function_0600 onDestroy begin');
            printExtension.onDestroy();
        } catch (err) {
            hilog.error(DOMAIN, TAG, 'printExtension_function_0600 error');
            expect().assertFail();
        }
    })
  })
}
