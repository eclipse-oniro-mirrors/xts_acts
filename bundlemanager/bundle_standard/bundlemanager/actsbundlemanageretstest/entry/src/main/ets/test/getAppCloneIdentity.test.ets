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

import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const BUNDLE_NAME1 = 'com.example.l3jsdemo';
const BUNDLE_NAME2 = 'com.open.harmony.packagemag';

export default function getAppCloneIdentity() {
    describe('ActsBmsgetAppCloneIdentityTest', function () {

        /**
        * @tc.number GetAppCloneIdentity_0100
        * @tc.name BUNDLE::getAppCloneIdentity_0100
        * @tc.desc Test GetAppCloneIdentity interfaces with other hap.
        */
        it('getAppCloneIdentity_0100', 0, async function (done) {
            let dataInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
            let data : void | bundleManager.AppCloneIdentity = await bundleManager.getAppCloneIdentity(dataInfo.appInfo.uid).catch(err => {
                console.info("getAppCloneIdentity fail:" + JSON.stringify(err));
                expect(err).assertFail();
            });
            expect(data.bundleName).assertEqual(dataInfo.appInfo.name);
            expect(data.appIndex).assertEqual(0);
            done();
        });

    });
}
