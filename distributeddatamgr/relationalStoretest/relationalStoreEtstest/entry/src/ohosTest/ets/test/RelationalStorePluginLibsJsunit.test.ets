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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common'

let context: common.UIAbilityContext;

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]";

let storeConfig: data_relationalStore.StoreConfig = {
    name: "PluginLibsTest.db",
    securityLevel: data_relationalStore.SecurityLevel.S1,
    pluginLibs: []
}

var rdbStore = undefined;

export default function rdbStorePluginLibsTest() {
describe('rdbStorePluginLibsTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll');
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach');
    })

    afterEach(async function () {
        console.info(TAG + 'afterEach');
        rdbStore = null;
        await data_relationalStore.deleteRdbStore(context, "PluginLibsTest.db");
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll');
        console.log(TAG + "*************  Unit Test End  *************");
    })

    /**
     * @tc.name   testPluginLibs0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0100
     * @tc.desc   Test pluginLibs are empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0001 start *************");
        try {
            storeConfig.pluginLibs = [ "", "" ];
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
        } catch (e) {
            console.log("getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect().assertFail();
        }
        console.log(TAG + "*************  testPluginLibs0001 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0200
     * @tc.desc   Test pluginLib is current path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0002 start *************");
        try {
            storeConfig.pluginLibs = [ "./" ];
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect().assertFail();
        } catch (e) {
            console.log("getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect(14800021).assertEqual(e.code);
        }
        console.log(TAG + "*************  testPluginLibs0002 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0300
     * @tc.desc   Test pluginLib is no exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0003 start *************");
        try {
            storeConfig.pluginLibs = [ "/data/errPath/err.so" ];
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect().assertFail();
        } catch (e) {
            console.log("getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect(14800010).assertEqual(e.code);
        }
        console.log(TAG + "*************  testPluginLibs0003 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0400
     * @tc.desc   Test pluginLib as other app path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0004 start *************");
        try {
            storeConfig.pluginLibs = [ "/data/app/el1/bundle/public/" ];
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect().assertFail();
        } catch (e) {
            console.log("getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect(14800010).assertEqual(e.code);
        }
        console.log(TAG + "*************  testPluginLibs0004 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0500
     * @tc.desc   Test pluginLib as current app dir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0005 start *************");
        try {
            let path = await context.filesDir;
            console.log("testPluginLibs0005 path: " + path );
            storeConfig.pluginLibs = [ String(path) ];
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect().assertFail();
        } catch (e) {
            console.log("testPluginLibs0005 getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect(14800021).assertEqual(e.code);
        }
        console.log(TAG + "*************  testPluginLibs0005 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0600
     * @tc.desc   Test plugin libs count exceeds 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0006 start *************");
        try {
            let path = new Array(17).fill("").map((_, index) => `dir${index + 1}`);
            storeConfig.pluginLibs = path;
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect().assertFail();
        } catch (e) {
            console.log("getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect(14800000).assertEqual(e.code);
        }
        console.log(TAG + "*************  testPluginLibs0006 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0700
     * @tc.desc   Test plugin libs count exceeds 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0007 start *************");
        try {
            storeConfig.pluginLibs = null;
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect(rdbStore != null).assertTrue();
        } catch (e) {
            console.log("testPluginLibs0007 getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect().assertFail();
        }
        console.log(TAG + "*************  testPluginLibs0007 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0800
     * @tc.desc   Test plugin libs count exceeds 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0008 start *************");
        try {
            storeConfig.pluginLibs = undefined;
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect(rdbStore != null).assertTrue();
        } catch (e) {
            console.log("testPluginLibs0008 getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect().assertFail();
        }
        console.log(TAG + "*************  testPluginLibs0008 end  *************");
    })

    /**
     * @tc.name   testPluginLibs0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_0900
     * @tc.desc   Test plugin libs count exceeds 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function () {
        console.log(TAG + "************* testPluginLibs0008 start *************");
        try {
            rdbStore = await data_relationalStore.getRdbStore(context, storeConfig);
            expect(rdbStore != null).assertTrue();
        } catch (e) {
            console.log("testPluginLibs0009 getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect().assertFail();
        }
        console.log(TAG + "*************  testPluginLibs0009 end  *************");
    })
    /**
     * @tc.name   testPluginLibs0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_1000
     * @tc.desc   Test pluginLib as current app dir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
        console.log(TAG + "************* testPluginLibs0010 start *************");
        try {
            let path = await context.filesDir;
            console.log(TAG+"testPluginLibs0005 path: " + path );
            storeConfig.pluginLibs = [ String(path) ];
            data_relationalStore.getRdbStore(context, storeConfig,async(err,rdbstore)=>{
                if(err){
                    console.log(TAG+"testPluginLibs0010 getRdbStore err: failed, err: code=" + err.code + " message=" + err.message);
                    expect(err.code == 14800021).assertTrue();
                    done()
                }
                else{
                    expect().assertFail();
                    done()
                }
            });
        } catch (e) {
            console.log(TAG+"getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect().assertFail();
            done()
        }
        console.log(TAG + "*************  testPluginLibs0010 end  *************");
    })
    /**
     * @tc.name   testPluginLibs0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PluginLibsEtsAPITest_1100
     * @tc.desc   Test pluginLib as current app dir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPluginLibs0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
        console.log(TAG + "************* testPluginLibs0011 start *************");
        try {
            let path = new Array(17).fill("").map((_, index) => `dir${index + 1}`);
            storeConfig.pluginLibs = path;
            data_relationalStore.getRdbStore(context, storeConfig,async(err,rdbstore)=>{
                if(err) {
                    console.log(TAG + "getRdbStore err: failed, err: code=" + err.code + " message=" + err.message);
                    expect(err.code == 14800000).assertTrue();
                    done()
                }else {
                    console.log(TAG +"getrdbstore success");
                    expect().assertFail();
                    done()
                }
            });
        } catch (e) {
            console.log(TAG+"getRdbStore err: failed, err: code=" + e.code + " message=" + e.message);
            expect().assertFail();
            done()
        }
        console.log(TAG + "*************  testPluginLibs0011 end  *************");
    })
})
}