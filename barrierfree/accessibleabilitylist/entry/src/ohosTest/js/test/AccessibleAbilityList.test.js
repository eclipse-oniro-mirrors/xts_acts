/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

import accessibility from '@ohos.accessibility'
const abilityType = 'all';
const abilityState = 'install';
export default function AccessibleAbilityList() {
    describe('AccessibleAbilityList', function () {

        beforeAll(async function (done) {
            console.info(`AccessibleAbilityList: beforeAll starts`);
            done();
        })

        beforeEach(async function (done) {
            console.info(`AccessibleAbilityList: beforeEach starts`);
            done();
        })

        afterEach(async function (done) {
            console.info(`AccessibleAbilityList: afterEach starts`);
            done();
        })

        /******************************************************************************** */
        /* Cases SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100-0460 are for accessibility.getAbilityLists() API test   */
        /******************************************************************************** */

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100
        * @tc.desc    The parameters input are 'audible' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100');
            let abilityType = 'audible';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0100 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0200
        * @tc.desc    The parameters input are 'generic' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0200');
            let abilityType = 'generic';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0200 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0200 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0300
        * @tc.desc    The parameters input are 'haptic' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0300');
            let abilityType = 'haptic';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0300 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0400
        * @tc.desc    The parameters input are 'spoken' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0400');
            let abilityType = 'spoken';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0400 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0400 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0500
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0500
        * @tc.desc    The parameters input are 'visual' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0500');
            let abilityType = 'visual';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0500 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0600
        * @tc.desc    The parameters input are 'all' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0600');
            let abilityType = 'all';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0600 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0600 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0700
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0700
        * @tc.desc    The parameters input are '' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0700');
            let abilityType = '';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0700 has error: ${err.code}`);
                    expect(Array.isArray(data)).assertEqual(true);
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0700 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0800
        * @tc.desc    The parameters input are null and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0800');
            let abilityType = null;
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0800 has error: ${err.code}`);
                    expect(Array.isArray(data)).assertEqual(true);
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0800 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0900
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0900
        * @tc.desc    The parameters input are 'all' and 'enable', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0900');
            let abilityState = 'enable';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_0900 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1000
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1000
        * @tc.desc    The parameters input are 'all' and 'disable', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1000', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1000');
            let abilityState = 'disable';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1000 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1000 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1100
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1100
        * @tc.desc    The parameters input are 'all' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1100', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1100');
            let abilityState = 'install';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1100 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1200
        * @tc.desc    The parameters input are 'all' and '', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1200');
            let abilityState = '';
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1200 has error: ${err.code}`);
                    expect(Array.isArray(data)).assertEqual(true);
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1200 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1300
        * @tc.desc    The parameters input are 'all' and null, test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1300');
            let abilityState = null;
            accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1300 has error: ${err.code}`);
                    expect(Array.isArray(data)).assertEqual(true);
                    done();
                }
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1300 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1400
        * @tc.desc    The parameters input are 'audible' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1400');
            let abilityType = 'audible';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1400 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1500
       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1500
       * @tc.desc    The parameters input are 'generic' and 'install', test the getAbilityLists() function,
       *             and the output is the list of AccessibilityAbilityInfo
       * @tc.size    SmallTest
       * @tc.type    User
       */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1500', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1500');
            let abilityType = 'generic';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1500 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1500 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1600
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1600
        * @tc.desc    The parameters input are 'haptic' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1600', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1600');
            let abilityType = 'haptic';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1600 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1700
       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1700
       * @tc.desc    The parameters input are 'spoken' and 'install', test the getAbilityLists() function,
       *             and the output is the list of AccessibilityAbilityInfo
       * @tc.size    SmallTest
       * @tc.type    User
       */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1700', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1700');
            let abilityType = 'spoken';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1700 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1700 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1800
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1800
        * @tc.desc    The parameters input are 'visual' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1800', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1800');
            let abilityType = 'visual';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1800 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
       * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1900
       * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1900
       * @tc.desc    The parameters input are 'all' and 'install', test the getAbilityLists() function,
       *             and the output is the list of AccessibilityAbilityInfo
       * @tc.size    SmallTest
       * @tc.type    User
       */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1900', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1900');
            let abilityType = 'all';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1900 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_1900 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })


        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2200
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2200
        * @tc.desc    The parameters input are 'all' and 'enable', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2200', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2200');
            let abilityState = 'enable';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2200 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2300
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2300
        * @tc.desc    The parameters input are 'all' and 'disable', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2300', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2300');
            let abilityState = 'disable';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2300 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2300 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2400
        * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2400
        * @tc.desc    The parameters input are 'all' and 'install', test the getAbilityLists() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2400', 0, async function (done) {
            console.info('SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2400');
            let abilityState = 'install';
            accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
                console.info(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2400 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibleAbilityList: SUB_BASIC_BARRIERFREE_API_AccessibleAbilityList_2400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })
    })
}
