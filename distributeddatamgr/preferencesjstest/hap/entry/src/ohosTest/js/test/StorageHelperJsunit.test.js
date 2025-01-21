/*
* Copyright (c) 2021-2022 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import storage from '@ohos.data.storage'

const PATH = '/data/storage/el2/database/test_storage';
var mPref;

export default function storageHelperTest() {
    describe('storageHelperTest', function () {
        beforeAll(async function () {
            console.info('beforeAll')
            mPref = storage.getStorageSync(PATH);
        })

        afterAll(async function () {
            console.info('afterAll')
            storage.deleteStorageSync(PATH);
        })
        beforeEach(async function () {
          console.info('beforeEach')
        })

        console.info('afterEach')
        afterEach(async function () {
        })

        /**
         * @tc.name getStorageSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0500
         * @tc.desc getStorageSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetStorageHelper001', 0, function () {
            mPref = storage.getStorageSync(PATH);
            mPref.putSync('test', 2);
            mPref.flushSync();
            var value = mPref.getSync('test', 0);
            expect(value).assertEqual(2);
        })

        /**
         * @tc.name getStorage interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0700
         * @tc.desc getStorage interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetStorageHelper002', 0, async function (done) {
            const promise = storage.getStorage(PATH);
            await promise.then((pref) => {
                pref.putSync('test', 2);
                pref.flushSync();
                var value = mPref.getSync('test', 0);
                expect(value).assertEqual(2);
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        })

        /**
         * @tc.name getStorage callback interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0600
         * @tc.desc getStorage callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testGetStorageCallback0020', 0, async function (done) {
            storage.getStorage(PATH,(err,pref)=>{
                pref.putSync('test', 2);
                pref.flushSync();
                var value = mPref.getSync('test', 0);
                expect(value).assertEqual(2);
            });
            done();
        })

        /**
         * @tc.name removeStorageFromCacheSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0800
         * @tc.desc removeStorageFromCacheSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRemoveStorageFromCache001', 0, function () {
            let perf = storage.getStorageSync('/data/test_storage1');
            perf.putSync('test', 2);
            try {
                storage.removeStorageFromCacheSync('/data/test_storage1');
            } catch (e) {
                expect(null).assertFail();
            }
            var value = mPref.getSync('test', 0);
            expect(value).assertEqual(2);
        })

        /**
         * @tc.name removeStorageFromCache promise interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0900
         * @tc.desc removeStorageFromCache promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRemoveStorageFromCache002', 0, async function (done) {
            let perf = storage.getStorageSync('/data/test_storage2');
            perf = null;
            const promise = storage.removeStorageFromCache('/data/test_storage2');
            await promise.then((pref) => {
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        })

        /**
         * @tc.name removeStorageFromCache callback interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0400
         * @tc.desc removeStorageFromCache callback interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRemoveStorageFromCache004', 0, async function (done) {
            let perf = storage.getStorageSync('/data/test_storage2');
            perf = null;
            storage.removeStorageFromCache('/data/test_storage2',(err,pref)=>{
                expect(err == null).assertTrue();
            });
            done();
        })

        /**
         * @tc.name deleteStorageSync interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0100
         * @tc.desc deleteStorageSync interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testDeleteStorageHelper001', 0, function () {
            let perf = storage.getStorageSync('/data/test_storage3');
            try {
                storage.deleteStorageSync('/data/test_storage3');
            } catch (e) {
                expect(null).assertFail();
            }
            try {
                perf.putSync("int", 3);
            } catch (e) {
                expect(null).assertFail();
            }
        })

        /**
         * @tc.name deleteStorage interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0200
         * @tc.desc deleteStorage interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testDeleteStorageHelper002', 0, async function (done) {
            let perf = storage.getStorageSync('/data/test_storage4');
            perf = null;
            const promise = storage.deleteStorage('/data/test_storage4');
            await promise.then((pref) => {
            }).catch((err) => {
                expect(null).assertFail();
            });
            done();
        })

        /**
         * @tc.name deleteStorag callback interface test
         * @tc.number SUB_DistributedData_Preference_SDK_StorageSyncTest_0300
         * @tc.desc deleteStorage interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testDeleteStoragCallback0070', 0, async function (done) {
            let perf = storage.getStorageSync('/data/test_storage4');
            perf = null;
            storage.deleteStorage('/data/test_storage4',(err)=>{
                expect(err == null).assertTrue();
            });
            done();
        })
    })}
