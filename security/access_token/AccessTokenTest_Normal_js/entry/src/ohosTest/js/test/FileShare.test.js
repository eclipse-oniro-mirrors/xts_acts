/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import fileShare from '@ohos.fileshare';
import bundleManager from '@ohos.bundle.bundleManager'

let tokenID;
export default function FileShareJsTest() {
    describe("FileShareJsTest", function () {
        beforeAll(async function (done) {
            let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
            console.info('FileShareJsTest bundleFlags is: ' + bundleFlags);
            try {
                bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
                    console.info('FileShareJsTest data is: ' + JSON.stringify(data));
                    tokenID = data.appInfo.accessTokenId;
                    console.info('FileShareJsTest tokenID is: ' + data.appInfo.accessTokenId);
                    done();
                }).catch((err) => {
                    console.info('FileShareJsTest getBundleInfoForSelf err is: ' + err.code);
                })
            } catch (error) {
                console.info('FileShareJsTest getBundleInfoForSelf error is: ' + error.code)
            }
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll called')
        })

        beforeEach(function () {

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('beforeEach called')
        })

        afterEach(function () {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('afterEach caled')
        })

        /*
         * @tc.number:SUB_Security_FileShare_CheckPath_Abnormal_0100
         * @tc.name: Test fileShare checkPath abnormal scene
         * @tc.desc: Test checkPathPermission no system 202
         * @tc.level: Level1
         * @tc.size: Medium
         * @tc.type: Function
         */
        it("SUB_Security_FileShare_CheckPath_Abnormal_0100", 0, function (done) {
            console.info('----------------------SUB_Security_FileShare_CheckPath_Abnormal_0100---------------------------');
            try {
                let PathPolicyInfo = {
                    path: "/storage/Users/currentUser/Documents/1.txt",
                    operationMode: fileShare.OperationMode.READ_MODE,
                }

                let policies = [PathPolicyInfo];
                let policyType = fileShare.PolicyType.PERSISTENT_TYPE;
                fileShare.checkPathPermission(tokenID, policies, policyType).then((result) => {
                    for (let x of result) {
                        console.info('SUB_Security_FileShare_CheckPath_Abnormal_0100 permission result is', x);
                    }
                })
            }
            catch (error) {
                console.error('SUB_Security_FileShare_CheckPath_Abnormal_0100 error' + error.message + 'error.code' + error.code);
                expect(error.code).assertEqual(202);
                done();
            }
        })

        /*
         * @tc.number:SUB_Security_FileShare_CheckPath_Const_0100
         * @tc.name: Test fileShare checkPath TEMPORARY_TYPE Const Attribute
         * @tc.desc: Test fileShare PolicyType const TEMPORARY_TYPE
         * @tc.level: Level1
         * @tc.size: Medium
         * @tc.type: Function
         */
        it("SUB_Security_FileShare_CheckPath_Const_0100", 0, function (done) {
            console.info('----------------------SUB_Security_FileShare_CheckPath_Const_0100---------------------------');
            let value = fileShare.PolicyType.TEMPORARY_TYPE;
            console.info('SUB_Security_FileShare_CheckPath_Const_0100 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })

        /*
         * @tc.number:SUB_Security_FileShare_CheckPath_Const_0200
         * @tc.name: Test fileShare checkPath PERSISTENT_TYPE Const Attribute
         * @tc.desc: Test fileShare PolicyType const PERSISTENT_TYPE
         * @tc.level: Level1
         * @tc.size: Medium
         * @tc.type: Function
         */
        it("SUB_Security_FileShare_CheckPath_Const_0200", 0, function (done) {
            console.info('----------------------SUB_Security_FileShare_CheckPath_Const_0200---------------------------');
            let value = fileShare.PolicyType.PERSISTENT_TYPE;
            console.info('SUB_Security_FileShare_CheckPath_Const_0200 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })
    })
}