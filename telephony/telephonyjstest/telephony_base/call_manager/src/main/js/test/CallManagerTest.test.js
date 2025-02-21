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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
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
         * @tc.number  Telephony_CallManager_getCallState_Async_0100
         * @tc.name    To get the idle call status, call getCallState() to get the current call status.
         *             call.CALL_STATE_IDLE is returned
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_getCallState_Async_0100', 0, async function (done) {
            call.getCallState((err, data) => {
                if (err) {
                    console.log(`Telephony_CallManager_getCallState_Async_0100 : err = ${err.message}`);
                    expect().assertFail();
                    done();
                    return;
                }
                expect(data === call.CALL_STATE_IDLE).assertTrue();
                console.log(`Telephony_CallManager_getCallState_Async_0100 finish data = ${data}`);
                done();
            });
        });

        /**
         * @tc.number  Telephony_CallManager_getCallState_Promise_0100
         * @tc.name    To get the idle call status, call getCallState() to get the current call status.
         *             call.CALL_STATE_IDLE is returned
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_getCallState_Promise_0100', 0, async function (done) {
            try {
                var data = await call.getCallState();
                expect(data === call.CALL_STATE_IDLE).assertTrue();
                console.log(`Telephony_CallManager_getCallState_Promise_0100 finish data = ${data}`);
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_getCallState_Promise_0100 : err = ${err.message}`);
                expect().assertFail();
                done();

            }
        });


        /**
         * @tc.number  Telephony_CallManager_hasCall_Async_0400
         * @tc.name    When idle, hasCall() is called to confirm that there is no current call,returning false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_hasCall_Async_0400', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_hasCall_Promise_0400
         * @tc.name    When idle, hasCall() is called to confirm that there is no current call, returning false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_hasCall_Promise_0400', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0100
         * @tc.name    PhoneNumber is 100000000000. Call formatPhoneNumber() to format the number.
         *             The return value is 10 000 000 0000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0200
         * @tc.name    If phoneNumber is 10 000 000 0000, options: CN, call formatPhoneNumber() to format the number,
         *             and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0300
         * @tc.name    If phoneNumber is (010)00000000, options: CN, call formatPhoneNumber() to format the number,
         *             return the value 010 0000 0000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0400
         * @tc.name    PhoneNumber is 010-0000-0000, options: CN, call formatPhoneNumber() to format the number,
         *             return 010 0000 0000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0400', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0500
         * @tc.name    PhoneNumber 666666999999 is not supported in the current country. Options: CN. Call
         *             formatPhoneNumber() to format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0500', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0600
         * @tc.name    If phoneNumber is 2000000000, type non-existent options: abCDFG. Call
         *             formatPhoneNumber() to format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0600', 0, async function (done) {
            call.formatPhoneNumber('2000000000', {
                countryCode: 'abcdefg'
            }, (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumber_Async_0600 finish err = ${err.message}`);
                    done();
                    return;
                }
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumber_Async_0600 fail');
                done();
            });
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Async_0700
         * @tc.name    If phoneNumber is 2000000000, options: ', call formatPhoneNumber() to
         *             format the number and catch err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Async_0700', 0, async function (done) {
            call.formatPhoneNumber('2000000000', {
                countryCode: ''
            }, (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumber_Async_0700 finish err = ${err.message}`);
                    done();
                    return;
                }
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumber_Async_0700 fail');
                done();
            });
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0100
         * @tc.name    PhoneNumber is 2000000. Call formatPhoneNumber() to format the number.
         *             The return value is 200 0000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0200
         * @tc.name    PhoneNumber is 010-100-0000, options: CN, call formatPhoneNumber() to format the number, err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0300
         * @tc.name    PhoneNumber: (010)00000000, options: CN, call formatPhoneNumber() to format the number,
         *             return the value 010 0000 0000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0400
         * @tc.name    If phoneNumber is 200-0000, options: CN, call formatPhoneNumber() to format the
         *             number and return 200 0000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0400', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0500
         * @tc.name    PhoneNumber 666666999999 is not supported in the current country. Options: CN. Call
         *             formatPhoneNumber() to format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0500', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0600
         * @tc.name    If phoneNumber is 20000000, enter non-existent options: abCDFG and call
         *             formatPhoneNumber() to format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0600', 0, async function (done) {
            try {
                await call.formatPhoneNumber('20000000', {
                    countryCode: 'abcdefg'
                });
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0600 fail');
                done();
                return;
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0600 finish err = ${err.message}`);
                done();
            }
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumber_Promise_0700
         * @tc.name    If phoneNumber is 20000000, options: , call formatPhoneNumber() to format the number and catch err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumber_Promise_0700', 0, async function (done) {
            try {
                var data = await call.formatPhoneNumber('20000000', {
                    countryCode: ''
                });
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumber_Promise_0700 fail');
                done();
                return;
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumber_Promise_0700 finish err = ${err.message}`);
                done();
            }
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0100
         * @tc.name    PhoneNumber is 010-0000-0000, options: CN, call formatPhoneNumberToE164() to format the number,
         *             and return +861000000000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0200
         * @tc.name    If phoneNumber is (010)00000000, options: CN, call formatPhoneNumberToE164() to format the number,
         *             return +861000000000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0300
         * @tc.name    If phoneNumber is 01000000000, options: CN, call formatPhoneNumberToE164() to format the number,
         *             and return +861000000000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0400
         * @tc.name    PhoneNumber 666666999999 is not supported in the current country. Options: CN. Call
         *             formatPhoneNumberToE164() to format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0400', 0, async function (done) {
            call.formatPhoneNumberToE164('666666999999', 'CN', (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0400 finish err = ${err.message}`);
                    done();
                    return;
                }
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0400 fail');
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0500
         * @tc.name    If phoneNumber is 01000000000, type non-existent options: abCDFG. Call formatPhoneNumberToE164()
         *             to format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0500', 0, async function (done) {
            call.formatPhoneNumberToE164('01000000000', 'abcdfg', (err) => {
                if (err) {
                    console.log(`Telephony_CallManager_formatPhoneNumberToE164_Async_0500 finish err = ${err.message}`);
                    done();
                    return;
                }
                expect().assertFail();
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Async_0500 fail');
                done();
            });
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Async_0600
         * @tc.name    If phoneNumber is 01000000000, options: ', call formatPhoneNumberToE164() to
         *             format the number and catch err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Async_0600', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0100
         * @tc.name    PhoneNumber is 52300000000, options: CN, call formatPhoneNumberToE164() to format the number,
         *             return +8652300000000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0200
         * @tc.name    If phoneNumber is (523)00000000, options: CN, call formatPhoneNumberToE164() to format the number,
         *             return +8652300000000
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0300
         * @tc.name    PhoneNumber is 523-0000-0000, options: CN. Call formatPhoneNumberToE164() to format the number.
         *             +8652300000000 is returned
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0400
         * @tc.name    Currently, phoneNumber is 999999, options: CN. Call formatPhoneNumberToE164() to
         *             format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0400', 0, async function (done) {
            try {
                await call.formatPhoneNumberToE164('999999', 'CN');
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0400 fail');
                expect().assertFail();
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0400 finish err = ${err.message}`);
                done();

            }
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0500
         * @tc.name    PhoneNumber is 52300000000. Type non-existent options: abCDFG. Call formatPhoneNumberToE164() to
         *             format the number and capture err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0500', 0, async function (done) {
            try {
                await call.formatPhoneNumberToE164('52300000000', 'abcdefg');
                console.log('Telephony_CallManager_formatPhoneNumberToE164_Promise_0500 fail');
                expect().assertFail();
                done();
            } catch (err) {
                console.log(`Telephony_CallManager_formatPhoneNumberToE164_Promise_0500 finish err = ${err.message}`);
                done();

            }
        });

        /**
         * @tc.number  Telephony_CallManager_formatPhoneNumberToE164_Promise_0600
         * @tc.name    If phoneNumber is 52300000000, options: ', call formatPhoneNumberToE164()
         *             to format the number and catch err
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_formatPhoneNumberToE164_Promise_0600', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0100
         * @tc.name    PhoneNumber: 0+0+0, options is 1. Call isEmergencyPhoneNumber() to check whether it is an
         *             emergency number. The return value is false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0200
         * @tc.name    PhoneNumber: INVALID_NUMBER, options 1. Call isEmergencyPhoneNumber() to check whether it is an
         *             emergency number. The return value is false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0300
         * @tc.name    PhoneNumber: 000, options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency number
         *             The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0400
         * @tc.name    PhoneNumber: 112 with options 1. Call isEmergencyPhoneNumber() to verify whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0400', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0500
         * @tc.name    PhoneNumber: 911, options are 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0500', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0600
         * @tc.name    PhoneNumber: 08 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0600', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0700
         * @tc.name    PhoneNumber: 118, options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0700', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0800
         * @tc.name    PhoneNumber: 999 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0800', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_0900
         * @tc.name    PhoneNumber: 119. Call isEmergencyPhoneNumber() to determine whether it is an emergency number.
         *             The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_0900', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_1000
         * @tc.name    PhoneNumber: 110, isEmergencyPhoneNumber() is called back to determine whether it is an emergency
         *             number, returning true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1000', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Async_1300
         * @tc.name    PhoneNumber: 110, options -1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Async_1300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100
         * @tc.name    PhoneNumber: 0+0+0, options is 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200
         * @tc.name    PhoneNumber: INVALID_NUMBER, options 1. Call isEmergencyPhoneNumber() to check whether it is an
         *             emergency number. The return value is false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300
         * @tc.name    PhoneNumber: 000 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0300', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400
         * @tc.name    PhoneNumber: 112 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0400', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500
         * @tc.name    PhoneNumber: 911 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0500', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600
         * @tc.name    PhoneNumber: 08. If options are 1, call isEmergencyPhoneNumber() to check whether it is an
         *             emergency number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0600', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700
         * @tc.name    PhoneNumber: 118 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0700', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800
         * @tc.name    PhoneNumber: 999 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_0800', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100
         * @tc.name    PhoneNumber: 119 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1100', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200
         * @tc.name    PhoneNumber: 110 with options 1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is true
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1200', 0, async function (done) {
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
         * @tc.number  Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300
         * @tc.name    PhoneNumber: 120, options -1. Call isEmergencyPhoneNumber() to check whether it is an emergency
         *             number. The return value is false
         * @tc.desc    Function test
         */
        it('Telephony_CallManager_isEmergencyPhoneNumber_Promise_1300', 0, async function (done) {
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
