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

import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'

const BUNDLE_NAME1 = 'com.example.l3jsdemo';
const BUNDLE_NAME2 = 'com.open.harmony.packagemag';

export default function getNameForUid() {
    describe('ActsBmsgetNameForUidTest', function () {

    /**
     * @tc.number getNameForUid_0100
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with other hap.
     */
    it('getNameForUid_0100', 0, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
        await bundle.getNameForUid(dataInfo.uid).then(data => {
            expect(data).assertEqual(BUNDLE_NAME1);
        }).catch(err => {
            console.info("getNameForUid fail:" + JSON.stringify(err));
            expect(err).assertFail();
        });
        bundle.getNameForUid(dataInfo.uid, (err, data) => {
            console.info("getNameForUid result:" + JSON.stringify(data));
            expect(data).assertEqual(BUNDLE_NAME1);
            expect(err).assertEqual(0);
            done();
        });
    });

    /**
     * @tc.number getNameForUid_0200
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with hap.
     */
    it('getNameForUid_0200', 0, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME2,bundle.BundleFlag.GET_BUNDLE_DEFAULT);
        await bundle.getNameForUid(dataInfo.uid).then(data => {
            expect(data).assertEqual(BUNDLE_NAME2);
        }).catch(err => {
            console.info("getNameForUid fail:" + JSON.stringify(err));
            expect(err).assertFail();
        });
        bundle.getNameForUid(dataInfo.uid, (err, data) => {
            console.info("getNameForUid result:" + JSON.stringify(data));
            expect(data).assertEqual(BUNDLE_NAME2);
            expect(err).assertEqual(0);
            done();
        });
    });

    /**
     * @tc.number getNameForUid_0300
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with notexist hap.
     */
    it('getNameForUid_0300', 0, async function (done) {
        await bundle.getNameForUid(123456).then(data => {
            expect(data).assertFail();
        }).catch(err => {
            console.info("getNameForUid fail:" + JSON.stringify(err));
            expect(err).assertEqual(1);
        });
        bundle.getNameForUid(123456, (err, data) => {
            console.info("getNameForUid result:" + JSON.stringify(data));
            expect(err).assertEqual(1);
            done()
        });
    });

    /**
     * @tc.number getNameForUid_0400
     * @tc.name BUNDLE::getBundleInfo
     * @tc.desc Test getBundleInfo interfaces with error param.
     */
    it('getNameForUid_0400', 0, async function (done) {
        await bundle.getNameForUid(undefined).then(data => {
            expect(data).assertFail();
        }).catch(err => {
            console.info("getNameForUid fail:" + JSON.stringify(err));
            expect(err).assertEqual(2);
        });
        bundle.getNameForUid(undefined, (err, data) => {
            console.info("getNameForUid result:" + JSON.stringify(data));
            expect(err).assertEqual(2);
            done()
        });
    });

    });
}