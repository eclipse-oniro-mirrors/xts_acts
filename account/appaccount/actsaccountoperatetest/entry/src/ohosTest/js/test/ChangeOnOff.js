/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
import account from '@ohos.account.appAccount'
import commonevent from '@ohos.commonEventManager'
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsAccountOnOff() {
    describe('ActsAccountOnOff', async function () {
        async function sleep(delay) {
            let timeoutId = null;
            let promise = new Promise((resolve, reject) => {
                timeoutId = setTimeout(() => resolve("done!"), delay);
            });
            await promise
            clearTimeout(timeoutId)
        }

        async function testInit(){
            console.info("====>testInit startAbility start====");
            featureAbility.startAbilityForResult(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.example.actsaccountsceneonoff",
                        abilityName: "com.example.actsaccountsceneonoff.MainAbility",
                        action: "action1",
                        parameters:
                        {},
                    },
                },
            )
        }

        /**
         * @tc.name   ActsAccountOnOff_0300
         * @tc.number ActsAccountOnOff_0300
         * @tc.desc   Received the account information change to the authorized account of the subscription to change
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountOnOff_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await testInit();
            await sleep(500)
            console.info("====>ActsAccountOnOff_0300 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add account ActsAccountOnOff_0300 start");
            await appAccountManager.createAccount("onoff_setcredential");
            console.info("====>enableAppAccess ActsAccountOnOff_0300 start");
            await appAccountManager.setAppAccess("onoff_setcredential", "com.example.actsaccountsceneonoff", true);
            async function removeAccountCallback(err){
                console.info("====>subscribe ActsAccountOnOff_0300 finish====")
                console.info("====>delete account 0300 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info('====>Assert err: ' + JSON.stringify(err));
                }
                await sleep(500);
                done();
            }
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0300 err:" + JSON.stringify(err));
                appAccountManager.removeAccount("onoff_setcredential", removeAccountCallback);
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0300 data:" + JSON.stringify(data));
                try {
                    expect(data.event).assertEqual("account_on_change_setcredential");
                    if (data.data == "ON_SUCCESS") {
                        console.info("====>setCredential start====");
                        await appAccountManager.setCredential("onoff_setcredential", "credentialType", "credential");
                        console.info("====>setCredential finish====");
                    } else {
                        expect(data.data).assertEqual("SUCCESS");
                        commonevent.unsubscribe(subscriber, unSubscriberCallback);
                    }
                } catch (err) {
                    console.info('====>subscriberCallback err: ' + JSON.stringify(err));
                }
            }
            async function publishCallback(err){
                console.info("====>main publish call back err:" + JSON.stringify(err));
            }
            let commonEventSubscribeInfo = {
                events: ["account_on_change_setcredential"]
            }
            await sleep(500)
            let subscriber
            console.info("====>createSubscriber start");
            await commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                console.info("====>subscribe start");
                commonevent.subscribe(subscriber, subscriberCallback);
            })
            let commonEventPublishData = {
                code: 9
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0300====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /**
         * @tc.name   ActsAccountOnOff_0400
         * @tc.number ActsAccountOnOff_0400
         * @tc.desc   Received the account information change to the authorized account of the subscription to delete
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ActsAccountOnOff_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await testInit();
            await sleep(500)
            console.info("====>ActsAccountOnOff_0400 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add first account ActsAccountOnOff_0400 start");
            await appAccountManager.createAccount("onoff_removeFir");
            console.info("====>add second account ActsAccountOnOff_0400 start");
            await appAccountManager.createAccount("onoff_removeSec");
            console.info("====>enableAppAccess first ActsAccountOnOff_0400 start");
            await appAccountManager.setAppAccess("onoff_removeFir", "com.example.actsaccountsceneonoff", true);
            console.info("====>enableAppAccess second ActsAccountOnOff_0400 start");
            await appAccountManager.setAppAccess("onoff_removeSec", "com.example.actsaccountsceneonoff", true);
            async function removeAccountCallback(err){
                console.info("====>remove account 0400 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info('====>Assert err: ' + JSON.stringify(err));
                }
                await sleep(500);
                done();
            }
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0400 err:" + JSON.stringify(err));
                appAccountManager.removeAccount("onoff_removeFir", removeAccountCallback);
                console.info("====>subscribe ActsAccountOnOff_0400 finish====")
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0400 data:" + JSON.stringify(data));
                try {
                    expect(data.event).assertEqual("account_on_remove_another");
                    if (data.data == "ON_SUCCESS") {
                        console.info("====>removeAccount start====");
                        await appAccountManager.removeAccount("onoff_removeSec");
                        console.info("====>removeAccount finish====");
                    } else {
                        expect(data.data).assertEqual("SUCCESS");
                        commonevent.unsubscribe(subscriber, unSubscriberCallback);
                    }
                } catch (err) {
                    console.info('====>subscriberCallback err: ' + JSON.stringify(err));
                }
            }
            async function publishCallback(err){
                console.info("====>main publish call back err:" + JSON.stringify(err));
            }
            let commonEventSubscribeInfo = {
                events: ["account_on_remove_another"]
            }
            await sleep(500)
            let subscriber
            console.info("====>createSubscriber start");
            await commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                console.info("====>subscribe start");
                commonevent.subscribe(subscriber, subscriberCallback);
            })
            let commonEventPublishData = {
                code: 10
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0400====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /**
         * @tc.name   ActsAccountOnOff_0500
         * @tc.number ActsAccountOnOff_0500
         * @tc.desc   Received the account information change to the authorized account of the subscription to delete
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountOnOff_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            await testInit();
            await sleep(500)
            console.info("====>ActsAccountOnOff_0500 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add account ActsAccountOnOff_0500 start");
            await appAccountManager.createAccount("onoff_remove");
            console.info("====>enableAppAccess ActsAccountOnOff_0500 start");
            await appAccountManager.setAppAccess("onoff_remove", "com.example.actsaccountsceneonoff", true);
            async function removeAccountCallback(err){
                console.info("====>remove account 0500 err:" + JSON.stringify(err));
                console.info("====>subscribe ActsAccountOnOff_0500 finish====")
                await sleep(500);
                done();
            }
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0500 err:" + JSON.stringify(err));
                appAccountManager.removeAccount("onoff_remove", removeAccountCallback);
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0500 data:" + JSON.stringify(data));
                try {
                    expect(data.event).assertEqual("account_on_change_remove");
                    if (data.data == "ON_SUCCESS") {
                        console.info("====>removeAccount start====");
                        await appAccountManager.removeAccount("onoff_remove");
                        console.info("====>removeAccount finish====");
                    } else {
                        expect(data.data).assertEqual("SUCCESS");
                        commonevent.unsubscribe(subscriber, unSubscriberCallback);
                    }
                } catch (err) {
                    console.info('====>subscriberCallback err: ' + JSON.stringify(err));
                }
            }
            async function publishCallback(err){
                console.info("====>main publish call back err:" + JSON.stringify(err));
            }
            let commonEventSubscribeInfo = {
                events: ["account_on_change_remove"]
            }
            await sleep(500)
            let subscriber
            console.info("====>createSubscriber start");
            await commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                console.info("====>subscribe start");
                commonevent.subscribe(subscriber, subscriberCallback);
            })
            let commonEventPublishData = {
                code: 11
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0500====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /**
         * @tc.name   ActsAccountOnOff_0600
         * @tc.number ActsAccountOnOff_0600
         * @tc.desc   Received the account information change to the authorized account of the subscription to cancel
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('ActsAccountOnOff_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
            await testInit();
            await sleep(500)
            console.info("====>ActsAccountOnOff_0600 start====");
            let appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add first account ActsAccountOnOff_0600 start");
            await appAccountManager.createAccount("onoff_disableFir");
            console.info("====>add second account ActsAccountOnOff_0600 start");
            await appAccountManager.createAccount("onoff_disableSec");
            console.info("====>enableAppAccess first ActsAccountOnOff_0600 start");
            await appAccountManager.setAppAccess("onoff_disableFir", "com.example.actsaccountsceneonoff", true);
            console.info("====>enableAppAccess second ActsAccountOnOff_0600 start");
            await appAccountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", true);
            function removeAccountCallback(err){
                console.info("====>remove first account 0600 err:" + JSON.stringify(err));
                try {
                    expect(err).assertEqual(null);
                } catch (err) {
                    console.info('====>Assert err: ' + JSON.stringify(err));
                }
                appAccountManager.removeAccount("onoff_disableSec", async (err)=>{
                    console.info("====>remove second account 0600 err:" + JSON.stringify(err));
                    console.info("====>subscribe ActsAccountOnOff_0600 finish====")
                    try {
                        expect(err).assertEqual(null);
                    } catch (err) {
                        console.info('====>Assert err: ' + JSON.stringify(err));
                    }
                    await sleep(500);
                    done();
                });
            }
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0600 err:" + JSON.stringify(err));
                appAccountManager.removeAccount("onoff_disableFir", removeAccountCallback);
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0600 data:" + JSON.stringify(data));
                try {
                    expect(data.event).assertEqual("account_on_set_another_disable");
                    if (data.data == "ON_SUCCESS") {
                        console.info("====>disableAppAccess start====");
                        await appAccountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", false);
                        console.info("====>disableAppAccess finish====");
                    } else {
                        expect(data.data).assertEqual("SUCCESS");
                        commonevent.unsubscribe(subscriber, unSubscriberCallback);
                    }
                } catch (err) {
                    console.info('====>subscriberCallback err: ' + JSON.stringify(err));
                }
            }
            async function publishCallback(err){
                console.info("====>main publish call back err:" + JSON.stringify(err));
            }
            let commonEventSubscribeInfo = {
                events: ["account_on_set_another_disable"]
            }
            await sleep(500)
            let subscriber
            console.info("====>createSubscriber start");
            await commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                console.info("====>subscribe start");
                commonevent.subscribe(subscriber, subscriberCallback);
            })
            let commonEventPublishData = {
                code: 12
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0600====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /**
         * @tc.name   ActsAccountOnOff_0700
         * @tc.number ActsAccountOnOff_0700
         * @tc.desc   Receive account information after the app subscribes to itself and changes additional information
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('ActsAccountOnOff_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("====>ActsAccountOnOff_0700 start====");
            let dataMap = new Map();
            let appAccountManager = account.createAppAccountManager();
            console.info("====>ActsAccountOnOff_0700 start createAccount");
            await appAccountManager.createAccount("onoff_self");
            console.info("====>ActsAccountOnOff_0700 start on");
            try{
                appAccountManager.on('accountChange', ["com.example.actsaccountoperatetest"], async (data) => {
                    console.info("====>receive change 0700 data:" + JSON.stringify(data));
                    console.info("====>data.length:" + data.length);
                    expect(data.length > 0).assertTrue();
                    for (let i = 0, len = data.length; i < len; i++) {
                        dataMap.set(data[i].name, data[i].owner)
                    }
                    expect(dataMap.has("onoff_self")).assertTrue();
                    if (dataMap.has("onoff_self")) {
                        let data = dataMap.get("onoff_self");
                        console.info("====>the account owner is: " + data);
                        expect(data).assertEqual("com.example.actsaccountoperatetest");
                    }
                    appAccountManager.off('accountChange');
                    await sleep(500);
                    console.info("====>off ActsAccountOnOff_0700 finish====");
                    await appAccountManager.removeAccount("onoff_self");
                    console.info("====>ActsAccountOnOff_0700 end====");
                    done();
                });
            } catch (err) {
                console.error("====>on ActsAccountOnOff_0700 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info("====>setAccountExtraInfo start====");
            try{
                await appAccountManager.setCustomData("onoff_self","key","value");
            } catch (err) {
                console.error("====>setAccountExtraInfo fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });
    })
}
