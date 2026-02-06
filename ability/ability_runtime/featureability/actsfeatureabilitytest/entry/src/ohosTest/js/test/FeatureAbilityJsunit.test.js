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
import featureAbility from '@ohos.ability.featureAbility'
import wantconstant from '@ohos.ability.wantConstant'
import wantConstantNew from '@ohos.app.ability.wantConstant'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import particleAbility from '@ohos.ability.particleAbility'
import backgroundTaskManager from '@ohos.backgroundTaskManager'

const START_ABILITY_TIMEOUT = 4000;
let subscriberInfoActsStartAbility0100 = {
    events: ["ACTS_StartAbility_0100_CommonEvent"],
};
let subscriberInfoActsStartAbility0201 = {
    events: ["ACTS_StartAbility_0201_CommonEvent"],
};
let subscriberInfoActsStartAbility0301 = {
    events: ["ACTS_StartAbility_0301_CommonEvent"],
};
let subscriberInfoActsStartAbility0401 = {
    events: ["ACTS_StartAbility_0401_CommonEvent"],
};
let subscriberInfoActsStartAbility0501 = {
    events: ["ACTS_StartAbility_0501_CommonEvent"],
};
let subscriberInfoActsStartAbility0601 = {
    events: ["ACTS_StartAbility_0601_CommonEvent"],
};
let subscriberInfoStartAbilityTen = {
    events: ["ACTS_StartAbility_1000_CommonEvent"],
};
let subscriberInfoStartAbilityThirteen = {
    events: ["ACTS_StartAbility_1300_CommonEvent"],
};
let subscriberInfoTerminateAbilityTwo = {
    events: ["ACTS_TerminateAbility_0200_CommonEvent",
        "ACTS_TerminateAbility_0200_Return"],
};
let subscriberInfoActsGetCallingBundle0100 = {
    events: ["ACTS_GetCallingBundle_0100_CommonEvent",
        "com.example.actsfeatureabilitytest.promise",
        "com.example.actsfeatureabilitytest.callback"],
};

