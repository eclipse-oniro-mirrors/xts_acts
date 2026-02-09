/**
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import { afterEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
const AUTO_ACCEPT_NUMBER = '10010';
const CALL_STATUS_DIALING = 2;
const DEFAULT_SLOT_ID = 0;
const DIAL_TYPE_OTT = 2;
const MEDIA_TYPE_VOICE = 0;
const TEL_CONFERENCE_IDLE = 0;
const ERR_SLOT_ID = -1;
const CALL_NUMBER = '10086';
class EmergencyNumberOptions {
    slotId;

    constructor(num) {
        this.slotId = num;
    }
}

class NumberFormatOptions {
    countryCode;

    constructor(str) {
        this.countryCode = str;
    }
}

class CallAttributeOptions {
    accountNumber;
    speakerphoneOn;
    accountId;
    videoState;
    startTime;
    isEcc;
    callType;
    callId;
    callState;
    conferenceState;

    constructor(accountNumber, speakerphoneOn, accountId, videoState, startTime,
                isEcc, callType, callId, callState, conferenceState) {
        this.accountNumber = accountNumber;
        this.speakerphoneOn = speakerphoneOn;
        this.accountId = accountId;
        this.videoState = videoState;
        this.startTime = startTime;
        this.isEcc = isEcc;
        this.callType = callType;
        this.callId = callId;
        this.callState = callState;
        this.conferenceState = conferenceState;
    }
}

export default function CallManageImsCall() {
    describe('CallManageImsCall', function () {

        afterEach(async function () {
            try {
                const CURRENT_TIME = new Date().valueOf();
                const TEMP_CALL_ID = 10;
                const IS_ECC = true;
                const SPEAK_ON = true;
                let callAttributeOptions = new CallAttributeOptions(AUTO_ACCEPT_NUMBER, SPEAK_ON, DEFAULT_SLOT_ID,
                    MEDIA_TYPE_VOICE, CURRENT_TIME, IS_ECC, DIAL_TYPE_OTT, TEMP_CALL_ID, CALL_STATUS_DIALING,
                    TEL_CONFERENCE_IDLE);
                expect(callAttributeOptions.accountNumber === AUTO_ACCEPT_NUMBER).assertTrue();
                expect(callAttributeOptions.speakerphoneOn === SPEAK_ON).assertTrue();
                expect(callAttributeOptions.accountId === DEFAULT_SLOT_ID).assertTrue();
                expect(callAttributeOptions.videoState === MEDIA_TYPE_VOICE).assertTrue();
                expect(callAttributeOptions.startTime === CURRENT_TIME).assertTrue();
                expect(callAttributeOptions.isEcc === IS_ECC).assertTrue();
                expect(callAttributeOptions.callType === DIAL_TYPE_OTT).assertTrue();
                expect(callAttributeOptions.callId === TEMP_CALL_ID).assertTrue();
                expect(callAttributeOptions.callState === CALL_STATUS_DIALING).assertTrue();
                expect(callAttributeOptions.conferenceState === TEL_CONFERENCE_IDLE).assertTrue();
            } catch (error) {
                console.log(JSON.stringify(error));
            }
        });

        /**
         * @tc.name   Telephony_CallManager_getCallState_Async_0100
         * @tc.number Telephony_CallManager_getCallState_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_getCallState_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.getCallState((err, data) => {
                if (err) {
                    console.log("Telephony_CallManager_getCallState_Async_0100 : err =" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    return;
                }
                expect(call.CallState.CALL_STATE_UNKNOWN).assertEqual(-1);
                expect(call.CallState.CALL_STATE_IDLE).assertEqual(0);
                expect(call.CallState.CALL_STATE_RINGING).assertEqual(1);
                expect(call.CallState.CALL_STATE_OFFHOOK).assertEqual(2);
		expect(call.CallState.CALL_STATE_ANSWERED).assertEqual(3);
                console.log("Telephony_CallManager_getCallState_Async_0100 : data =" + JSON.stringify(data));
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_getCallState_Promise_0100
         * @tc.number Telephony_CallManager_getCallState_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_getCallState_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let promise = call.getCallState();
            promise.then(data => {
                console.log("Telephony_CallManager_getCallState_Promise_0100 : data =" + JSON.stringify(data));
                done();
            }).catch(err => {
                console.log("Telephony_CallManager_getCallState_Promise_0100 : err =" + JSON.stringify(err));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_hasCall_Async_0400
         * @tc.number Telephony_CallManager_hasCall_Async_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_hasCall_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.hasCall((err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_hasCall_Async_0400 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_CallManager_hasCall_Async_0400 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_hasCall_Promise_0400
         * @tc.number Telephony_CallManager_hasCall_Promise_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_hasCall_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.hasCall();
                if (data) {
                    expect(data == true).assertTrue();
                    console.info(`Telephony_CallManager_hasCall_Promise_0400 success, has call->${JSON.stringify(data)}`);
                } else {
                    expect(data == false).assertTrue();
                    console.info(`Telephony_CallManager_hasCall_Promise_0400 success, does not has call->${JSON.stringify(data)}`);
                }
                done();
            } catch (err) {
                console.log('Telephony_CallManager_hasCall_Promise_0400 fail');
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0100
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('100000000000', (err, data) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumber_Async_0100 err = ${err.message}`);
                    console.log('Telephony_CallManager_formatPhoneNumber_Async_0100 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '10 000 000 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Async_0100 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0100
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.formatPhoneNumber('2000000');
                expect(data === '200 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0100 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0100 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0200
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0200
         * @tc.desc   PhoneNumber is 13900000000, options: CN, test formatPhoneNumber() api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let numberFormatOptions = new NumberFormatOptions('CN');
            call.formatPhoneNumber('13900000000', numberFormatOptions, (err, data) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumber_Async_0200 err = ${err.message}`);
                    console.log('Telephony_CallManager_formatPhoneNumber_Async_0200 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '139 0000 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Async_0200 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0200
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0300
         * @tc.desc   PhoneNumber is 13900000000, options: US, test formatPhoneNumber() api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let numberFormatOptions = new NumberFormatOptions('US');
            try {
                var data = await call.formatPhoneNumber('13900000000', numberFormatOptions);
                expect(data === '1 390-000-0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0200 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0200 fail');
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Async_0100
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let numberFormatOptions = new NumberFormatOptions('CN');
            call.formatPhoneNumberToE164('010-0000-0000', numberFormatOptions.countryCode, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0100 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '+861000000000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0100 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Promise_0100
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let numberFormatOptions = new NumberFormatOptions('CN');
            try {
                var data = await call.formatPhoneNumberToE164('52300000000', numberFormatOptions.countryCode);
                expect(data === '+8652300000000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0100 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_1300
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_1300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let emergencyNumberOptions = new EmergencyNumberOptions(ERR_SLOT_ID);
            call.isEmergencyPhoneNumber('110', emergencyNumberOptions, (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_1300 finish err = ${err}`);
                    done();
                    return;
                }
                expect().assertFail();
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_1300 fail ');
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let emergencyNumberOptions = new EmergencyNumberOptions(ERR_SLOT_ID);
            try {
                await call.isEmergencyPhoneNumber('120', emergencyNumberOptions);
                expect().assertFail();
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300 fail ');
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300 finish err = ${err}`);
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_1400
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_1400
         * @tc.desc   PhoneNumber: 110, no options. Call isEmergencyPhoneNumber() api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('110', (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_1400 finish err = ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(true).assertTrue();
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_1400 PASSED ');
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_1500
         * @tc.desc   PhoneNumber: 120, no options. Call isEmergencyPhoneNumber() api by promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                await call.isEmergencyPhoneNumber('120');
                expect(true).assertTrue();
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400 PASSED ');
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1400 finish err = ${err}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_Dial_Async_0100
         * @tc.number Telephony_CallManager_Dial_Async_0100
         * @tc.desc   PhoneNumber: 10086, no options. Call dial api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_Dial_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let CaseName = 'Telephony_CallManager_Dial_Async_0100';
            try {
                call.dial("", (err, data) => {
                    expect(data == undefined).assertTrue();
                    console.info(CaseName + " case success" + JSON.stringify(data));
                    done();
                    return;
                });
            } catch (err) {
                console.info(CaseName + ' case error' + JSON.stringify(err));
                expect(err).assertFalse();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_Dial_Async_0200
         * @tc.number Telephony_CallManager_Dial_Async_0200
         * @tc.desc   PhoneNumber: 10086, has options. Call dial api by callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_Dial_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let CaseName = 'Telephony_CallManager_Dial_Async_0200';
            try {
                call.dial("", {
                    extras: false
                }, (err, data) => {
                    expect(data == undefined).assertTrue();
                    console.info(CaseName + " case success" + JSON.stringify(data));
                    done();
                    return;
                });
            } catch (err) {
                console.info(CaseName + ' case error' + JSON.stringify(err));
                expect(err).assertFalse();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_Dial_Promise_0100
         * @tc.number Telephony_CallManager_Dial_Promise_0100
         * @tc.desc   PhoneNumber: 10086, has options. Call dila api by permise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_Dial_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let CaseName = 'Telephony_CallManager_Dial_Promise_0100';
            call.dial(CALL_NUMBER, {
                extras: false
            }).then((data) => {
                console.info(CaseName + " case success" + JSON.stringify(data));
                expect(data == true).assertTrue();
                done();
                return;
            }).catch((err) => {
                console.info(CaseName + ' case error' + JSON.stringify(err));
                radio.isRadioOn(0, (err, data) => {
                    console.info(CaseName + ' err' + JSON.stringify(err) + ' data ' + JSON.stringify(data));
                    if (!err) {
                        expect().assertFail();
                    }
                });
                done();
            });
        });
    });
}
