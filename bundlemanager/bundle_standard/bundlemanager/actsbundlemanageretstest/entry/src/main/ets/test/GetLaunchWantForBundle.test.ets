/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import bundleMgr from '@ohos.bundle';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index';

const NAME1 = "com.example.third1";
const NAME2 = "com.example.l3jsdemo";
const NAME3 = "com.notexist.com";
const ABILITYNAME1 = "com.example.third1.MainAbility";
const ABILITYNAME2 = "com.example.l3jsdemo.MainAbility";

export default function getLaunchWantForBundle() {
    describe('GetLaunchWantForBundleTest', function () {

        /*
        * @tc.number: SUB_BMS_APPINFO_QUERY_0069
        * @tc.name: testGetLaunchWantForBundle.
        * @tc.desc: Test getLaunchWantForBundle api by promise and callback.
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 1
        */
        it('testGetLaunchWantForBundle', 0, async function (done) {
            await bundleMgr.getLaunchWantForBundle(NAME1).then(res => {
                expect(res.bundleName).assertEqual(NAME1);
                expect(res.abilityName).assertEqual(ABILITYNAME1);
                expect(res.deviceId).assertEqual('');
                expect(res.action).assertEqual('action.system.home');
                expect(res.entities[0]).assertEqual('entity.system.home');
            }).catch(err => {
                expect(err).assertFail();
            });
            bundleMgr.getLaunchWantForBundle(NAME1, (err, res) => {
                expect(err.code).assertEqual(0);
                expect(res.bundleName).assertEqual(NAME1);
                expect(res.abilityName).assertEqual(ABILITYNAME1);
                expect(res.deviceId).assertEqual('');
                expect(res.action).assertEqual('action.system.home');
                expect(res.entities[0]).assertEqual('entity.system.home');
                done();
            });
        });

        /*
        * @tc.number: SUB_BMS_APPINFO_QUERY_0012
        * @tc.name: testGetLaunchWantForBundleWithManyHaps.
        * @tc.desc: Test getLaunchWantForBundle api by promise and callback.
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 1
        */
        it('testGetLaunchWantForBundleWithManyHaps', 0, async function (done) {
            await bundleMgr.getLaunchWantForBundle(NAME2).then(res => {
                expect(res.bundleName).assertEqual(NAME2);
                expect(res.abilityName).assertEqual(ABILITYNAME2);
                expect(res.deviceId).assertEqual('');
                expect(res.action).assertEqual('action.system.home');
                expect(res.entities[0]).assertEqual('entity.system.home');
            }).catch(err => {
                expect(err).assertFail();
            });
            bundleMgr.getLaunchWantForBundle(NAME2, (err, res) => {
                expect(err.code).assertEqual(0);
                expect(res.bundleName).assertEqual(NAME2);
                expect(res.abilityName).assertEqual(ABILITYNAME2);
                expect(res.deviceId).assertEqual('');
                expect(res.action).assertEqual('action.system.home');
                expect(res.entities[0]).assertEqual('entity.system.home');
                done();
            });
        });
        /*
        * @tc.number: SUB_BMS_APPINFO_QUERY_0013
        * @tc.name: testGetLaunchWantForBundleWithNotExist.
        * @tc.desc: Test getLaunchWantForBundle api by promise and callback.
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 2
        */
        it('testGetLaunchWantForBundleWithNotExist', 0, async function (done) {
            await bundleMgr.getLaunchWantForBundle(NAME3).then(res => {
                expect().assertFail();
            }).catch(err => {
                expect(err.code).assertEqual(1);
            });
            bundleMgr.getLaunchWantForBundle(NAME3, (err, res) => {
                if (err) {
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                expect().assertFail();
                done();
            });
        });

        /*
        * @tc.number: SUB_BMS_APPINFO_QUERY_0014
        * @tc.name: testGetLaunchWantForBundleWithInvalidParam.
        * @tc.desc: Test getLaunchWantForBundle api by promise and callback.
        * @tc.size MediumTest
        * @tc.type Function
        * @tc.level Level 3
        */
        it('testGetLaunchWantForBundleWithInvalidParam', 0, async function (done) {
            await bundleMgr.getLaunchWantForBundle(null).then(res => {
                expect().assertFail();
            }).catch(err => {
                expect(err.code).assertEqual(1);
            });
            bundleMgr.getLaunchWantForBundle(null, (err, res) => {
                if (err) {
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                expect().assertFail();
                done();
            });
        });
    });
}
