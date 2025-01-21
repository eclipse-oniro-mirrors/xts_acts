// @ts-nocheck
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import resManager from '@ohos.resourceManager'
// @ts-ignore
import ndk from 'libresmgrndk.so'

export default function abilityTest() {
    describe('ActsAbilityTest', function () {
        it('assertContain',0, function () {
            console.info("it begin")
            let a = 'abc'
            let b = 'b'
            expect(a).assertContain(b)
            expect(a).assertEqual(a)
        })

        /* *
        * @tc.number  SUB_GLOBAL_RESMGR_NDK_0100
        * @tc.name    test ResourceManager NDK interface
        * @tc.desc    test ResourceManager NDK interface
        */
        it('getResourceManager_ndktest_0100', 0, async function (done) {
            resManager.getResourceManager().then(mgr => {
                expect(mgr !== null).assertTrue();
                ndk.testRawFile("test",mgr,(error,value) => {
                    if(error != null){
                        console.log("getResourceManager_ndktest_0100" + error);
                    } else{
                        console.log("getResourceManager_ndktest_0100" + value.length);
                        expect(value.length > 0).assertTrue();
                    }
                });
            })
            done();
        })
    })
}
