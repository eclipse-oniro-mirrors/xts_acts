/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import formBindingData from '@ohos.app.form.formBindingData';
import Utils from './Util.test';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formBindingDataTest';

export default function formBindingDataTest() {
    describe("formBindingDataTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formBindingDataTest describe start');

        /**
         * @tc.name   FormBindingDataStaticTest001
         * @tc.number FormBindingDataStaticTest001
         * @tc.desc   check formBindingData
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormBindingDataStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormBindingDataStaticTest001 start');

            let dataObj1: Record<string, string> = {
                'temperature': '11c',
                'time': '11:00'
            };
            let formBinding = formBindingData.createFormBindingData(dataObj1)
            expect(formBinding.data + '').assertEqual('temperature,11c,time,11:00');

            let module1ProxyData: formBindingData.ProxyData = {
                key: "123456789",
                subscriberId: "123456789"
            }
            let module2ProxyData: formBindingData.ProxyData = {
                key: "abc",
            }
            let proxyDataS: formBindingData.ProxyData[] = [];
            proxyDataS.push(module1ProxyData);
            proxyDataS.push(module2ProxyData);
            let module1Data: formBindingData.FormBindingData = {
                data: "com.example.test123",
                proxies: proxyDataS
            }
            let bindingData: formBindingData.FormBindingData = module1Data;
            expect("com.example.test123").assertEqual(bindingData.data);
            expect(bindingData.proxies?.length === 2).assertTrue();

            done();
            hilog.info(DOMAIN, TAG, 'FormBindingDataStaticTest001 end');
        })

        /**
         * @tc.name   FormBindingDataStaticTest002
         * @tc.number FormBindingDataStaticTest002
         * @tc.desc   check formBindingData
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormBindingDataStaticTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(DOMAIN, TAG, 'FormBindingDataStaticTest002 start');

            // with number values
            let dataObjWithNumbers: Record<string, number> = {
                'temperature': 11,
                'humidity': 65
            };
            let formBinding: formBindingData.FormBindingData = formBindingData.createFormBindingData(dataObjWithNumbers);
            expect('temperature,11,humidity,65').assertEqual(formBinding.data + '');

            let boolData: boolean = true;
            let formBinding2: formBindingData.FormBindingData = formBindingData.createFormBindingData(boolData);
            expect(true).assertEqual(formBinding2.data as boolean);

            done();
            hilog.info(DOMAIN, TAG, 'FormBindingDataStaticTest002 end');
        })
    })
}