function sleep(time) {
    return new Promise((resolve)=>setTimeout(resolve,time));
}
export default function actsFeatureAbilityTest() {
describe('ActsFeatureAbilityTest', function () {

    beforeAll(function() {

        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called')
    }) 
        
    afterAll(function() {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called')
    })

    beforeEach(function() {

        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach called')
    })

    afterEach(async function(done) {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
         console.info('afterEach called')
         particleAbility.cancelBackgroundRunning();
         setTimeout(() => {}, 500);
         backgroundTaskManager.stopBackgroundRunning(featureAbility.getContext());
         setTimeout(() => {}, 500);

        let wantInfo = {
            want: {
                bundleName: "com.example.actsfeatureabilitytest",
                abilityName: "com.example.actsfeatureabilitytest.TestAbility"
            }
        }
        await featureAbility.startAbility(wantInfo).then((data) => {
          console.log("ACTS_wantConstant startAbility data : " + JSON.stringify(data));
        }).catch((err) => {
          console.log("ACTS_wantConstant startAbility err : " + JSON.stringify(err));
        })
        setTimeout(function () {
            console.log("ACTS_wantConstant afterEach end");
            done();
        }, 2000);
    })

    /**
     * @tc.number: ACTS_wantConstant_0100
     * @tc.name: wantConstant : Check specific enum
     * @tc.desc: Check the return type of the interface (by Promise)
     */
    it('ACTS_wantConstant_0100', Level.LEVEL0, async function (done) {
        expect(wantconstant.Action.ACTION_HOME).assertEqual("ohos.want.action.home");
        expect(wantconstant.Action.ACTION_DIAL).assertEqual("ohos.want.action.dial");
        expect(wantconstant.Action.ACTION_SEARCH).assertEqual("ohos.want.action.search");
        expect(wantconstant.Action.ACTION_WIRELESS_SETTINGS).assertEqual("ohos.settings.wireless");
        expect(wantconstant.Action.ACTION_MANAGE_APPLICATIONS_SETTINGS)
        .assertEqual("ohos.settings.manage.applications");
        expect(wantconstant.Action.ACTION_APPLICATION_DETAILS_SETTINGS)
        .assertEqual("ohos.settings.application.details");
        expect(wantconstant.Action.ACTION_SET_ALARM).assertEqual("ohos.want.action.setAlarm");
        expect(wantconstant.Action.ACTION_SHOW_ALARMS).assertEqual("ohos.want.action.showAlarms");
        expect(wantconstant.Action.ACTION_SNOOZE_ALARM).assertEqual("ohos.want.action.snoozeAlarm");
        expect(wantconstant.Action.ACTION_DISMISS_ALARM).assertEqual("ohos.want.action.dismissAlarm");
        expect(wantconstant.Action.ACTION_DISMISS_TIMER).assertEqual("ohos.want.action.dismissTimer");
        expect(wantconstant.Action.ACTION_SEND_SMS).assertEqual("ohos.want.action.sendSms");
        expect(wantconstant.Action.ACTION_CHOOSE).assertEqual("ohos.want.action.choose");
        expect(wantconstant.Action.ACTION_SELECT).assertEqual("ohos.want.action.select");
        expect(wantconstant.Action.ACTION_SEND_DATA).assertEqual("ohos.want.action.sendData");
        expect(wantconstant.Action.ACTION_SEND_MULTIPLE_DATA).assertEqual("ohos.want.action.sendMultipleData");
        expect(wantconstant.Action.ACTION_SCAN_MEDIA_FILE).assertEqual("ohos.want.action.scanMediaFile");
        expect(wantconstant.Action.ACTION_VIEW_DATA).assertEqual("ohos.want.action.viewData");
        expect(wantconstant.Action.ACTION_EDIT_DATA).assertEqual("ohos.want.action.editData");
        expect(wantconstant.Action.INTENT_PARAMS_INTENT).assertEqual("ability.want.params.INTENT");
        expect(wantconstant.Action.INTENT_PARAMS_TITLE).assertEqual("ability.want.params.TITLE");
        expect(wantconstant.Action.ACTION_FILE_SELECT).assertEqual("ohos.action.fileSelect");
        expect(wantconstant.Action.PARAMS_STREAM).assertEqual("ability.params.stream");

        expect(wantconstant.Entity.ENTITY_HOME).assertEqual("entity.system.home");
        expect(wantconstant.Entity.ENTITY_DEFAULT).assertEqual("entity.system.default");
        expect(wantconstant.Entity.ENTITY_VOICE).assertEqual("entity.system.voice");
        expect(wantconstant.Entity.ENTITY_BROWSABLE).assertEqual("entity.system.browsable");
        expect(wantconstant.Entity.ENTITY_VIDEO).assertEqual("entity.system.video");
        done();
    })


    /**
     * @tc.number: ACTS_wantConstant_0200
     * @tc.name: wantConstant : Check specific enum
     * @tc.desc: Check the return type of the interface (by Promise)
     */
    it('ACTS_wantConstant_0200', Level.LEVEL0, async function (done) {
        expect(wantConstantNew.Action.ACTION_HOME).assertEqual("ohos.want.action.home");
        expect(wantConstantNew.Action.ACTION_DIAL).assertEqual("ohos.want.action.dial");
        expect(wantConstantNew.Action.ACTION_SEARCH).assertEqual("ohos.want.action.search");
        expect(wantConstantNew.Action.ACTION_WIRELESS_SETTINGS).assertEqual("ohos.settings.wireless");
        expect(wantConstantNew.Action.ACTION_MANAGE_APPLICATIONS_SETTINGS)
            .assertEqual("ohos.settings.manage.applications");
        expect(wantConstantNew.Action.ACTION_APPLICATION_DETAILS_SETTINGS)
            .assertEqual("ohos.settings.application.details");
        expect(wantConstantNew.Action.ACTION_SET_ALARM).assertEqual("ohos.want.action.setAlarm");
        expect(wantConstantNew.Action.ACTION_SHOW_ALARMS).assertEqual("ohos.want.action.showAlarms");
        expect(wantConstantNew.Action.ACTION_SNOOZE_ALARM).assertEqual("ohos.want.action.snoozeAlarm");
        expect(wantConstantNew.Action.ACTION_DISMISS_ALARM).assertEqual("ohos.want.action.dismissAlarm");
        expect(wantConstantNew.Action.ACTION_DISMISS_TIMER).assertEqual("ohos.want.action.dismissTimer");
        expect(wantConstantNew.Action.ACTION_SEND_SMS).assertEqual("ohos.want.action.sendSms");
        expect(wantConstantNew.Action.ACTION_CHOOSE).assertEqual("ohos.want.action.choose");
        expect(wantConstantNew.Action.ACTION_SELECT).assertEqual("ohos.want.action.select");
        expect(wantConstantNew.Action.ACTION_SEND_DATA).assertEqual("ohos.want.action.sendData");
        expect(wantConstantNew.Action.ACTION_SEND_MULTIPLE_DATA).assertEqual("ohos.want.action.sendMultipleData");
        expect(wantConstantNew.Action.ACTION_SCAN_MEDIA_FILE).assertEqual("ohos.want.action.scanMediaFile");
        expect(wantConstantNew.Action.ACTION_VIEW_DATA).assertEqual("ohos.want.action.viewData");
        expect(wantConstantNew.Action.ACTION_EDIT_DATA).assertEqual("ohos.want.action.editData");
        expect(wantConstantNew.Action.INTENT_PARAMS_INTENT).assertEqual("ability.want.params.INTENT");
        expect(wantConstantNew.Action.INTENT_PARAMS_TITLE).assertEqual("ability.want.params.TITLE");
        expect(wantConstantNew.Action.ACTION_FILE_SELECT).assertEqual("ohos.action.fileSelect");
        expect(wantConstantNew.Action.PARAMS_STREAM).assertEqual("ability.params.stream");
        expect(wantConstantNew.Action.ACTION_APP_ACCOUNT_AUTH).assertEqual("ohos.appAccount.action.auth");

        expect(wantConstantNew.Entity.ENTITY_HOME).assertEqual("entity.system.home");
        expect(wantConstantNew.Entity.ENTITY_DEFAULT).assertEqual("entity.system.default");
        expect(wantConstantNew.Entity.ENTITY_VOICE).assertEqual("entity.system.voice");
        expect(wantConstantNew.Entity.ENTITY_BROWSABLE).assertEqual("entity.system.browsable");
        expect(wantConstantNew.Entity.ENTITY_VIDEO).assertEqual("entity.system.video");
        done();
    })

    /**
     * @tc.number: ACTS_GetContext_0100
     * @tc.name: GetContext : Obtains the Context object
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_GetContext_0100', Level.LEVEL0, async function (done) {
        let promise = await featureAbility.getContext()
        expect(typeof (promise)).assertEqual("object");
        done();
    })

    /**
     * @tc.number: ACTS_HasWindowFocus_0100
     * @tc.name: HasWindowFocus : Checks whether the main window of this ability has window focus
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_HasWindowFocus_0100', Level.LEVEL0, async function (done) {
        let info = await featureAbility.hasWindowFocus();
        expect(info).assertEqual(true);
        console.info('====> ACTS_HasWindowFocus_0100 end=====>')
        done();
    })

    /**
     * @tc.number: ACTS_HasWindowFocus_0300
     * @tc.name: HasWindowFocus : Checks whether the main window of this ability has window focus
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_HasWindowFocus_0300', Level.LEVEL0, async function (done) {
        let result = featureAbility.hasWindowFocus(
            (err, data) => {
                console.info("hasWindowFocus asyncCallback code data: " + data);
                expect(data).assertTrue();
                done()
            }
        );
        console.info('AceApplication : hasWindowFocus : ' + result);
    })

    /*
     * @tc.number  ACTS_StartAbility_1000
     * @tc.name    The configured URI is started and the page is not configured
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1000", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1000-------------------");
        try{
            let Subscriber;
            let id;

            function SubscribeCallBack(err, data) {
                clearTimeout(id);
                expect(data.event).assertEqual("ACTS_StartAbility_1000_CommonEvent");
                console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
                done();
            }

            commonEvent.createSubscriber(subscriberInfoStartAbilityTen).then(async (data) => {
                console.debug("====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
            })

            function UnSubscribeCallback() {
                console.debug("====>UnSubscribe CallBack====>");
                done();
            }

            function timeout() {
                expect().assertFail();
                console.debug('ACTS_StartAbility_1000=====timeout======');
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                done();
            }

            id = setTimeout(timeout, START_ABILITY_TIMEOUT);
            let Want = {
                bundleName: "com.example.startability",
                abilityName: "com.example.startability.MainAbility",
                uri: "xxxxx",
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_1000 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data));
                expect(err.code == 0).assertTrue();
            });
        }catch(error){
            console.info("ACTS_StartAbility_1000 : error = " + error);
        }
    })

    /**
     * @tc.number: ACTS_StartAbility_0100
     * @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_StartAbility_0100', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            expect(data.event).assertEqual("ACTS_StartAbility_0100_CommonEvent");
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            done();
        }

        commonEvent.createSubscriber(subscriberInfoActsStartAbility0100).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_StartAbility_0100=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        let promise = await featureAbility.startAbility(
            {
                want:
                {
                    action: "action.system.homeability",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options: {
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.startability",
                    abilityName: "com.example.startability.MainAbility",
                    uri: ""
                },
            }
        );
        expect(promise).assertEqual(0);
    })

    /**
     * @tc.number: ACTS_StartAbility_0201
     * @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
     * @tc.desc: Pass the parameters, Check the return value of the interface (by Promise)
     */
    it('ACTS_StartAbility_0201', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            expect(promise).assertEqual(0);
            expect(data.event).assertEqual("ACTS_StartAbility_0201_CommonEvent");
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }

        await commonEvent.createSubscriber(subscriberInfoActsStartAbility0201).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_StartAbility_0201=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        console.debug('=======wait id======');
        let promise = await featureAbility.startAbility(
            {
                want:
                {
                    action: "action.system.homeability",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options: {
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.startability",
                    abilityName: "com.example.startability.MainAbility",
                    uri: "",
                    parameters:
                    {
                        mykey0: 1111,
                        mykey1: [1, 2, 3],
                        mykey2: "[1, 2, 3]",
                        mykey3: "xxxxxxxxxxxxxxxxxxxxxx",
                        mykey4: [1, 15],
                        mykey5: [false, true, false],
                        mykey6: ["aaaaaa", "bbbbb", "ccccccccccc"],
                        mykey7: true,
                    },
                },
            }
        );
    })

    /**
     * @tc.number: ACTS_StartAbility_0301
     * @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
     * @tc.desc: Passing null, Check the return value of the interface (by Promise)
     */
    it('ACTS_StartAbility_0301', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            expect(data.event).assertEqual("ACTS_StartAbility_0301_CommonEvent");
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        commonEvent.createSubscriber(subscriberInfoActsStartAbility0301).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_StartAbility_0301=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        let promise = await featureAbility.startAbility(
            {
                want:
                {
                    action: "",
                    entities: [""],
                    type: "",
                    options: {
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.startability",
                    abilityName: "com.example.startability.MainAbility",
                    uri: ""
                },
            }
        );
        expect(promise).assertEqual(0);
    })

    /**
     * @tc.number: ACTS_StartAbility_0401
     * @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_StartAbility_0401', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            expect(data.event).assertEqual("ACTS_StartAbility_0401_CommonEvent");
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        commonEvent.createSubscriber(subscriberInfoActsStartAbility0401).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_StartAbility_0401=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        let result = featureAbility.startAbility(
            {
                want:
                {
                    action: "action.system.homeability",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options: {
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.startability",
                    abilityName: "com.example.startability.MainAbility",
                    uri: ""
                },
            },
            (error, data) => {
                console.info('featureAbilityTest startAbility asyncCallback errCode : ' + error + " data: " + data)

            },
        );
    })

    /**
     * @tc.number: ACTS_StartAbility_0501
     * @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
     * @tc.desc: Pass the parameters, Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_StartAbility_0501', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            expect(data.event).assertEqual("ACTS_StartAbility_0501_CommonEvent");
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        commonEvent.createSubscriber(subscriberInfoActsStartAbility0501).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_StartAbility_0501=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        let result = featureAbility.startAbility(
            {
                want:
                {
                    action: "action.system.homeability",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options: {
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.startability",
                    abilityName: "com.example.startability.MainAbility",
                    uri: ""
                },
                parameters:
                {
                    mykey0: 1111,
                    mykey1: [1, 2, 3],
                    mykey2: "[1, 2, 3]",
                    mykey3: "xxxxxxxxxxxxxxxxxxxxxx",
                    mykey4: [1, 15],
                    mykey5: [false, true, false],
                    mykey6: ["aaaaaa", "bbbbb", "ccccccccccc"],
                    mykey7: true,
                },
            },
            (error, data) => {
                console.info('featureAbilityTest startAbility asyncCallback errCode : ' + error + " data: " + data)

            },
        );
    })

    /**
     * @tc.number: ACTS_StartAbility_0601
     * @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
     * @tc.desc: Passing null, Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_StartAbility_0601', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            expect(data.event).assertEqual("ACTS_StartAbility_0601_CommonEvent");
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }

        commonEvent.createSubscriber(subscriberInfoActsStartAbility0601).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_StartAbility_0601=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }

        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        let result = featureAbility.startAbility(
            {
                want:
                {
                    action: "",
                    entities: [""],
                    type: "",
                    options: {
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.startability",
                    abilityName: "com.example.startability.MainAbility",
                    uri: ""
                },
            },
            (error, data) => {
                console.info('featureAbilityTest startAbility asyncCallback errCode : ' + error + " data: " + data)

            },
        );
    })

    /**
     * @tc.number: ACTS_TerminateAbility_0200
     * @tc.name: TerminateAbility : Destroys ability
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_TerminateAbility_0200', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;
        let events = new Map();

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            events.set(data.event, 0);
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            if (events.size > 1) {
                expect(events.has("ACTS_TerminateAbility_0200_CommonEvent") &&
                    events.has("ACTS_TerminateAbility_0200_Return")).assertTrue();
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                done();
            } else {
                expect(events.has("ACTS_TerminateAbility_0200_CommonEvent") ||
                    events.has("ACTS_TerminateAbility_0200_Return")).assertTrue();
            }
        }

        commonEvent.createSubscriber(subscriberInfoTerminateAbilityTwo).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_TerminateAbility_0200=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }
        console.info('=====start ability=====');
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        let promise = featureAbility.startAbility(
            {
                want:
                {
                    action: "action.system.home",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    flags: 2,
                    deviceId: "",
                    bundleName: "com.example.terminateabilitytest",
                    abilityName: "com.example.terminateabilitytest.MainAbility",
                    uri: ""
                },
            }
        );
        expect(typeof (promise)).assertEqual("object");
    })

    // checkApplicationInfo
    function checkApplicationInfo(info) {
        console.info("getApplicationInfo : " + info)
        expect(typeof (info)).assertEqual("object");
        expect(typeof (info.name)).assertEqual("string");
        expect(typeof (info.description)).assertEqual("string");
        expect(typeof (info.descriptionId)).assertEqual("number");
        expect(typeof (info.systemApp)).assertEqual("boolean");
        expect(typeof (info.enabled)).assertEqual("boolean");
        expect(typeof (info.label)).assertEqual("string");
        expect(typeof (info.labelId)).assertEqual("string");
        expect(typeof (info.icon)).assertEqual("string");
        expect(typeof (info.iconId)).assertEqual("string");
        expect(typeof (info.process)).assertEqual("string");
        expect(typeof (info.supportedModes)).assertEqual("number");
        expect(Array.isArray(info.permissions)).assertEqual(true);
        expect(Array.isArray(info.moduleInfos)).assertEqual(true);

        expect(info.name).assertEqual("com.example.actsfeatureabilitytest");
        expect(info.description).assertEqual("");
        expect(info.systemApp).assertEqual(true);
        expect(info.enabled).assertEqual(true);
        expect(info.label).assertEqual("$string:TestAbility_label");
        expect(info.icon).assertEqual("$media:icon");
        expect(info.process).assertEqual("com.example.actsfeatureabilitytest");
        expect(info.supportedModes).assertEqual(0);
        expect(info.moduleInfos[0].moduleName).assertEqual("entry_test");
        console.info("getApplicationInfo : end")
    }

    /**
     * @tc.number: ACTS_GetApplicationInfo_0100
     * @tc.name: GetApplicationInfo : Obtains information about the current application.
     * @tc.desc: Check the return type of the interface (by Promise)
     */
    it('ACTS_GetApplicationInfo_0100', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext();
        await context.getApplicationInfo().then((data)=>{
            checkApplicationInfo(data);
            console.info("ACTS_GetApplicationInfo_0100  info :" + JSON.stringify(data))
            console.info('====> ACTS_GetApplicationInfo_0100 end=====>')
            done();
        }).catch((err)=>{
            console.info('====> ACTS_GetApplicationInfo_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        });
    })

    /**
     * @tc.number: ACTS_GetApplicationInfo_0200
     * @tc.name: GetApplicationInfo : Obtains information about the current application.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_GetApplicationInfo_0200', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext()
        context.getApplicationInfo(
            (err, data) => {
                if(err.code != 0){
                    console.info('====> ACTS_GetApplicationInfo_0200 err=====>' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                }else{
                    console.info('====> ACTS_GetApplicationInfo_0200 data=====>' + JSON.stringify(data))
                    checkApplicationInfo(data);
                    done()
                }
            }
        );
        await sleep(1000)
    })

    // checkProcessInfo
    function checkProcessInfo(info) {
        console.info("checkProcessInfo ProcessInfo: " + info);
        expect(typeof (info)).assertEqual("object");
        expect(typeof (info.processName)).assertEqual("string");
        expect(typeof (info.pid)).assertEqual("number");
        expect(info.processName).assertEqual("com.example.actsfeatureabilitytest");
    }

    /**
     * @tc.number: ACTS_GetProcessInfo_0100
     * @tc.name: GetProcessInfo : Called when getting the ProcessInfo
     * @tc.desc: Check the return type of the interface (by promise)
     */
    it('ACTS_GetProcessInfo_0100', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext()
        await context.getProcessInfo().then((data)=>{
            checkProcessInfo(data);
            console.info("ACTS_GetProcessInfo_0100  info :" + JSON.stringify(data))
            console.info('====> ACTS_GetProcessInfo_0100 end=====>')
            done();
        }).catch((err)=>{
            console.info('====> ACTS_GetProcessInfo_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        });
    })

    /**
     * @tc.number: ACTS_GetProcessInfo_0200
     * @tc.name: GetProcessInfo : Called when getting the ProcessInfo
     * @tc.desc: Check the return type of the interface (by AsyncCallback)
     */
    it('ACTS_GetProcessInfo_0200', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext()
        context.getProcessInfo(
            (err, data) => {
                if(err.code != 0){
                    console.info('====> ACTS_GetProcessInfo_0200 err=====>' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                }else{
                    console.info('====> ACTS_GetProcessInfo_0200 data=====>' + JSON.stringify(data))
                    checkProcessInfo(data);
                    done()
                }
            }
        );
        await sleep(1000)
    })

    // checkElementName
    function checkElementName(info) {
        console.info("getElementName : " + info);
        expect(typeof (info)).assertEqual("object");
        expect(typeof (info.deviceId)).assertEqual("string");
        expect(typeof (info.bundleName)).assertEqual("string");
        expect(typeof (info.abilityName)).assertEqual("string");
        expect(typeof (info.uri)).assertEqual("string");
        expect(typeof (info.shortName)).assertEqual("string");

        expect(info.deviceId).assertEqual("");
        expect(info.bundleName).assertEqual("com.example.actsfeatureabilitytest");
        expect(info.abilityName).assertEqual("com.example.actsfeatureabilitytest.TestAbility");
        expect(info.uri).assertEqual("");
        expect(info.shortName).assertEqual("");
        console.info("getElementName : end");
    }

    /**
     * @tc.number: ACTS_GetElementName_0100
     * @tc.name: GetElementName : Obtains the ohos.bundle.ElementName object of the current ability.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_GetElementName_0100', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext()
        await context.getElementName().then((data)=>{
            checkElementName(data);
            console.info("ACTS_GetElementName_0100  info :" + JSON.stringify(data))
            console.info('====> ACTS_GetElementName_0100 end=====>')
            done()
        }).catch((err)=>{
            console.info('====> ACTS_GetElementName_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        });
    })

    /**
    * @tc.number: ACTS_GetElementName_0200
    * @tc.name: GetElementName : Obtains the ohos.bundle.ElementName object of the current ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetElementName_0200', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext()
        context.getElementName(
            (err, data) => {
                if(err.code != 0){
                    console.info('====> ACTS_GetProcessInfo_0200 err=====>' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                }else{
                    console.info('====> ACTS_GetProcessInfo_0200 data=====>' + JSON.stringify(data))
                    checkElementName(data);
                    done()
                }
            }
        );
        await sleep(1000)
    })

    function checkAppType(info) {
        console.info("AppType : " + info);
        expect(typeof (info)).assertEqual("string");
        expect(info).assertEqual("system");
    }

    /**
     * @tc.number: ACTS_GetAppType_0100
     * @tc.name: GetAppType : Obtains the type of this application.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_GetAppType_0100', Level.LEVEL0, async function (done) {
        await featureAbility.getContext().getAppType().then((data)=>{
            console.info("ACTS_GetAppType_0100 getAppType info :" + JSON.stringify(data))
            checkAppType(data);
            console.info('====> ACTS_GetAppType_0100 end=====>')
            done()
        }).catch((err)=>{
            console.info('====> ACTS_GetAppType_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        });
    })

    /**
     * @tc.number: ACTS_GetAppType_0200
     * @tc.name: GetAppType : Obtains the type of this application.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_GetAppType_0200', Level.LEVEL0, async function (done) {
        featureAbility.getContext().getAppType((err, data) => {
            if(err.code != 0){
                console.info("ACTS_GetAppType_0200 getAppType callback err :" + JSON.stringify(err))
                expect().assertFail()
                done()
            }else{
                console.info("ACTS_GetAppType_0200 getAppType callback data :" + JSON.stringify(data))
                checkAppType(data)
                done()
                }
        });
        await sleep(1000)
    })

    // checkAbilityInfo
    function checkAbilityInfo(data) {
        console.info("checkAbilityInfo start  " + JSON.stringify(data));

        expect(typeof (data)).assertEqual("object");
        expect(typeof (data.bundleName)).assertEqual("string");
        expect(typeof (data.name)).assertEqual("string");
        expect(typeof (data.label)).assertEqual("string");
        expect(typeof (data.description)).assertEqual("string");
        expect(typeof (data.icon)).assertEqual("string");
        expect(typeof (data.labelId)).assertEqual("number");
        expect(typeof (data.descriptionId)).assertEqual("number");
        expect(typeof (data.iconId)).assertEqual("number");
        expect(typeof (data.moduleName)).assertEqual("string");
        expect(typeof (data.process)).assertEqual("string");
        expect(typeof (data.targetAbility)).assertEqual("string");
        expect(typeof (data.backgroundModes)).assertEqual("number");
        expect(typeof (data.isVisible)).assertEqual("boolean");
        expect(typeof (data.formEnabled)).assertEqual("boolean");
        expect(typeof (data.type)).assertEqual("number");
        expect(typeof (data.subType)).assertEqual("number");
        expect(typeof (data.orientation)).assertEqual("number");
        expect(typeof (data.launchMode)).assertEqual("number");
        expect(Array.isArray(data.permissions)).assertEqual(true);
        expect(Array.isArray(data.deviceTypes)).assertEqual(true);
        expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
        expect(typeof (data.readPermission)).assertEqual("string");
        expect(typeof (data.writePermission)).assertEqual("string");
        expect(typeof (data.applicationInfo)).assertEqual("object");
        expect(typeof (data.formEntity)).assertEqual("number");
        expect(typeof (data.minFormHeight)).assertEqual("number");
        expect(typeof (data.defaultFormHeight)).assertEqual("number");
        expect(typeof (data.minFormWidth)).assertEqual("number");
        expect(typeof (data.defaultFormWidth)).assertEqual("number");
        expect(typeof (data.uri)).assertEqual("string");


        expect(data.bundleName).assertEqual("com.example.actsfeatureabilitytest");
        expect(data.name).assertEqual("com.example.actsfeatureabilitytest.TestAbility");
        expect(data.label).assertEqual("$string:TestAbility_label");
        expect(data.description).assertEqual("$string:TestAbility_desc");
        expect(data.icon).assertEqual("$media:icon");

        expect(data.moduleName).assertEqual("entry_test");
        expect(data.process).assertEqual("com.example.actsfeatureabilitytest");
        expect(data.targetAbility).assertEqual("");
        expect(data.backgroundModes).assertEqual(0);
        expect(data.isVisible).assertEqual(true);
        expect(data.formEnabled).assertEqual(false);
        expect(data.type).assertEqual(1);
        expect(data.subType).assertEqual(0);
        expect(data.orientation).assertEqual(0);
        expect(data.launchMode).assertEqual(0);

        expect(data.permissions[0]).assertEqual("ohos.permission.ACCELEROMETER");
        expect(data.deviceTypes.length).assertEqual(0);
        expect(data.deviceCapabilities[0]).assertEqual("SystemCapability.Ability.AbilityBase");

        expect(data.readPermission).assertEqual("");
        expect(data.writePermission).assertEqual("");
        expect(data.formEntity).assertEqual(0);
        expect(data.minFormHeight).assertEqual(0);
        expect(data.defaultFormHeight).assertEqual(0);
        expect(data.minFormWidth).assertEqual(0);
        expect(data.defaultFormWidth).assertEqual(0);
        console.info("checkAbilityInfo end  " + data);
    }

    /**
     * @tc.number: ACTS_GetAbilityInfo_0100
     * @tc.name: GetAbilityInfo : Obtains the HapModuleInfo object of the application.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_GetAbilityInfo_0100', Level.LEVEL0, async function (done) {
        await featureAbility.getContext().getAbilityInfo().then((data)=>{
            checkAbilityInfo(data);
            console.info('====> ACTS_GetAbilityInfo_0100 data=====>' + JSON.stringify(data))
            done()
        }).catch((err)=>{
            console.info('====> ACTS_GetAbilityInfo_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        });
    })

    /**
     * @tc.number: ACTS_GetAbilityInfo_0200
     * @tc.name: GetAbilityInfo : Obtains the HapModuleInfo object of the application.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_GetAbilityInfo_0200', Level.LEVEL0, async function (done) {
        featureAbility.getContext().getAbilityInfo(
            (err, data) => {
                if(err.code != 0){
                    expect().assertFail()
                    done()
                }else{
                    console.info('====> ACTS_GetAbilityInfo_0200 =====>' + JSON.stringify(data))
                    checkAbilityInfo(data);
                    done()
                }
            }
        );
        await sleep(1000)
    })

    // checkHapModuleInfo
    function checkHapModuleInfo(data) {
        console.info("checkHapModuleInfo start  " + JSON.stringify(data));
        expect(typeof (data)).assertEqual("object");
        expect(typeof (data.name)).assertEqual("string");
        expect(typeof (data.description)).assertEqual("string");
        expect(typeof (data.descriptionId)).assertEqual("number");
        expect(typeof (data.icon)).assertEqual("string");
        expect(typeof (data.label)).assertEqual("string");
        expect(typeof (data.labelId)).assertEqual("number");
        expect(typeof (data.iconId)).assertEqual("number");
        expect(typeof (data.backgroundImg)).assertEqual("string");
        expect(typeof (data.supportedModes)).assertEqual("number");
        expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
        expect(Array.isArray(data.deviceTypes)).assertEqual(true);
        expect(Array.isArray(data.abilityInfo)).assertEqual(true);
        expect(typeof (data.moduleName)).assertEqual("string");
        expect(typeof (data.mainAbilityName)).assertEqual("string");
        expect(typeof (data.installationFree)).assertEqual("boolean");
        expect(data.name).assertEqual("com.example.actsfeatureabilitytest.entry_test");
        expect(data.description).assertEqual("descriptionTest");
        expect(data.descriptionId).assertEqual(0);
        expect(data.icon).assertEqual("$media:icon");
        expect(data.label).assertEqual("$string:TestAbility_label");
        expect(data.labelId).assertEqual(33554433);
        expect(data.iconId).assertEqual(33554435);
        expect(data.backgroundImg).assertEqual("");
        expect(data.supportedModes).assertEqual(0);
        expect(data.reqCapabilities[0]).assertEqual("reqCapabilitiesTest1");
        expect(data.reqCapabilities[1]).assertEqual("reqCapabilitiesTest2");
        expect(data.deviceTypes.length).assertEqual(0);
        expect(data.moduleName).assertEqual("entry_test")
        expect(data.mainAbilityName).assertEqual("com.example.actsfeatureabilitytest.TestAbility");
        expect(data.installationFree).assertEqual(false);
        console.info("checkHapModuleInfo end  " + data);
    }

    /**
     * @tc.number: ACTS_GetHapModuleInfo_0100
     * @tc.name: GetHapModuleInfo : Obtains the HapModuleInfo object of the application.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_GetHapModuleInfo_0100', Level.LEVEL0, async function (done) {
        await featureAbility.getContext().getHapModuleInfo().then((data)=>{
            checkHapModuleInfo(data);
            console.info('====> ACTS_GetHapModuleInfo_0100 data=====>' + JSON.stringify(data))
            done();
        }).catch((err)=>{
            console.info('====> ACTS_GetHapModuleInfo_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        });

    })

    /**
    * @tc.number: ACTS_GetHapModuleInfo_0200
    * @tc.name: GetHapModuleInfo : Obtains the HapModuleInfo object of the application.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetHapModuleInfo_0200', Level.LEVEL0, async function (done) {
        let tempInfo
        featureAbility.getContext().getHapModuleInfo(
            (err, data) => {
                if(err.code != 0){
                    expect().assertFail()
                    done()
                }else{
                    console.info('====> ACTS_GetHapModuleInfo_0200 =====>' + JSON.stringify(tempInfo))
                    tempInfo = data
                    checkHapModuleInfo(tempInfo);
                    done()
                }
            }
        );
        await sleep(1000)
    })

    // checkProcessName
    function checkProcessName(info) {
        console.info("checkProcessName processName : " + info);
        expect(typeof (info)).assertEqual("string");
        expect(info).assertEqual("com.example.actsfeatureabilitytest");
    }

    /**
     * @tc.number: ACTS_GetProcessName_0100
     * @tc.name: GetProcessName : Obtains the name of the current process.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_GetProcessName_0100', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext();
        await context.getProcessName().then((data)=>{
            console.info('====> ACTS_GetProcessName_0100 data=====>' + JSON.stringify(data))
            checkProcessName(data);
            done()
        }).catch((err)=>{
            console.info('====> ACTS_GetProcessName_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done();
        });
    })

    /**
     * @tc.number: ACTS_GetProcessName_0200
     * @tc.name: GetProcessName : Obtains the name of the current process.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_GetProcessName_0200', Level.LEVEL0, async function (done) {
        let tempInfo
        let context = featureAbility.getContext();
        context.getProcessName(
            (err, data) => {
                if(err.code!= 0){
                    expect().assertFail()
                    done()
                }else{
                    tempInfo = data
                    checkProcessName(tempInfo);
                    console.info('====> ACTS_GetProcessName_0200 =====>' + JSON.stringify(tempInfo))
                    done()
                }
            }
        );
        await sleep(1000)
    })

    /**
     * @tc.number: ACTS_GetCallingBundle_0100
     * @tc.name: GetCallingBundle : Obtains the bundle name of the ability that called the current ability.
     * @tc.desc: Check the return type of the interface (by AsyncCallback)
     */
     it('ACTS_GetCallingBundle_0100', Level.LEVEL0, async function (done) {
        let Subscriber;
        let id;
        let events = new Map();

        function SubscribeCallBack(err, data) {
            clearTimeout(id);
            events.set(data.event, 0)
            console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
            if (events.size == 1) {
                expect(events.has("ACTS_GetCallingBundle_0100_CommonEvent") ||
                    events.has("com.example.actsfeatureabilitytest.promise") ||
                    events.has("com.example.actsfeatureabilitytest.callback")).assertTrue();
            } else if (events.size == 2) {
                expect(events.has("com.example.actsfeatureabilitytest.promise") ||
                    events.has("com.example.actsfeatureabilitytest.callback")).assertTrue();
            } else if (events.size == 3) {
                expect(events.has("ACTS_GetCallingBundle_0100_CommonEvent") &&
                    events.has("com.example.actsfeatureabilitytest.promise") &&
                    events.has("com.example.actsfeatureabilitytest.callback")).assertTrue();
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                done();
            }
        }

        commonEvent.createSubscriber(subscriberInfoActsGetCallingBundle0100).then(async (data) => {
            console.debug("====>Create Subscriber====>");
            Subscriber = data;
            await commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })

        function UnSubscribeCallback() {
            console.debug("====>UnSubscribe CallBack====>");
            done();
        }

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_GetCallingBundle_0100=====timeout======');
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
            done();
        }
        id = setTimeout(timeout, START_ABILITY_TIMEOUT);
        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.getcallingbundlepromisetest",
                    abilityName: "com.example.getcallingbundlepromisetest.MainAbility",
                },
            }
        );
    })

    // checkGetOrCreateLocalDir
    function checkGetOrCreateLocalDir(info) {
        console.info("checkGetOrCreateLocalDir root dir : " + info);
        expect(info).assertEqual("/data/storage/el2/base/haps/entry_test");
    }

    // @tc.number: ACTS_GetOrCreateLocalDir_0100
    // @tc.name: GetProcessName : Obtains the name of the current process.
    // @tc.desc: Check the return value of the interface (by promise)
    it('ACTS_GetOrCreateLocalDir_0100', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext();
        await context.getOrCreateLocalDir().then((data)=>{
            checkGetOrCreateLocalDir(data);
            console.info('====> ACTS_GetOrCreateLocalDir_0100 data=====>' + JSON.stringify(data))
            done();
        }).catch((err)=>{
            console.info('====> ACTS_GetOrCreateLocalDir_0100 err=====>' + JSON.stringify(err))
            expect().assertFail()
            done()
        })
    })

    // @tc.number: ACTS_GetOrCreateLocalDir_0200
    // @tc.name: GetProcessName : Obtains the name of the current process.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetOrCreateLocalDir_0200', Level.LEVEL0, async function (done) {
        let context = featureAbility.getContext();
        context.getOrCreateLocalDir(
            (err, data) => {
                if(err.code != 0){
                    console.info('====> ACTS_GetOrCreateLocalDir_0200 err=====>' + JSON.stringify(err))
                    expect().assertFail()
                    done()
                }else{
                    console.info('====> ACTS_GetOrCreateLocalDir_0200 data=====>' + JSON.stringify(data))
                    checkGetOrCreateLocalDir(data);
                    done()
                }
         });
         await sleep(1000)
    })

    /*
     * @tc.number  ACTS_StartAbility_0700
     * @tc.name    Configures the wrong abilityname validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_0700", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_0700-------------------");
        try{
            let Want = {
                deviceId: '',
                bundleName: "com.example.startability",
                abilityName: "com.example.startability.MainAbilityXXXXX",
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_0700 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data));
                if(err.code != 0){
                    expect(err.code).assertEqual(1);
                    done();
                }else{
                   expect().assertFail()
                   done()
                }
            });
        }catch(error){
            console.info("ACTS_StartAbility_0700 : error = " + error);
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_0800
     * @tc.name    Misconfigured bundlename validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_0800", Level.LEVEL0, async function(done){
        console.info("------------------logMessage startAbilityTest_0300-------------------");
        try{
            let Want = {
                deviceId: '',
                bundleName: "com.example.startabilityxxxxx",
                abilityName: "com.example.startability.MainAbility",
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_0800 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data));
                if(err.code != 0){
                    expect(err.code).assertEqual(1);
                    done();
                }else{
                   expect().assertFail()
                   done()
                }
            });
        }catch(error){
            console.info("ACTS_StartAbility_0800 : error = " + error);
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_0900
     * @tc.name    Misconfigured deviceid validation
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_0900", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_0900-------------------");
        try{
            let Want = {
                deviceId: "43026cb4ca40ce10101834d72731dc8509be1906d30e8d42e86886d2791e82xx",
                bundleName: "com.example.startability",
                abilityName: "com.example.startability.MainAbility",
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_0900 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data) + "err.code: " + err.code);
                if(err.code != 0){
                    expect(err.code != 0).assertTrue();
                    done();
                }else{
                   expect().assertFail()
                   done()
                }
            });
        }catch(error){
            console.info("ACTS_StartAbility_0900 : error = " + error);
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_1100
     * @tc.name    Verify the ability of implicitly starting through action without configuring action
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1100", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1100-------------------");
        try{
            let Want = {
                action: "action.sysxxxtem.homexxxx"
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_1100 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data));
                if(err.code != 0){
                    expect(err.code).assertEqual(1);
                    done();
                }else{
                   expect().assertFail()
                   done()
                }
            });
        }catch(error){
            console.info("ACTS_StartAbility_1100 : error = " + error);
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_1200
     * @tc.name    Verify that the ability without configured entities is started through action and entities
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1200", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1200-------------------");
        try{
            let Want = {
                action: "action.system.home",
                entities: ["entity.system.homexxxxxxxxx"]
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_1200 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data));
                if(err.code != 0){
                    expect(err.code).assertEqual(1);
                    done();
                }else{
                   expect().assertFail()
                   done()
                }
            });
        }catch(error){
            console.info("ACTS_StartAbility_1200 : error = " + error);
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_1300
     * @tc.name    Start ability through action and entities. Entities is configured as an empty array
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1300", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1300-------------------");
        try{
            let Subscriber;
            let id;

            function SubscribeCallBack(err, data) {
                clearTimeout(id);
                expect(data.event).assertEqual("ACTS_StartAbility_1300_CommonEvent");
                console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }

            commonEvent.createSubscriber(subscriberInfoStartAbilityThirteen).then(async (data) => {
                console.debug("====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
            })

            function UnSubscribeCallback() {
                console.debug("====>UnSubscribe CallBack====>");
                done();
            }

            function timeout() {
                expect().assertFail();
                console.debug('ACTS_StartAbility_1300=====timeout======');
                commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
                done();
            }

            id = setTimeout(timeout, START_ABILITY_TIMEOUT);
            let Want = {
                action: "action.system.homeability",
                entities: []
            }
            let StartAbilityParameter = {
                want:Want
            }

            featureAbility.startAbility(StartAbilityParameter,(err,data)=>{
                console.info('ACTS_StartAbility_1300 asyncCallback errCode : ' + JSON.stringify(err) 
                + " data: " + JSON.stringify(data));
                if(err.code != 0){
                    expect().assertFail()
                    done()
                }
            });
        }catch(error){
            console.info("ACTS_StartAbility_1300 : error = " + error);
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_1600
     * @tc.name    Startability input parameter want is {}
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1600", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1600-------------------");
        let Want = {}
        let StartAbilityParameter = {
            want:Want
        }

        let promise = featureAbility.startAbility(StartAbilityParameter);
        if (promise) {
            promise.then((data) => {
                console.info('ACTS_StartAbility_1600 errCode : ' + " data: " + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err)=>{
                expect(err.code).assertEqual(1);
                done();
            });
        } else {
            expect().assertFail()
            done();
        }
    });

    /*
     * @tc.number  ACTS_StartAbility_1700
     * @tc.name    The startability input parameter is not configured with want
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1700", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1700-------------------");
        let StartAbilityParameter = {}
        let promise = featureAbility.startAbility(StartAbilityParameter)
        if (promise) {
            promise.then((data) => {
                console.info('ACTS_StartAbility_1700  data: '  + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err)=>{
                expect(err.code).assertEqual(202);
                done();
            });
        } else {
            expect().assertFail()
            done();
        } 
    });

    /*
     * @tc.number  ACTS_StartAbility_1800
     * @tc.name    The startability input parameter is undefined
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("ACTS_StartAbility_1800", Level.LEVEL0, async function(done){
        console.info("------------------logMessage ACTS_StartAbility_1800-------------------");
        let promise = featureAbility.startAbility(undefined);
        if (promise) {
            promise.then((data) => {
                console.info('ACTS_StartAbility_1800 asyncCallback data: ' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err)=>{
                expect(err.code).assertEqual(202);
                done();
            });
        } else {
            expect().assertFail()
            done();
        }
    });
})
}
