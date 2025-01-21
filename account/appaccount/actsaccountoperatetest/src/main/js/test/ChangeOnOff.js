/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import commonevent from '@ohos.commonEvent'
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const TIMEOUT = 2000;
export default function ActsAccountOnOff() {
    describe('ActsAccountOnOff', async function () {

        async function sleep(delay) {
            let timeoutId = null;
            var promise = new Promise((resolve, reject) => {
                timeoutId = setTimeout(() => resolve("done!"), delay);
            });
            await promise
            clearTimeout(timeoutId)
        }

        async function testInit(){
            console.info("====>startAbility start====");
            await featureAbility.startAbility(
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
            );
            await sleep(TIMEOUT);
        }

        /*
        * @tc.number    : ActsAccountOnOff_0300
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to change
        *                 the credential
        */
        it('ActsAccountOnOff_0300', 0, async function (done) {
            await testInit();
            console.info("====>ActsAccountOnOff_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add account ActsAccountOnOff_0300 start");
            await appAccountManager.createAccount("onoff_setcredential");
            console.info("====>enableAppAccess ActsAccountOnOff_0300 start");
            await appAccountManager.setAppAccess("onoff_setcredential", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0300 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.info("====>delete account 0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                done();
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0300 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_change_setcredential");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                await sleep(1000)
                appAccountManager.removeAccount("onoff_setcredential", removeAccountCallback);
            }
            async function publishCallback(err){
                console.info("====>publish call back err:" + JSON.stringify(err));
                await sleep(500)
                console.info("====>setCredential start====");
                try{
                    await appAccountManager.setCredential("onoff_setcredential", "credentialType", "credential");
                }
                catch(err){
                    console.error("====>setCredential fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>setCredential finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_change_setcredential"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.info("====>subscribe ActsAccountOnOff_0300 finish====")
            });

            var commonEventPublishData = {
                code: 9
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0300====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /*
        * @tc.number    : ActsAccountOnOff_0400
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to delete
        *                 authorized account
        */
        it('ActsAccountOnOff_0400', 0, async function (done) {
            await testInit();
            console.info("====>ActsAccountOnOff_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add first account ActsAccountOnOff_0400 start");
            await appAccountManager.createAccount("onoff_removeFir");
            console.info("====>add second account ActsAccountOnOff_0400 start");
            await appAccountManager.createAccount("onoff_removeSec");
            console.info("====>enableAppAccess first ActsAccountOnOff_0400 start");
            await appAccountManager.setAppAccess("onoff_removeFir", "com.example.actsaccountsceneonoff", true);
            console.info("====>enableAppAccess second ActsAccountOnOff_0400 start");
            await appAccountManager.setAppAccess("onoff_removeSec", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0400 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.info("====>remove account 0400 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                done();
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0400 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_remove_another");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                await sleep(1000)
                appAccountManager.removeAccount("onoff_removeFir", removeAccountCallback);
            }
            async function publishCallback(err){
                console.info("====>publish call back err:" + JSON.stringify(err));
                await sleep(500)
                console.info("====>removeAccount start====");
                try{
                    await appAccountManager.removeAccount("onoff_removeSec");
                }
                catch(err){
                    console.error("====>removeAccount fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>removeAccount finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_remove_another"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.info("====>subscribe ActsAccountOnOff_0400 finish====")
            });

            var commonEventPublishData = {
                code: 10
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0400====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /*
        * @tc.number    : ActsAccountOnOff_0500
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to delete
        *                 the only authorized account
        */
        it('ActsAccountOnOff_0500', 0, async function (done) {
            await testInit();
            console.info("====>ActsAccountOnOff_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add account ActsAccountOnOff_0500 start");
            await appAccountManager.createAccount("onoff_remove");
            console.info("====>enableAppAccess ActsAccountOnOff_0500 start");
            await appAccountManager.setAppAccess("onoff_remove", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0500 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.info("====>remove account 0500 err:" + JSON.stringify(err));
                done();
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0500 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_change_remove");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                await sleep(1000)
                appAccountManager.removeAccount("onoff_remove", removeAccountCallback);
            }
            async function publishCallback(err){
                console.info("====>publish call back err:" + JSON.stringify(err)); 
                await sleep(500)
                console.info("====>removeAccount start====");
                try{
                    await appAccountManager.removeAccount("onoff_remove");
                }
                catch(err){
                    console.error("====>removeAccount fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>removeAccount finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_change_remove"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.info("====>subscribe ActsAccountOnOff_0500 finish====")
            });

            var commonEventPublishData = {
                code: 11
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0500====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /*
        * @tc.number    : ActsAccountOnOff_0600
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to cancel
        *                 authorized account   
        */
        it('ActsAccountOnOff_0600', 0, async function (done) {
            await testInit();
            console.info("====>ActsAccountOnOff_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.info("====>creat appAccountManager finish");
            console.info("====>add first account ActsAccountOnOff_0600 start");
            await appAccountManager.createAccount("onoff_disableFir");
            console.info("====>add second account ActsAccountOnOff_0600 start");
            await appAccountManager.createAccount("onoff_disableSec");
            console.info("====>enableAppAccess first ActsAccountOnOff_0600 start");
            await appAccountManager.setAppAccess("onoff_disableFir", "com.example.actsaccountsceneonoff", true);
            console.info("====>enableAppAccess second ActsAccountOnOff_0600 start");
            await appAccountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.info("====>unsubscribe 0600 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.info("====>remove first account 0600 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.removeAccount("onoff_disableSec", (err)=>{
                    console.info("====>remove second account 0600 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    done();
                });
            }
            async function subscriberCallback(err, data){
                console.info("====>subscriberCallback 0600 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_set_another_disable");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                await sleep(1000)
                appAccountManager.removeAccount("onoff_disableFir", removeAccountCallback);
            }
            async function publishCallback(err){
                console.info("====>publish call back err:" + JSON.stringify(err));
                await sleep(500)
                console.info("====>disableAppAccess start====");
                try{
                    await appAccountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", false);
                }
                catch(err){
                    console.error("====>disableAppAccess fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.info("====>disableAppAccess finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_set_another_disable"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.info("====>subscribe ActsAccountOnOff_0600 finish====")
            });

            var commonEventPublishData = {
                code: 12
            }
            await sleep(500)
            console.info("====>publish event account_on_change 0600====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });
          
    })
}