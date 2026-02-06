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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { FormLinkOptions } from '@ohos.arkui.component';
import CommonEventManager from '@ohos.commonEventManager';
import Utils from './Util.test';


const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}
let subscriberForm: CommonEventManager.CommonEventSubscriber;

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formLinkTest';

export default function formLinkTest() {
    describe("formLinkTest", (): void => {
        hilog.info(DOMAIN, TAG, 'formLinkTest describe start');

        /**
         * @tc.name   FormLinkStaticTest001
         * @tc.number FormLinkStaticTest001
         * @tc.desc   check FormLink
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormLinkStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, 'FormLinkStaticTest001 start');

            let formLinkTest_Event: CommonEventManager.CommonEventSubscribeInfo = {
                events: ["XTS_FormLinkTest_commonEvent"],
            };
            let isChecked: boolean = false;	
            let subscriberForm: CommonEventManager.CommonEventSubscriber = CommonEventManager.createSubscriberSync(formLinkTest_Event);
            let formLinkCallBack = (_: BusinessError | null, data: CommonEventManager.CommonEventData | undefined) => {	
                isChecked = true;	
                hilog.info(DOMAIN, TAG, 'FormLinkStaticTest001 FormLinkCallBack' + JSON.stringify(data));	
                expect(data?.event).assertEqual("XTS_FormLinkTest_commonEvent");
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("FormLinkStaticTest001"));
            }
            CommonEventManager.subscribe(subscriberForm, formLinkCallBack);

            expect(Utils.startAbility(
                "TestFormAbility",
                "com.example.actsformtest.static",
                "testform/pages/XtsFormLink",
            )).assertTrue();
            hilog.info(DOMAIN, TAG, 'FormLinkStaticTest001 startAbility end');
            await Utils.msSleep(1000); // waiting for the async subscribe.
            if (!isChecked) {
                hilog.info(DOMAIN, TAG, 'FormLinkStaticTest001 isChecked is false');
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("FormLinkStaticTest001"));
                expect(false).assertTrue();
            }

            done();
            hilog.info(DOMAIN, TAG, 'FormLinkStaticTest001 end');
        })

        /**
         * @tc.name   FormLinkOptionsStaticTest001
         * @tc.number FormLinkOptionsStaticTest001
         * @tc.desc   check FormLinkOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("FormLinkOptionsStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(DOMAIN, TAG, 'FormLinkOptionsStaticTest001 start');

            let formLinkOp: FormLinkOptions = {
                action: 'message',
                moduleName: 'moduleName',
                bundleName: 'bundleName',
                abilityName: 'abilityName',
                uri: 'uri',
            }
            expect('message').assertEqual(formLinkOp.action as string);
            expect('moduleName').assertEqual(formLinkOp.moduleName as string);
            expect('bundleName').assertEqual(formLinkOp.bundleName as string);
            expect('abilityName').assertEqual(formLinkOp.abilityName as string);
            expect('uri').assertEqual(formLinkOp.uri as string);

            done();
            hilog.info(DOMAIN, TAG, 'FormLinkOptionsStaticTest001 end');
        })
    })
}