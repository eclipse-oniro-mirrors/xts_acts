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

import commonEvent from '@ohos.commonEvent'
import featureAbility from '@ohos.ability.featureAbility'
import formBindingData from '@ohos.application.formBindingData'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


var getCallingBundleUri = {
    events: ['SUB_AA_OpenHarmony_Want_0200_CommonEvent']
}

var getCallingBundleType = {
    events: ['SUB_AA_OpenHarmony_Want_0300_CommonEvent']
}

async function sleep(delay)  {
    let timeoutId = null;
    var promise = new Promise((resolve, reject) => {
        timeoutId = setTimeout(() =>  resolve("done!"), delay);
    });
    await promise;
    clearTimeout(timeoutId);
}

export default function ApplicationInfoTest() {
describe('ApplicationInfoTest', function () {
    var TAG = '';
    beforeEach(async () => {
        await sleep(1000);
    })
    /*
     * @tc.number  SUB_AA_OpenHarmony_FormBase_1000
     * @tc.name    Validate formbindingdata creation data
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_FormBase_1000', 0, async function (done) {
        console.info('------------start SUB_AA_OpenHarmony_FormBase_1000-------------');
        TAG = 'SUB_AA_OpenHarmony_FormBase_1000';
        var dataObj = {
            temperature:"11c",
            "time":"11:00",
            "test":11,
            "test3":true
        }
        var formData = formBindingData.createFormBindingData(dataObj)
        console.info(TAG + " result is : " + JSON.stringify(formData))

        let formDataStrToObj = formData.data;
        console.info(TAG + " formDataStrToObj0 is : " + typeof formDataStrToObj + formDataStrToObj)
        if (typeof(formDataStrToObj) == "string" ) {
            console.info(TAG + " formDataStrToObj1 is : " + typeof formDataStrToObj)
            let formDataStrToObj2 = JSON.parse(formDataStrToObj)
            console.info(TAG + " formDataStrToObj2 is : " + typeof formDataStrToObj2)
            expect(formDataStrToObj2.test).assertEqual(11)
            expect(formDataStrToObj2.test3).assertTrue()
            expect(formDataStrToObj2.time).assertEqual("11:00")
            done();
        } else {
            console.info(TAG + " formDataStrToObj is : " + typeof formDataStrToObj)
            expect(formDataStrToObj.test).assertEqual(11)
            expect(formDataStrToObj.test3).assertTrue()
            expect(formDataStrToObj.time).assertEqual("11:00")
            done();
        }
        console.info('------------end SUB_AA_OpenHarmony_FormBase_1000-------------');
    });

    /*
     * @tc.number  SUB_AA_OpenHarmony_Want_0200
     * @tc.name    Switching the mission in the launcherlist to the foreground is not supported
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_Want_0200', 0, async function (done) {
        console.info('------------start SUB_AA_OpenHarmony_Want_0200-------------');
        TAG = 'SUB_AA_OpenHarmony_Want_0200';
        var Subscriber = '';

        function SubscribeCallBackUri(err, data) {
            console.info(TAG + ' Subscribe CallBack data:' + JSON.stringify(data) + JSON.stringify(err));
            expect(data.data == '{true,true,false}').assertTrue();
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            done();
        }

        function UnSubscribeCallback() {
            console.debug(TAG + "====>UnSubscribe CallBack====>");
            done();
        }

        commonEvent.createSubscriber(getCallingBundleUri).then(async (data) => {
            console.info(TAG + '====>Create Subscriber====');
            Subscriber = data;
            console.info(TAG + '====>Create Subscriber====' + JSON.stringify(data) );
            await commonEvent.subscribe(Subscriber, SubscribeCallBackUri);
        });

        featureAbility.startAbility({
            want: {
                abilityName: 'com.example.applicationinfo.MainAbility2',
                bundleName: 'com.example.applicationinfo',
                uri: '{true,true,false}'
            }
        }, (err, data) => {
            console.info(TAG + ':startAbility success , err:' + JSON.stringify(err) + ',data:' + JSON.stringify(data));
        });
        console.info('------------end SUB_AA_OpenHarmony_Want_0200-------------');
    });

    /*
     * @tc.number  SUB_AA_OpenHarmony_Want_0300
     * @tc.name    Switching the mission in the launcherlist to the foreground is not supported
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_Want_0300', 0, async function (done) {
        console.info('------------start SUB_AA_OpenHarmony_Want_0300-------------');
        TAG = 'SUB_AA_OpenHarmony_Want_0300';
        var Subscriber = '';

        function SubscribeCallBackType(err, data) {
            console.info(TAG + ' Subscribe CallBack data:' + JSON.stringify(data) + JSON.stringify(err));
            expect(data.data == 'MIMETYPE').assertTrue();
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            done();
        }

        function UnSubscribeCallback() {
            console.debug(TAG + "====>UnSubscribe CallBack====>");
            done();
        }

        commonEvent.createSubscriber(getCallingBundleType).then(async (data) => {
            console.info(TAG + '====>Create Subscriber====>');
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBackType);
        });

        featureAbility.startAbility({
            want: {
                abilityName: 'com.example.applicationinfo.MainAbility2',
                bundleName: 'com.example.applicationinfo',
                type: 'MIMETYPE',
            }
        }, (err, data) => {
            console.info(TAG + ':startAbility success , err:' + JSON.stringify(err) + ',data:' + JSON.stringify(data));
        });
        console.info('------------end SUB_AA_OpenHarmony_Want_0300-------------');
    })
})
}