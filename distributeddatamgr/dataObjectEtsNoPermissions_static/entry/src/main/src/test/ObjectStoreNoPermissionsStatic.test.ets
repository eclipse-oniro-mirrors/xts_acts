/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium";
import distributedObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType';
import common from "@ohos.app.ability.common";
import { Driver, ON } from "@kit.TestKit";
import { BusinessError } from "@ohos.base";
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context1: common.UIAbilityContext | undefined;
const TAG = "OBJECTSTORE_TEST";
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function changeCallback(sessionId: string, changeData: Array<string>) {
  console.info("changeCallback start");
  console.info(TAG + "sessionId:" + " " + sessionId);
  if (changeData != null && changeData != undefined) {
    changeData.forEach(element => {
      console.info(TAG + "data changed !" + element);
    });
  }
  console.info("changeCallback end");
}

function statusCallback1(sessionId: string, networkId: string, status: string) {
  console.info(TAG + "statusCallback1" + " " + sessionId);
}

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

export default function ObjectStoreNoPermissionsStatic() {
  describe('ObjectStoreNoPermissionsStatic', () => {
    beforeAll(async (done: () => void) => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.ActsDataObjectNoPermissionsStaticTest.static',
        abilityName: 'EntryAbility'
      });
      await sleep(5000);
      context1 = AppStorage.get<common.UIAbilityContext>("context")! as common.UIAbilityContext;
      done();
    });
    beforeEach(() => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(() => {
      console.info(TAG + 'afterEach');
    });
    afterAll(() => {
      console.info(TAG + 'afterAll');
    });
    console.info(TAG + "*************Unit Test Begin*************");


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setSessionId_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_setSessionId_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setSessionId(sessionId: string, callback: AsyncCallback): void;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setSessionId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setSessionId_0100 begin---------  ');
      try {
       let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
       let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
       console.info(TAG + 'g_object=' + g_object);
       expect(g_object == undefined).assertEqual(false);

        g_object.setSessionId('', (err)=>{
          console.info(TAG + "join session, err=" + err);
          expect(err).assertEqual(null);
          done();
        });
      } catch (err) {
          console.error(TAG + 'Permission verification failed. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(201);
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setSessionId_Promise_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setSessionId(sessionId?: string): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        console.info(TAG + 'g_object=' + g_object);
        expect(g_object == undefined).assertEqual(false);

        await g_object.setSessionId("").then(() => {
          console.info(TAG + "join session");
          done();
        });

      } catch (err) {
          console.error(TAG + 'Permission verification failed. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(201);
      }

    })



    console.info(TAG + "*************Unit Test End*************");
  })
}