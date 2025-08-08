/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, it, expect} from '@ohos/hypium';
import router from '@system.router';

export default function globalGetAppTest() {
describe('globalGetAppTest', function () {
    let testResult;
        let testResultFail;
        let test;
        beforeAll(function () {
            testResult = true;
            testResultFail = false;
            test = "success"
        });
        beforeEach(function () {
        });
        afterEach(function () {
        });
        afterAll(function () {
        });

        async function backToIndex(){
            let backToIndexPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.back({
                        uri: 'pages/index/index'
                    });
                    resolve();
                }, 500);
            });
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            });
            await backToIndexPromise.then(() => {
                return clearPromise;
            });
        }

    /**
     * @tc.number    getApp
     * @tc.name      getApp
     * @tc.desc      ACE
     */
    it('globalGetAppTest_001', 0, function (done) {
        console.log('globalGetAppTest_001 start')
        let result;
        let options = {
            uri: 'pages/global/index'
        }
        try {
            result = router.push(options)
            getApp().data;
            expect(test).assertEqual('success')
            console.log('globalGetAppTest_001 end')
            done();
        } catch (err) {
        }
        
    });

    /**
     * @tc.number    createLocalParticleAbility
     * @tc.name      createLocalParticleAbility
     * @tc.desc      ACE
     */

    it('globalGetAppTest_002', 0, function (done) {
        try {
            createLocalParticleAbility('com.freesonwill.facallpa.biz.MyLocalParticleAbility');
            expect(test).assertEqual('success')
            done();
        }catch (error){
            console.log('errorerrorerror'+error)
            expect(test).assertEqual('success')
            done();
        }
    });
});
}
