/**
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import netConnection from '@ohos.net.connection';
import call from '@ohos.telephony.call';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
export default function ActsBaseCallManagerTest() {


    let net = netConnection.createNetConnection()

    class RejectMessageOptions {
        constructor(str) {
            this.messageContent = str;
        }
    }

    describe('CallManagerTest', function () {
        const ERROR_CALLID_999 = 999;
        const GETMAIN_CALLID_ERRO = -1;
        const SLOT_0 = 0;
        const ERR_SLOT_ID = -1;
        const MORE_THAN_30_NUMBERS = '';
        const INVALID_NUMBER = '';
        const ACTIVATE_TRUE = true;
        const ACTIVATE_FALSE = false;
        const REJECT_MESSAGE_NUM = '1234567890123456789012345678901234567890';

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
                    console.log(`Telephony_CallManager_getCallState_Async_0100 : err = ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === call.CallState.CALL_STATE_IDLE).assertTrue();
                console.log(`Telephony_CallManager_getCallState_Async_0100 finish data = ${data}`);
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
            try {
                var data = await call.getCallState();
                expect(data === call.CallState.CALL_STATE_IDLE).assertTrue();
                console.log(`Telephony_CallManager_getCallState_Promise_0100 finish data = ${data}`);
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_getCallState_Promise_0100 : err = ${err.message}`);
                expect().assertFail();
                done();

            }
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
                expect(data === false).assertTrue();
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
                expect(data === false).assertTrue();
                console.log(`Telephony_CallManager_hasCall_Promise_0400 finish data = ${data}`);
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
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0200
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('10 000 000 0000', {
                countryCode: 'CN'
            }, (err, data) => {
                if (err) {
                    console.log("Telephony_CallManager_formatPhoneNumber_Async_0200 fail = ${err.message}" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '10 000 000 0000').assertTrue();
                console.log('Telephony_CallManager_formatPhoneNumber_Async_0200 finish' + JSON.stringify(data));
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0300
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('(010)00000000', {
                countryCode: 'CN'
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_formatPhoneNumber_Async_0300 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '010 0000 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Async_0300 finish data : ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0400
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('010-0000-0000', {
                countryCode: 'CN'
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_formatPhoneNumber_Async_0400 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '010 0000 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Async_0400 finish data : ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0500
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('666666999999', {
                countryCode: 'CN'
            }, (err, data) => {
                if (err) {
                    console.log("Telephony_CallManager_formatPhoneNumber_Async_0500 fail err =" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    return;
                }
                console.log('Telephony_CallManager_formatPhoneNumber_Async_0500 finish ' + JSON.stringify(data));
                expect(data === '666666999999').assertTrue();
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0600
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('2000000000', {
                countryCode: 'abcdefg'
            }, (err,data) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumber_Async_0600 fail err = ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_CallManager_formatPhoneNumber_Async_0600 success data = ${data}`);
                expect(data == '').assertTrue();
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Async_0700
         * @tc.number Telephony_CallManager_formatPhoneNumber_Async_0700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumber('2000000000', {
                countryCode: ''
            }, (err,data) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumber_Async_0700 finish err = ${err.message}`);
                    done();
                    return;
                }
                console.log('Telephony_CallManager_formatPhoneNumber_Async_0700 success');
                expect(data === '20 0000 0000').assertTrue();
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
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0200
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                await call.formatPhoneNumber('010-100-0000', {
                    countryCode: 'CN'
                });
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0200 finish');
                done();
            } catch (err) {
                console.log("Telephony_CallManager_formatPhoneNumber_Promise_0200 finish err = ${err}" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0300
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.formatPhoneNumber('(010)00000000', {
                    countryCode: 'CN'
                });
                expect(data === '010 0000 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0300 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0300 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0400
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.formatPhoneNumber('200-0000', {
                    countryCode: 'CN'
                });
                expect(data === '200 0000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0400 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0400 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0500
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                await call.formatPhoneNumber('666666999999', {
                    countryCode: 'CN'
                });
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0500 finish');
                done();
            } catch (err) {
                console.log("Telephony_CallManager_formatPhoneNumber_Promise_0500 finish err = ${err.message}" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0600
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                let data = await call.formatPhoneNumber('20000000', {
                    countryCode: 'abcdefg'
                });
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0600 success data =${data}`);
                expect(data == '').assertTrue();
                done();
                return;
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0600 fail err = ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumber_Promise_0700
         * @tc.number Telephony_CallManager_formatPhoneNumber_Promise_0700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.formatPhoneNumber('20000000', {
                    countryCode: ''
                });
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0700 success');
                expect(data === '2000 0000').assertTrue();
                done();
                return;
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0700 finish err = ${err.message}`);
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
            call.formatPhoneNumberToE164('010-0000-0000', 'CN', (err, data) => {
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
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Async_0200
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumberToE164('(010)00000000', 'CN', (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0200 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '+861000000000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0200 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Async_0300
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumberToE164('01000000000', 'CN', (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0300 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === '+861000000000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0300 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Async_0400
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumberToE164('666666999999', 'CN', (err,data) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0400 finish err = ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0400 success data = ${data}`);
                expect(data == '').assertTrue();
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Async_0500
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumberToE164('01000000000', 'abcdfg', (err,data) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0500 finish err = ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0500 success data = ${data}`);
                expect(data == '').assertTrue();
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Async_0600
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Async_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.formatPhoneNumberToE164('01000000000', '', (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0600 finish err = ${err.message}`);
                    done();
                    return;
                }
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0600 fail');
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
            try {
                var data = await call.formatPhoneNumberToE164('52300000000', 'CN');
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
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Promise_0200
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0200 running');
            try {
                var data = await call.formatPhoneNumberToE164('(523)00000000', 'CN');
                expect(data === '+8652300000000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0200 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0200 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Promise_0300
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.formatPhoneNumberToE164('523-0000-0000', 'CN');
                expect(data === '+8652300000000').assertTrue();
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0300 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0300 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Promise_0400
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                let data = await call.formatPhoneNumberToE164('999999', 'CN');
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0400 data= ${data}`);
                expect(data == '').assertTrue();
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0400 finish err = ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Promise_0500
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                let data = await call.formatPhoneNumberToE164('52300000000', 'abcdefg');
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0500 data= ${data}`);
                expect(data == '').assertTrue();
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0500 finish err = ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Telephony_CallManager_formatPhoneNumberToE164_Promise_0600
         * @tc.number Telephony_CallManager_formatPhoneNumberToE164_Promise_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                await call.formatPhoneNumberToE164('52300000000', '');
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0600 fail');
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0600 finish err = ${err.message}`);
                done();

            }
        });


        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0100
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('0+0+0', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0100 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === false).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0100 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0200
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let CASE_NAME = 'Telephony_CallManager_isEmergencyPhoneNumber_Async_0200';
            call.isEmergencyPhoneNumber(INVALID_NUMBER, {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log(CASE_NAME + ' fail' + JSON.stringify(err));
                    expect(err.code).assertEqual(8300001);
                    done();
                    return;
                }
                console.log(CASE_NAME +' finish data = '+ JSON.stringify(data));
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0300
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('000', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0300 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0300 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0400
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('112', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0400 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0400 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0500
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('911', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0500 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0500 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0600
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('08', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0600 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0600 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0700
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('118', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0700 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0700 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0800
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0800
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('999', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0800 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0800 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_0900
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_0900
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('119', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_0900 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_0900 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Async_1000
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Async_1000
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            call.isEmergencyPhoneNumber('110', {
                slotId: SLOT_0
            }, (err, data) => {
                if (err) {
                    console.log('Telephony_CallManager_isEmergencyPhoneNumber_Async_1000 fail');
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Async_1000 finish data = ${data}`);
                done();
            });
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
            call.isEmergencyPhoneNumber('110', {
                slotId: ERR_SLOT_ID
            }, (err) => {
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
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('0+0+0', {
                    slotId: SLOT_0
                });
                expect(data === false).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('INVALID_NUMBER', {
                    slotId: SLOT_0
                });
                expect(data === false).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('000', {
                    slotId: SLOT_0
                });
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('112', {
                    slotId: SLOT_0
                });
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('911', {
                    slotId: SLOT_0
                });
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('08', {
                    slotId: SLOT_0
                });
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('118', {
                    slotId: SLOT_0
                });
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('999', {
                    slotId: SLOT_0
                });
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('119');
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100 fail');
                expect().assertFail();
                done();

            }
        });

        /**
         * @tc.name   Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200
         * @tc.number Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                var data = await call.isEmergencyPhoneNumber('110');
                expect(data).assertTrue();
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200 finish data = ${data}`);
                done();
            } catch (err) {
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200 fail');
                expect().assertFail();
                done();

            }
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
            try {
                var data = await call.isEmergencyPhoneNumber('120', {
                    slotId: ERR_SLOT_ID
                });
                expect().assertFail();
                console.log('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300 fail ');
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300 finish err = ${err}`);
                done();
            }
        });
    });
}
