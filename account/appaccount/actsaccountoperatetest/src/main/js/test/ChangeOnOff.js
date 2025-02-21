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
            console.debug("====>startAbility start====");
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
            testInit();
	    await sleep(500);
            console.debug("====>ActsAccountOnOff_0300 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat appAccountManager finish");
            console.debug("====>add account ActsAccountOnOff_0300 start");
            await appAccountManager.createAccount("onoff_setcredential");
            console.debug("====>enableAppAccess ActsAccountOnOff_0300 start");
            await appAccountManager.setAppAccess("onoff_setcredential", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.debug("====>unsubscribe 0300 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.debug("====>delete account 0300 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                done();
            }
            function subscriberCallback(err, data){
                console.debug("====>subscriberCallback 0300 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_change_setcredential");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                appAccountManager.removeAccount("onoff_setcredential", removeAccountCallback);
            }
            async function publishCallback(err){
                console.debug("====>publish call back err:" + JSON.stringify(err));
                await sleep(500)
                    console.debug("====>setCredential start====");
                    try{
                        await appAccountManager.setCredential("onoff_setcredential", "credentialType", "credential");
                    }
                    catch(err){
                        console.error("====>setCredential fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.debug("====>setCredential finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_change_setcredential"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.debug("====>subscribe ActsAccountOnOff_0300 finish====")
            });

            var commonEventPublishData = {
                code: 9
            }
            await sleep(1000)
            console.debug("====>publish event account_on_change 0300====");
            commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /*
        * @tc.number    : ActsAccountOnOff_0400
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to delete
        *                 authorized account
        */
        it('ActsAccountOnOff_0400', 0, async function (done) {
            testInit();
	    await sleep(500);
            console.debug("====>ActsAccountOnOff_0400 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat appAccountManager finish");
            console.debug("====>add first account ActsAccountOnOff_0400 start");
            await appAccountManager.createAccount("onoff_removeFir");
            console.debug("====>add second account ActsAccountOnOff_0400 start");
            await appAccountManager.createAccount("onoff_removeSec");
            console.debug("====>enableAppAccess first ActsAccountOnOff_0400 start");
            await appAccountManager.setAppAccess("onoff_removeFir", "com.example.actsaccountsceneonoff", true);
            console.debug("====>enableAppAccess second ActsAccountOnOff_0400 start");
            await appAccountManager.setAppAccess("onoff_removeSec", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.debug("====>unsubscribe 0400 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.debug("====>remove account 0400 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                done();
            }
            function subscriberCallback(err, data){
                console.debug("====>subscriberCallback 0400 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_remove_another");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                appAccountManager.removeAccount("onoff_removeFir", removeAccountCallback);
            }
            async function publishCallback(err){
                console.debug("====>publish call back err:" + JSON.stringify(err));
                await sleep(500)
                    console.debug("====>removeAccount start====");
                    try{
                        await appAccountManager.removeAccount("onoff_removeSec");
                    }
                    catch(err){
                        console.error("====>removeAccount fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.debug("====>removeAccount finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_remove_another"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.debug("====>subscribe ActsAccountOnOff_0400 finish====")
            });

            var commonEventPublishData = {
                code: 10
            }
            await sleep(1000)
                console.debug("====>publish event account_on_change 0400====");
                commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /*
        * @tc.number    : ActsAccountOnOff_0500
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to delete
        *                 the only authorized account
        */
        it('ActsAccountOnOff_0500', 0, async function (done) {
            testInit();
	    await sleep(500);
            console.debug("====>ActsAccountOnOff_0500 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat appAccountManager finish");
            console.debug("====>add account ActsAccountOnOff_0500 start");
            await appAccountManager.createAccount("onoff_remove");
            console.debug("====>enableAppAccess ActsAccountOnOff_0500 start");
            await appAccountManager.setAppAccess("onoff_remove", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.debug("====>unsubscribe 0500 err:" + JSON.stringify(err));
            }
            function subscriberCallback(err, data){
                console.debug("====>subscriberCallback 0500 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_change_remove");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                done();
            }
            async function publishCallback(err){
                console.debug("====>publish call back err:" + JSON.stringify(err)); 
                await sleep(500)
                    console.debug("====>removeAccount start====");
                    try{
                        await appAccountManager.removeAccount("onoff_remove");
                    }
                    catch(err){
                        console.error("====>removeAccount fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.debug("====>removeAccount finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_change_remove"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.debug("====>subscribe ActsAccountOnOff_0500 finish====")
            });

            var commonEventPublishData = {
                code: 11
            }
            await sleep(1000)
                console.debug("====>publish event account_on_change 0500====");
                commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });

        /*
        * @tc.number    : ActsAccountOnOff_0600
        * @tc.name      : Subscribe/unsubscribe to the change event of application
        * @tc.desc      : Received the account information change to the authorized account of the subscription to cancel
        *                 authorized account   
        */
        it('ActsAccountOnOff_0600', 0, async function (done) {
            testInit();
	    await sleep(500);
            console.debug("====>ActsAccountOnOff_0600 start====");
            var appAccountManager = account.createAppAccountManager();
            console.debug("====>creat appAccountManager finish");
            console.debug("====>add first account ActsAccountOnOff_0600 start");
            await appAccountManager.createAccount("onoff_disableFir");
            console.debug("====>add second account ActsAccountOnOff_0600 start");
            await appAccountManager.createAccount("onoff_disableSec");
            console.debug("====>enableAppAccess first ActsAccountOnOff_0600 start");
            await appAccountManager.setAppAccess("onoff_disableFir", "com.example.actsaccountsceneonoff", true);
            console.debug("====>enableAppAccess second ActsAccountOnOff_0600 start");
            await appAccountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", true);
            function unSubscriberCallback(err){
                console.debug("====>unsubscribe 0600 err:" + JSON.stringify(err));
            }
            function removeAccountCallback(err){
                console.debug("====>remove first account 0600 err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                appAccountManager.removeAccount("onoff_disableSec", (err)=>{
                    console.debug("====>remove second account 0600 err:" + JSON.stringify(err));
                    expect(err).assertEqual(null);
                    done();
                });
            }
            function subscriberCallback(err, data){
                console.debug("====>subscriberCallback 0600 data:" + JSON.stringify(data));
                expect(data.event).assertEqual("account_on_set_another_disable");
                expect(data.data).assertEqual("SUCCESS");
                commonevent.unsubscribe(subscriber, unSubscriberCallback);
                appAccountManager.removeAccount("onoff_disableFir", removeAccountCallback);
            }
            async function publishCallback(err){
                console.debug("====>publish call back err:" + JSON.stringify(err));
                await sleep(500)
                    console.debug("====>disableAppAccess start====");
                    try{
                        await appAccountManager.setAppAccess("onoff_disableSec", "com.example.actsaccountsceneonoff", false);
                    }
                    catch(err){
                        console.error("====>disableAppAccess fail err:" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.debug("====>disableAppAccess finish====");
            }
            var commonEventSubscribeInfo = {
                events: ["account_on_set_another_disable"]
            }
            var subscriber
            commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
                subscriber = data;
                commonevent.subscribe(subscriber, subscriberCallback);
                console.debug("====>subscribe ActsAccountOnOff_0600 finish====")
            });

            var commonEventPublishData = {
                code: 12
            }
            await sleep(1000)
                console.debug("====>publish event account_on_change 0600====");
                commonevent.publish("account_on_change", commonEventPublishData, publishCallback);
        });
          
    })
}