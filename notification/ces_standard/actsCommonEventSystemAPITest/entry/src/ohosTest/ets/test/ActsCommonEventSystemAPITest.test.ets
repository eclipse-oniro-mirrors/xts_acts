/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'
import { BusinessError } from '@ohos.base'


export default function ActsCommonEventSystemAPITest() {
describe('SUB_NOTIFICATION_CES_SYSTEM_API_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST START')

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_5000
     * @tc.name: publishAsUser 
     * @tc.desc: test function publishAsBundle
     */
    it('Sub_Notification_Ans_Publish_Publish_5000', 0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5000 START`);

        commonEventManager.publishAsUser("event.test", 0, (err) => {
            if (err) {
                console.info(`${TAG} publishAsUser AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} publishAsUser AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5000 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_5100
     * @tc.name: publishAsUser
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ans_Publish_Publish_5100', 0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5100 START`);

        let publishData: commonEventManager.CommonEventPublishData = {
            bundleName: "example.bundleName",
            code: 1
        }

        commonEventManager.publishAsUser("event.test", 0, publishData, (err) => {
            if (err) {
                console.info(`${TAG} publishAsUser AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info(`${TAG} publishAsUser AsyncCallback success`)
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_5100 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ces_StaticEvent_Config_1200
     * @tc.name: removeStickyCommonEvent
     * @tc.desc: test function removeStickyCommonEvent
     */
    it('Sub_Notification_Ces_StaticEvent_Config_1200', 0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1200 START`);

        commonEventManager.removeStickyCommonEvent("sticky_event", (err) => {
            if (err) {
                console.info(`${TAG} remove sticky event AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(err.code).assertEqual(202);
                done()
            } else {
                console.info("${TAG} remove sticky event AsyncCallback success");
                expect(false).assertTrue()
                done()
            }
        });

        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1200 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ces_StaticEvent_Config_1300
     * @tc.name: removeStickyCommonEvent
     * @tc.desc: test function removeStickyCommonEvent
     */
    it('Sub_Notification_Ces_StaticEvent_Config_1300', 0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1300 START`);

        commonEventManager.removeStickyCommonEvent("sticky_event").then(() => {
            console.info("${TAG} remove sticky event AsyncCallback success");
            expect(false).assertTrue()
            done()
        }).catch ((err: BusinessError) => {
            console.info(`${TAG} remove sticky event AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
        });

        console.info(`${TAG} Sub_Notification_Ces_StaticEvent_Config_1300 END`);
    });
}) } 