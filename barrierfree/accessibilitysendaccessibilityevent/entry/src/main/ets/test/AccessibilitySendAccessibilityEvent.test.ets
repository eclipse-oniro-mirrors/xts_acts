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
const triggerAction : accessibility.Action = 'accessibilityFocus';
const eventType : accessibility.EventType = 'accessibilityFocus';

export default function abilityTest() {
    describe('AccessibilitySendAccessibilityEvent', function () {

        beforeEach(async function (done) {
            console.info(`AccessibilitySendAccessibilityEvent: beforeEach starts`);
            done();
        })
    
        afterEach(async function (done) {
            console.info(`AccessibilitySendAccessibilityEvent: afterEach starts`);
            done();
        })
    
        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0100
        * @tc.desc    The parameter eventType input is accessibilityFocus, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
             */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0100');
            let eventType : accessibility.EventType = 'accessibilityFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0100  err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0200
        * @tc.desc    The parameter input eventType is accessibilityFocus, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0200');
            let eventType : accessibility.EventType = 'accessibilityFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0300
        * @tc.desc    The parameter eventType input is accessibilityFocusClear, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0300');
            let eventType : accessibility.EventType = 'accessibilityFocusClear';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0400
        * @tc.desc    The parameter input eventType is accessibilityFocusClear, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0400');
            let eventType : accessibility.EventType = 'accessibilityFocusClear';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0500
        * @tc.desc    The parameter eventType input is click, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0500');
            let eventType : accessibility.EventType = 'click';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0600
        * @tc.desc    The parameter input eventType is click, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0600');
            let eventType : accessibility.EventType = 'click';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0700
        * @tc.desc    The parameter eventType input is longClick, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0700');
            let eventType : accessibility.EventType = 'longClick';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0800
        * @tc.desc    The parameter input eventType is longClick, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0800');
            let eventType : accessibility.EventType = 'longClick';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0900
        * @tc.desc    The parameter eventType input is focus, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0900');
            let eventType : accessibility.EventType = 'focus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_0900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1000
        * @tc.desc    The parameter input eventType is focus, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1000');
            let eventType : accessibility.EventType = 'focus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1100
        * @tc.desc    The parameter eventType input is select, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1100');
            let eventType : accessibility.EventType = 'select';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1200
        * @tc.desc    The parameter input eventType is select, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1200');
            let eventType : accessibility.EventType = 'select';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1300
        * @tc.desc    The parameter eventType input is hoverEnter, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1300');
            let eventType : accessibility.EventType = 'hoverEnter';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1400
        * @tc.desc    The parameter input eventType is hoverEnter, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1400');
            let eventType : accessibility.EventType = 'hoverEnter';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1500
        * @tc.desc    The parameter eventType input is hoverExit, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1500');
            let eventType : accessibility.EventType = 'hoverExit';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1600
        * @tc.desc    The parameter input eventType is hoverExit, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1600');
            let eventType : accessibility.EventType = 'hoverExit';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1700
        * @tc.desc    The parameter eventType input is textUpdate, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1700');
            let eventType : accessibility.EventType = 'textUpdate';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1800
        * @tc.desc    The parameter input eventType is textUpdate, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1800');
            let eventType : accessibility.EventType = 'textUpdate';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1900
        * @tc.desc    The parameter eventType input is textSelectionUpdate, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1900');
            let eventType : accessibility.EventType = 'textSelectionUpdate';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_1900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2000
        * @tc.desc    The parameter input eventType is textSelectionUpdate, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2000');
            let eventType : accessibility.EventType = 'textSelectionUpdate';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2100
        * @tc.desc    The parameter eventType input is scroll, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2100');
            let eventType : accessibility.EventType = 'scroll';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2200
        * @tc.desc    The parameter input eventType is scroll, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2200');
            let eventType : accessibility.EventType = 'scroll';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2300
        * @tc.desc    The parameter windowUpdateType input is add, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2300');
            let windowUpdateType : accessibility.WindowUpdateType = 'add';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.windowUpdateType = windowUpdateType;


            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: endAccessibilityEvent_2300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2400
        * @tc.desc    The parameter windowUpdateType input is add, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2400');
            let windowUpdateType : accessibility.WindowUpdateType = 'add';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.windowUpdateType = windowUpdateType;

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2500
        * @tc.desc    The parameter input is bundleName, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2500');
            let localBundleName = 'com.ixaa.testfora11y';



            let event = new accessibility.EventInfo(eventType,localBundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2600
        * @tc.desc    The parameter input is bundleName, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2600');
            let localBundleName = 'com.ixaa.testfora11y';

            let event = new accessibility.EventInfo(eventType,localBundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2700
        * @tc.desc    The parameter componentType input is button, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2700');
            let componentType = 'button';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.componentType = componentType;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2800
        * @tc.desc    The parameter componentType input is button, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2800');
            let componentType = 'button';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.componentType = componentType;

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2900
        * @tc.desc    The parameter pageId input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2900');
            let pageId = 1;


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.pageId = pageId;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_2900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3000
        * @tc.desc    The parameter pageId input is 1, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3000');
            let pageId = 1;

            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.pageId = pageId;

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3100
        * @tc.desc    The parameter description input is 'test', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3100');
            let description = 'test';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.description = description;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3200
        * @tc.desc    The parameter description input is 'test', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3200');
            let description = 'test';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.description = description;

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3300
        * @tc.desc    The parameter triggerAction input is 'accessibilityFocus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3300');
            let triggerAction : accessibility.Action = 'accessibilityFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3400
        * @tc.desc    The parameter triggerAction input is 'accessibilityFocus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3400');
            let triggerAction : accessibility.Action = 'accessibilityFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3500
        * @tc.desc    The parameter triggerAction input is 'clearAccessibilityFocus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3500');
            let triggerAction : accessibility.Action = 'clearAccessibilityFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3600
        * @tc.desc    The parameter triggerAction input is 'clearAccessibilityFocus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3600');
            let triggerAction : accessibility.Action = 'clearAccessibilityFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3700
        * @tc.desc    The parameter triggerAction input is 'focus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3700');
            let triggerAction : accessibility.Action = 'focus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3800
        * @tc.desc    The parameter triggerAction input is 'focus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3800');
            let triggerAction : accessibility.Action = 'focus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3900
        * @tc.desc    The parameter triggerAction input is 'clearFocus', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3900');
            let triggerAction : accessibility.Action = 'clearFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_3900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4000
        * @tc.desc    The parameter triggerAction input is 'clearFocus', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4000');
            let triggerAction : accessibility.Action = 'clearFocus';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4100
        * @tc.desc    The parameter triggerAction input is 'clearSelection', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4100');
            let triggerAction : accessibility.Action = 'clearSelection';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4200
        * @tc.desc    The parameter triggerAction input is 'clearSelection', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4200');
            let triggerAction : accessibility.Action = 'clearSelection';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4300
        * @tc.desc    The parameter triggerAction input is 'click', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4300');
            let triggerAction : accessibility.Action = 'click';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4400
        * @tc.desc    The parameter triggerAction input is 'click', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4400');
            let triggerAction : accessibility.Action = 'click';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4500
        * @tc.desc    The parameter triggerAction input is 'longClick', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4500');
            let triggerAction : accessibility.Action = 'longClick';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4600
        * @tc.desc    The parameter triggerAction input is 'longClick', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4600');
            let triggerAction : accessibility.Action = 'longClick';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4700
        * @tc.desc    The parameter triggerAction input is 'cut', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4700');
            let triggerAction : accessibility.Action = 'cut';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4800
        * @tc.desc    The parameter triggerAction input is 'cut', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4800');
            let triggerAction : accessibility.Action = 'cut';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4900
        * @tc.desc    The parameter triggerAction input is 'copy', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4900');
            let triggerAction : accessibility.Action = 'copy';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_4900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5000
        * @tc.desc    The parameter triggerAction input is 'copy', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5000');
            let triggerAction : accessibility.Action = 'copy';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5100
        * @tc.desc    The parameter triggerAction input is 'paste', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5100');
            let triggerAction : accessibility.Action = 'paste';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5200
        * @tc.desc    The parameter triggerAction input is 'paste', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5200');
            let triggerAction : accessibility.Action = 'paste';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5300
        * @tc.desc    The parameter triggerAction input is 'select', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5300');
            let triggerAction : accessibility.Action = 'select';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5400
        * @tc.desc    The parameter triggerAction input is 'select', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5400');
            let triggerAction : accessibility.Action = 'select';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5500
        * @tc.desc    The parameter triggerAction input is 'setText', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5500');
            let triggerAction : accessibility.Action = 'setText';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5600
        * @tc.desc    The parameter triggerAction input is 'setText', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5600');
            let triggerAction : accessibility.Action = 'setText';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5700
        * @tc.desc    The parameter triggerAction input is 'delete', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5700');
            let triggerAction : accessibility.Action = 'delete';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5800
        * @tc.desc    The parameter triggerAction input is 'delete', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5800');
            let triggerAction : accessibility.Action = 'delete';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5900
        * @tc.desc    The parameter triggerAction input is 'scrollForward', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5900');
            let triggerAction : accessibility.Action = 'scrollForward';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_5900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6000
        * @tc.desc    The parameter triggerAction input is 'scrollForward', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6000');
            let triggerAction : accessibility.Action = 'scrollForward';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {           
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6100
        * @tc.desc    The parameter triggerAction input is 'scrollBackward', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6100');
            let triggerAction : accessibility.Action = 'scrollBackward';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6200
        * @tc.desc    The parameter triggerAction input is 'scrollBackward', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6200');
            let triggerAction : accessibility.Action = 'scrollBackward';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6300
        * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6300');
            let triggerAction : accessibility.Action = 'setSelection';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6400
        * @tc.desc    The parameter triggerAction input is 'setSelection', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6400');
            let triggerAction : accessibility.Action = 'setSelection';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6500
        * @tc.desc    The parameter textMoveUnit input is 'char', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6500');
            let textMoveUnit : accessibility.TextMoveUnit = 'char';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6600
        * @tc.desc    The parameter textMoveUnit input is 'char', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6600');
            let textMoveUnit : accessibility.TextMoveUnit = 'char';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6700
        * @tc.desc    The parameter textMoveUnit input is 'word', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6700');
            let textMoveUnit : accessibility.TextMoveUnit = 'word';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6800
        * @tc.desc    The parameter textMoveUnit input is 'word', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6800');
            let textMoveUnit : accessibility.TextMoveUnit = 'word';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6900
        * @tc.desc    The parameter textMoveUnit input is 'line', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6900');
            let textMoveUnit : accessibility.TextMoveUnit = 'line';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_6900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7000
        * @tc.desc    The parameter textMoveUnit input is 'line', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7000');
            let textMoveUnit : accessibility.TextMoveUnit = 'line';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7100
        * @tc.desc    The parameter textMoveUnit input is 'page', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7100');
            let textMoveUnit : accessibility.TextMoveUnit = 'page';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7200
        * @tc.desc    The parameter textMoveUnit input is 'page', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7200');
            let textMoveUnit : accessibility.TextMoveUnit = 'page';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7300
        * @tc.desc    The parameter textMoveUnit input is 'paragraph', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7300');
            let textMoveUnit : accessibility.TextMoveUnit = 'paragraph';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7400
        * @tc.desc    The parameter textMoveUnit input is 'paragraph', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7400');
            let textMoveUnit : accessibility.TextMoveUnit = 'paragraph';

            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.textMoveUnit = textMoveUnit;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7500
        * @tc.desc    The parameter contents input is '1', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7500');
            let contents = ['1'];



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.contents = contents;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7600
        * @tc.desc    The parameter contents input is '1', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7600');
            let contents = ['1'];


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.contents = contents;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7700
        * @tc.desc    The parameter lastContent input is 'paragraph', test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7700');
            let lastContent = '1';


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.lastContent = lastContent;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7700 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7700: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7800
        * @tc.desc    The parameter lastContent input is 'paragraph', test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7800');
            let lastContent = '1';



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.lastContent = lastContent;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7800 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7900
        * @tc.desc    The parameter beginIndex input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7900');
            let beginIndex = 1;


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.beginIndex = beginIndex;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7900 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_7900: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8000
        * @tc.desc    The parameter beginIndex input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8000');
            let beginIndex = 1;


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.beginIndex = beginIndex;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8000 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8100
        * @tc.desc    The parameter currentIndex input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8100');
            let currentIndex = 1;

            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.currentIndex = currentIndex;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8100 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8100: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8200
        * @tc.desc    The parameter currentIndex input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8200');
            let currentIndex = 1;


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.currentIndex = currentIndex;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8200 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8300
        * @tc.desc    The parameter endIndex input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8300');
            let endIndex = 1;


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.endIndex = endIndex;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8300 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8300: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8400
        * @tc.desc    The parameter endIndex input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8400');
            let endIndex = 1;



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.endIndex = endIndex;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8400 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8500
        * @tc.desc    The parameter itemCount input is 1, test the sendAccessibilityEvent()
        *             function. The result of sendAccessibilityEvent() should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8500');
            let itemCount = 1;



            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.itemCount = itemCount;

            accessibility.sendAccessibilityEvent(event, (err, data) => {
                console.log("AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8500 err : " + JSON.stringify(err));
                if (err && err.code != 0) {
                    console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8500: has error: ${err.code}`);
                    expect(null).assertFail();
                } else {
                    expect(data).assertEqual(undefined);
                }
                done();
            })
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8600
        * @tc.desc    The parameter itemCount input is 1,, test the sendAccessibilityEvent() function
        *             The function sendAccessibilityEvent in promise mode and result should be undefined.
        * @tc.size    SmallTest
        * @tc.type    User
        * @tc.level   Level 1
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8600');
            let itemCount = 1;


            let event = new accessibility.EventInfo(eventType,bundleName,triggerAction);
            event.itemCount = itemCount;

            accessibility.sendAccessibilityEvent(event).then((result) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8600 result ${result}`);
                expect(result).assertEqual(undefined);         
                done();
            }).catch((err) => {
                console.error(`AccessibilitySendAccessibilityEvent: SUB_BASIC_BARRIERFREE_API_AccessibilitySendAccessibilityEvent_8600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })
    })
}