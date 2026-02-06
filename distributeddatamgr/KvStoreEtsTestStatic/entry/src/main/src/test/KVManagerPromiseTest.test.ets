/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import factory from '@ohos.data.distributedKVStore'
import dataShare from '@ohos.data.dataSharePredicates'
import common from '@ohos.app.ability.common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'storeId2';
let localDeviceId: string = '';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.DeviceKVStore | null = null;
let result: factory.KVStoreResultSet;

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function KVManagerPromiseTest(){
  describe('KVManagerPromiseTest', () => {

    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: true,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      //schema: '',
      schema: undefined,
      securityLevel: factory.SecurityLevel.S2,
    }

    beforeAll(async (done: () => void): Promise<void> => {
      //hilog.info(domain, tag, 'beforeAll config:' + JSON.stringify(config));
      try {
        hilog.info(domain, tag, '%{public}s', '================ Context start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }
      context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      //context = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      const config: factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context
      }

      kvManager = factory.createKVManager(config);
      done();
    })

    afterAll(async (done: () => void) => {
      hilog.info(domain, tag, 'afterAll');
      try {
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        hilog.info(domain, tag, 'afterALL deleteKVStore success');
        kvManager = null;
        kvStore = null;
        await Utils.msSleep(2000);
        done();
      } catch (err) {
        console.error('afterALL deleteKVStore fail: ' + err);
        done();
      }
    })

    beforeEach(async (done: () => void) => {
      kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        hilog.info(domain, tag, 'beforeEach getKVStore success');
        done();
      }).catch((err: Error) => {
        hilog.info(domain, tag, 'beforeEach getKVStore error');
      });
    })

    afterEach(async (done: () => void) => {
      hilog.info(domain, tag, 'afterEach');
      try {
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then((error) => {
          hilog.info(domain, tag, 'afterEach closeKVStore success ' );
          await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          hilog.info(domain, tag, 'afterEach deleteKVStore success ');
          kvStore = null;
          done();
        }).catch((err: Error) => {
          hilog.error(domain, tag, 'afterEach closeKVStore and deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      } catch (e) {
        hilog.error(domain, tag, 'afterEach closeKVStore err ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1400
     * @tc.desc   Test Js Api KVManager.On() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try{
        console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100');
        let deathCallback = () => {
          console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100 death callback call');
        }

        kvManager!.onDistributedDataServiceDie(deathCallback);
        kvManager!.offDistributedDataServiceDie();
      } catch(e) {
        console.log(`SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0100 error.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1500
     * @tc.desc   Test Js Api KVManager.On() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try{
        console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200');
        let deathCallback1 = () => {
          console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200 death callback call');
        }
        let deathCallback2 = () => {
          console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200 death callback call');
        }
        kvManager!.onDistributedDataServiceDie(deathCallback1);
        kvManager!.onDistributedDataServiceDie(deathCallback2);
        kvManager!.offDistributedDataServiceDie(deathCallback1);
        kvManager!.offDistributedDataServiceDie(deathCallback2);
      } catch(e) {
        console.log(`SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0200 error.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_1800
     * @tc.desc   Test Js Api KVManager.On() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try{
        console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300');
        let deathCallback = () => {
          console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300 death callback call');
        }
        kvManager!.onDistributedDataServiceDie(deathCallback);
        kvManager!.onDistributedDataServiceDie(deathCallback);
        kvManager!.offDistributedDataServiceDie(deathCallback);
      } catch(e) {
        console.log(`SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300 error.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVManagerPromiseJsApiTest_0900
     * @tc.desc   Test Js Api KVManager.Off() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try{
        console.info('SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100');
        let deathCallback = () => {
          console.info('SUB_DDM_DKV_KVMANAGER_ON_PROMISE_0300 death callback call');
        }
        kvManager!.offDistributedDataServiceDie(deathCallback);
      } catch(e) {
        console.log(`SUB_DDM_DKV_KVMANAGER_OFF_PROMISE_0100 error.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })
  })
}