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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import accessibility from '@ohos.accessibility'

const abilityType = 'all';
const abilityState = 'install';
const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

export default function abilityTest() {
    describe('AccessibilitySendAccessibilityEvent', function () {

        beforeEach(async function (done) {
            console.info(`AccessibilitySendAccessibilityEvent: beforeEach starts`);
            done();
        })
    
        afterEach(async function (done) {
            console.info(`AccessibilitySendAccessibilityEvent: afterEach starts`);
            setTimeout(done, 1000);
        })
    
        /*
        * @tc.number  SendAccessibilityEvent_0300
        * @tc.name    SendAccessibilityEvent_0300
        * @tc.desc    The parameter eventType input is accessibilityFocus, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0300', 0, async function (done) {
            console.info('SendAccessibilityEvent_0300');
            let eventType = 'accessibilityFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0300 SendAccessibilityEvent_null_0010 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0300 has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_0400
        * @tc.name    SendAccessibilityEvent_0400
        * @tc.desc    The parameter input eventType is accessibilityFocus, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0400', 0, async function (done) {
            console.info('SendAccessibilityEvent_0400');
            let eventType = 'accessibilityFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_0500
        * @tc.name    SendAccessibilityEvent_0500
        * @tc.desc    The parameter eventType input is accessibilityFocusClear, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0500', 0, async function (done) {
            console.info('SendAccessibilityEvent_0500');
            let eventType = 'accessibilityFocusClear';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_0600
        * @tc.name    SendAccessibilityEvent_0600
        * @tc.desc    The parameter input eventType is accessibilityFocusClear, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0600', 0, async function (done) {
            console.info('SendAccessibilityEvent_0600');
            let eventType = 'accessibilityFocusClear';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_0700
        * @tc.name    SendAccessibilityEvent_0700
        * @tc.desc    The parameter eventType input is click, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0700', 0, async function (done) {
            console.info('SendAccessibilityEvent_0700');
            let eventType = 'click';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_0800
        * @tc.name    SendAccessibilityEvent_0800
        * @tc.desc    The parameter input eventType is click, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0800', 0, async function (done) {
            console.info('SendAccessibilityEvent_0800');
            let eventType = 'click';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_0900
        * @tc.name    SendAccessibilityEvent_0900
        * @tc.desc    The parameter eventType input is longClick, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_0900', 0, async function (done) {
            console.info('SendAccessibilityEvent_0900');
            let eventType = 'longClick';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_0900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_1000
        * @tc.name    SendAccessibilityEvent_1000
        * @tc.desc    The parameter input eventType is longClick, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1000', 0, async function (done) {
            console.info('SendAccessibilityEvent_1000');
            let eventType = 'longClick';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_1100
        * @tc.name    SendAccessibilityEvent_1100
        * @tc.desc    The parameter eventType input is focus, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1100', 0, async function (done) {
            console.info('SendAccessibilityEvent_1100');
            let eventType = 'focus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_1200
        * @tc.name    SendAccessibilityEvent_1200
        * @tc.desc    The parameter input eventType is focus, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1200', 0, async function (done) {
            console.info('SendAccessibilityEvent_1200');
            let eventType = 'focus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_1300
        * @tc.name    SendAccessibilityEvent_1300
        * @tc.desc    The parameter eventType input is select, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1300', 0, async function (done) {
            console.info('SendAccessibilityEvent_1300');
            let eventType = 'select';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_1400
        * @tc.name    SendAccessibilityEvent_1400
        * @tc.desc    The parameter input eventType is select, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1400', 0, async function (done) {
            console.info('SendAccessibilityEvent_1400');
            let eventType = 'select';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_1500
        * @tc.name    SendAccessibilityEvent_1500
        * @tc.desc    The parameter eventType input is hoverEnter, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1500', 0, async function (done) {
            console.info('SendAccessibilityEvent_1500');
            let eventType = 'hoverEnter';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_1600
        * @tc.name    SendAccessibilityEvent_1600
        * @tc.desc    The parameter input eventType is hoverEnter, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1600', 0, async function (done) {
            console.info('SendAccessibilityEvent_1600');
            let eventType = 'hoverEnter';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_1700
        * @tc.name    SendAccessibilityEvent_1700
        * @tc.desc    The parameter eventType input is hoverExit, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1700', 0, async function (done) {
            console.info('SendAccessibilityEvent_1700');
            let eventType = 'hoverExit';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_1800
        * @tc.name    SendAccessibilityEvent_1800
        * @tc.desc    The parameter input eventType is hoverExit, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1800', 0, async function (done) {
            console.info('SendAccessibilityEvent_1800');
            let eventType = 'hoverExit';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_1900
        * @tc.name    SendAccessibilityEvent_1900
        * @tc.desc    The parameter eventType input is textUpdate, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_1900', 0, async function (done) {
            console.info('SendAccessibilityEvent_1900');
            let eventType = 'textUpdate';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_1900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_2000
        * @tc.name    SendAccessibilityEvent_2000
        * @tc.desc    The parameter input eventType is textUpdate, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2000', 0, async function (done) {
            console.info('SendAccessibilityEvent_2000');
            let eventType = 'textUpdate';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_2100
        * @tc.name    SendAccessibilityEvent_2100
        * @tc.desc    The parameter eventType input is textSelectionUpdate, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2100', 0, async function (done) {
            console.info('SendAccessibilityEvent_2100');
            let eventType = 'textSelectionUpdate';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_2200
        * @tc.name    SendAccessibilityEvent_2200
        * @tc.desc    The parameter input eventType is textSelectionUpdate, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2200', 0, async function (done) {
            console.info('SendAccessibilityEvent_2200');
            let eventType = 'textSelectionUpdate';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_2300
        * @tc.name    SendAccessibilityEvent_2300
        * @tc.desc    The parameter eventType input is scroll, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2300', 0, async function (done) {
            console.info('SendAccessibilityEvent_2300');
            let eventType = 'scroll';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_2400
        * @tc.name    SendAccessibilityEvent_2400
        * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2400', 0, async function (done) {
            console.info('SendAccessibilityEvent_2400');
            let eventType = 'scroll';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_2500
        * @tc.name    SendAccessibilityEvent_2500
        * @tc.desc    The parameter windowUpdateType input is add, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2500', 0, async function (done) {
            console.info('SendAccessibilityEvent_2500');
            let windowUpdateType = 'add';

            let jsonObj = {
                type : eventType,
                windowUpdateType : windowUpdateType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: endAccessibilityEvent_2500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_2600
        * @tc.name    SendAccessibilityEvent_2600
        * @tc.desc    The parameter windowUpdateType input is add, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2600', 0, async function (done) {
            console.info('SendAccessibilityEvent_2600');
            let windowUpdateType = 'add';

            let jsonObj = {
                type : eventType,
                windowUpdateType : windowUpdateType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_2700
        * @tc.name    SendAccessibilityEvent_2700
        * @tc.desc    The parameter input is bundleName, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2700', 0, async function (done) {
            console.info('SendAccessibilityEvent_2700');
            let localBundleName = 'com.ixaa.testfora11y';

            let jsonObj = {
                type : eventType,
                bundleName : localBundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_2800
        * @tc.name    SendAccessibilityEvent_2800
        * @tc.desc    The parameter input is bundleName, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2800', 0, async function (done) {
            console.info('SendAccessibilityEvent_2800');
            let localBundleName = 'com.ixaa.testfora11y';

            let jsonObj = {
                type : eventType,
                bundleName : localBundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_2900
        * @tc.name    SendAccessibilityEvent_2900
        * @tc.desc    The parameter componentType input is button, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_2900', 0, async function (done) {
            console.info('SendAccessibilityEvent_2900');
            let componentType = 'button';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                componentType : componentType,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_2900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_3000
        * @tc.name    SendAccessibilityEvent_3000
        * @tc.desc    The parameter componentType input is button, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3000', 0, async function (done) {
            console.info('SendAccessibilityEvent_3000');
            let componentType = 'button';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                componentType : componentType,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_3100
        * @tc.name    SendAccessibilityEvent_3100
        * @tc.desc    The parameter pageId input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3100', 0, async function (done) {
            console.info('SendAccessibilityEvent_3100');
            let pageId = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                pageId : pageId,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_3200
        * @tc.name    SendAccessibilityEvent_3200
        * @tc.desc    The parameter pageId input is 1, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3200', 0, async function (done) {
            console.info('SendAccessibilityEvent_3200');
            let pageId = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                pageId : pageId,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_3300
        * @tc.name    SendAccessibilityEvent_3300
        * @tc.desc    The parameter description input is 'test', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3300', 0, async function (done) {
            console.info('SendAccessibilityEvent_3300');
            let description = 'test';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                description : description,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_3400
        * @tc.name    SendAccessibilityEvent_3400
        * @tc.desc    The parameter description input is 'test', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3400', 0, async function (done) {
            console.info('SendAccessibilityEvent_3400');
            let description = 'test';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                description : description,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_3500
        * @tc.name    SendAccessibilityEvent_3500
        * @tc.desc    The parameter triggerAction input is 'accessibilityFocus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3500', 0, async function (done) {
            console.info('SendAccessibilityEvent_3500');
            let triggerAction = 'accessibilityFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_3600
        * @tc.name    SendAccessibilityEvent_3600
        * @tc.desc    The parameter triggerAction input is 'accessibilityFocus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3600', 0, async function (done) {
            console.info('SendAccessibilityEvent_3600');
            let triggerAction = 'accessibilityFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_3700
        * @tc.name    SendAccessibilityEvent_3700
        * @tc.desc    The parameter triggerAction input is 'clearAccessibilityFocus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3700', 0, async function (done) {
            console.info('SendAccessibilityEvent_3700');
            let triggerAction = 'clearAccessibilityFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_3800
        * @tc.name    SendAccessibilityEvent_3800
        * @tc.desc    The parameter triggerAction input is 'clearAccessibilityFocus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3800', 0, async function (done) {
            console.info('SendAccessibilityEvent_3800');
            let triggerAction = 'clearAccessibilityFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_3900
        * @tc.name    SendAccessibilityEvent_3900
        * @tc.desc    The parameter triggerAction input is 'focus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_3900', 0, async function (done) {
            console.info('SendAccessibilityEvent_3900');
            let triggerAction = 'focus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_3900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_4000
        * @tc.name    SendAccessibilityEvent_4000
        * @tc.desc    The parameter triggerAction input is 'focus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4000', 0, async function (done) {
            console.info('SendAccessibilityEvent_4000');
            let triggerAction = 'focus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_4100
        * @tc.name    SendAccessibilityEvent_4100
        * @tc.desc    The parameter triggerAction input is 'clearFocus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4100', 0, async function (done) {
            console.info('SendAccessibilityEvent_4100');
            let triggerAction = 'clearFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_4200
        * @tc.name    SendAccessibilityEvent_4200
        * @tc.desc    The parameter triggerAction input is 'clearFocus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4200', 0, async function (done) {
            console.info('SendAccessibilityEvent_4200');
            let triggerAction = 'clearFocus';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_4300
        * @tc.name    SendAccessibilityEvent_4300
        * @tc.desc    The parameter triggerAction input is 'clearSelection', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4300', 0, async function (done) {
            console.info('SendAccessibilityEvent_4300');
            let triggerAction = 'clearSelection';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_4400
        * @tc.name    SendAccessibilityEvent_4400
        * @tc.desc    The parameter triggerAction input is 'clearSelection', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4400', 0, async function (done) {
            console.info('SendAccessibilityEvent_4200');
            let triggerAction = 'clearSelection';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_4500
        * @tc.name    SendAccessibilityEvent_4500
        * @tc.desc    The parameter triggerAction input is 'click', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4500', 0, async function (done) {
            console.info('SendAccessibilityEvent_4500');
            let triggerAction = 'click';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_4600
        * @tc.name    SendAccessibilityEvent_4600
        * @tc.desc    The parameter triggerAction input is 'click', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4600', 0, async function (done) {
            console.info('SendAccessibilityEvent_4200');
            let triggerAction = 'click';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_4700
        * @tc.name    SendAccessibilityEvent_4700
        * @tc.desc    The parameter triggerAction input is 'longClick', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4700', 0, async function (done) {
            console.info('SendAccessibilityEvent_4700');
            let triggerAction = 'longClick';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_4800
        * @tc.name    SendAccessibilityEvent_4800
        * @tc.desc    The parameter triggerAction input is 'longClick', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4800', 0, async function (done) {
            console.info('SendAccessibilityEvent_4800');
            let triggerAction = 'longClick';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_4900
        * @tc.name    SendAccessibilityEvent_4900
        * @tc.desc    The parameter triggerAction input is 'cut', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_4900', 0, async function (done) {
            console.info('SendAccessibilityEvent_4900');
            let triggerAction = 'cut';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_4900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_5000
        * @tc.name    SendAccessibilityEvent_5000
        * @tc.desc    The parameter triggerAction input is 'cut', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5000', 0, async function (done) {
            console.info('SendAccessibilityEvent_5000');
            let triggerAction = 'cut';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_5100
        * @tc.name    SendAccessibilityEvent_5100
        * @tc.desc    The parameter triggerAction input is 'copy', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5100', 0, async function (done) {
            console.info('SendAccessibilityEvent_5100');
            let triggerAction = 'copy';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_5200
        * @tc.name    SendAccessibilityEvent_5200
        * @tc.desc    The parameter triggerAction input is 'copy', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5200', 0, async function (done) {
            console.info('SendAccessibilityEvent_5200');
            let triggerAction = 'copy';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_5300
        * @tc.name    SendAccessibilityEvent_5300
        * @tc.desc    The parameter triggerAction input is 'paste', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5300', 0, async function (done) {
            console.info('SendAccessibilityEvent_5300');
            let triggerAction = 'paste';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_5400
        * @tc.name    SendAccessibilityEvent_5400
        * @tc.desc    The parameter triggerAction input is 'paste', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5400', 0, async function (done) {
            console.info('SendAccessibilityEvent_5400');
            let triggerAction = 'paste';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_5500
        * @tc.name    SendAccessibilityEvent_5500
        * @tc.desc    The parameter triggerAction input is 'select', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5500', 0, async function (done) {
            console.info('SendAccessibilityEvent_5500');
            let triggerAction = 'select';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_5600
        * @tc.name    SendAccessibilityEvent_5600
        * @tc.desc    The parameter triggerAction input is 'select', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5600', 0, async function (done) {
            console.info('SendAccessibilityEvent_5600');
            let triggerAction = 'select';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_5700
        * @tc.name    SendAccessibilityEvent_5700
        * @tc.desc    The parameter triggerAction input is 'setText', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5700', 0, async function (done) {
            console.info('SendAccessibilityEvent_5700');
            let triggerAction = 'setText';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_5800
        * @tc.name    SendAccessibilityEvent_5800
        * @tc.desc    The parameter triggerAction input is 'setText', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5800', 0, async function (done) {
            console.info('SendAccessibilityEvent_5800');
            let triggerAction = 'setText';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_5900
        * @tc.name    SendAccessibilityEvent_5900
        * @tc.desc    The parameter triggerAction input is 'delete', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_5900', 0, async function (done) {
            console.info('SendAccessibilityEvent_5900');
            let triggerAction = 'delete';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_5900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_6000
        * @tc.name    SendAccessibilityEvent_6000
        * @tc.desc    The parameter triggerAction input is 'delete', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6000', 0, async function (done) {
            console.info('SendAccessibilityEvent_6000');
            let triggerAction = 'delete';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_6100
        * @tc.name    SendAccessibilityEvent_6100
        * @tc.desc    The parameter triggerAction input is 'scrollForward', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6100', 0, async function (done) {
            console.info('SendAccessibilityEvent_6100');
            let triggerAction = 'scrollForward';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_6200
        * @tc.name    SendAccessibilityEvent_6200
        * @tc.desc    The parameter triggerAction input is 'scrollForward', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6200', 0, async function (done) {
            console.info('SendAccessibilityEvent_6200');
            let triggerAction = 'scrollForward';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_6300
        * @tc.name    SendAccessibilityEvent_6300
        * @tc.desc    The parameter triggerAction input is 'scrollBackward', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6300', 0, async function (done) {
            console.info('SendAccessibilityEvent_6300');
            let triggerAction = 'scrollBackward';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_6400
        * @tc.name    SendAccessibilityEvent_6400
        * @tc.desc    The parameter triggerAction input is 'scrollBackward', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6400', 0, async function (done) {
            console.info('SendAccessibilityEvent_6400');
            let triggerAction = 'scrollBackward';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_6500
        * @tc.name    SendAccessibilityEvent_6500
        * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6500', 0, async function (done) {
            console.info('SendAccessibilityEvent_6500');
            let triggerAction = 'setSelection';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_6600
        * @tc.name    SendAccessibilityEvent_6600
        * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6600', 0, async function (done) {
            console.info('SendAccessibilityEvent_6600');
            let triggerAction = 'setSelection';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_6700
        * @tc.name    SendAccessibilityEvent_6700
        * @tc.desc    The parameter textMoveUnit input is 'char', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6700', 0, async function (done) {
            console.info('SendAccessibilityEvent_6700');
            let textMoveUnit = 'char';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_6800
        * @tc.name    SendAccessibilityEvent_6800
        * @tc.desc    The parameter textMoveUnit input is 'char', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6800', 0, async function (done) {
            console.info('SendAccessibilityEvent_6800');
            let textMoveUnit = 'char';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_6900
        * @tc.name    SendAccessibilityEvent_6900
        * @tc.desc    The parameter textMoveUnit input is 'word', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_6900', 0, async function (done) {
            console.info('SendAccessibilityEvent_6900');
            let textMoveUnit = 'word';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_6900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_7000
        * @tc.name    SendAccessibilityEvent_7000
        * @tc.desc    The parameter textMoveUnit input is 'word', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7000', 0, async function (done) {
            console.info('SendAccessibilityEvent_7000');
            let textMoveUnit = 'word';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_7100
        * @tc.name    SendAccessibilityEvent_7100
        * @tc.desc    The parameter textMoveUnit input is 'line', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7100', 0, async function (done) {
            console.info('SendAccessibilityEvent_7100');
            let textMoveUnit = 'line';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_7200
        * @tc.name    SendAccessibilityEvent_7200
        * @tc.desc    The parameter textMoveUnit input is 'line', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7200', 0, async function (done) {
            console.info('SendAccessibilityEvent_7200');
            let textMoveUnit = 'line';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_7300
        * @tc.name    SendAccessibilityEvent_7300
        * @tc.desc    The parameter textMoveUnit input is 'page', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7300', 0, async function (done) {
            console.info('SendAccessibilityEvent_7300');
            let textMoveUnit = 'page';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_7400
        * @tc.name    SendAccessibilityEvent_7400
        * @tc.desc    The parameter textMoveUnit input is 'page', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7400', 0, async function (done) {
            console.info('SendAccessibilityEvent_7400');
            let textMoveUnit = 'page';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_7500
        * @tc.name    SendAccessibilityEvent_7500
        * @tc.desc    The parameter textMoveUnit input is 'paragraph', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7500', 0, async function (done) {
            console.info('SendAccessibilityEvent_7500');
            let textMoveUnit = 'paragraph';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_7600
        * @tc.name    SendAccessibilityEvent_7600
        * @tc.desc    The parameter textMoveUnit input is 'paragraph', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7600', 0, async function (done) {
            console.info('SendAccessibilityEvent_7600');
            let textMoveUnit = 'paragraph';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                textMoveUnit : textMoveUnit,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_7700
        * @tc.name    SendAccessibilityEvent_7700
        * @tc.desc    The parameter contents input is '1', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7700', 0, async function (done) {
            console.info('SendAccessibilityEvent_7700');
            let contents = ['1'];

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                contents : contents,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_7800
        * @tc.name    SendAccessibilityEvent_7800
        * @tc.desc    The parameter contents input is '1', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7800', 0, async function (done) {
            console.info('SendAccessibilityEvent_7800');
            let contents = ['1'];

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                contents : contents,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_7900
        * @tc.name    SendAccessibilityEvent_7900
        * @tc.desc    The parameter lastContent input is 'paragraph', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_7900', 0, async function (done) {
            console.info('SendAccessibilityEvent_7900');
            let lastContent = '1';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                lastContent : lastContent,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_7900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_8000
        * @tc.name    SendAccessibilityEvent_8000
        * @tc.desc    The parameter lastContent input is 'paragraph', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8000', 0, async function (done) {
            console.info('SendAccessibilityEvent_8000');
            let lastContent = '1';

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                lastContent : lastContent,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_8100
        * @tc.name    SendAccessibilityEvent_8100
        * @tc.desc    The parameter beginIndex input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8100', 0, async function (done) {
            console.info('SendAccessibilityEvent_8100');
            let beginIndex = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                beginIndex : beginIndex,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_8200
        * @tc.name    SendAccessibilityEvent_8200
        * @tc.desc    The parameter beginIndex input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8200', 0, async function (done) {
            console.info('SendAccessibilityEvent_8200');
            let beginIndex = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                beginIndex : beginIndex,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_8300
        * @tc.name    SendAccessibilityEvent_8300
        * @tc.desc    The parameter currentIndex input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8300', 0, async function (done) {
            console.info('SendAccessibilityEvent_8300');
            let currentIndex = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                currentIndex : currentIndex,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_8400
        * @tc.name    SendAccessibilityEvent_8400
        * @tc.desc    The parameter currentIndex input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8400', 0, async function (done) {
            console.info('SendAccessibilityEvent_8400');
            let currentIndex = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                currentIndex : currentIndex,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_8500
        * @tc.name    SendAccessibilityEvent_8500
        * @tc.desc    The parameter endIndex input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8500', 0, async function (done) {
            console.info('SendAccessibilityEvent_8500');
            let endIndex = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                endIndex : endIndex,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_8600
        * @tc.name    SendAccessibilityEvent_8600
        * @tc.desc    The parameter endIndex input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8600', 0, async function (done) {
            console.info('SendAccessibilityEvent_8600');
            let endIndex = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                endIndex : endIndex,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SendAccessibilityEvent_8700
        * @tc.name    SendAccessibilityEvent_8700
        * @tc.desc    The parameter itemCount input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8700', 0, async function (done) {
            console.info('SendAccessibilityEvent_8700');
            let itemCount = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                itemCount : itemCount,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SendAccessibilityEvent_8800
        * @tc.name    SendAccessibilityEvent_8800
        * @tc.desc    The parameter itemCount input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SendAccessibilityEvent_8800', 0, async function (done) {
            console.info('SendAccessibilityEvent_8800');
            let itemCount = 1;

            let jsonObj = {
                type : eventType,
                bundleName : bundleName,
                triggerAction : triggerAction,
                itemCount : itemCount,
            }

            let event = new accessibility.EventInfo(jsonObj);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SendAccessibilityEvent_8800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })
    })
}