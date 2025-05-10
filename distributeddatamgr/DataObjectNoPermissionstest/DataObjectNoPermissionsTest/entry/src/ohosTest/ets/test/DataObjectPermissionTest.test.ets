/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { distributedDataObject } from '@kit.ArkData';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = 'ttt';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
class SourceObject {
  name: string
  age: number
  isVis: boolean

  constructor(name: string, age: number, isVis: boolean) {
    this.name = name
    this.age = age
    this.isVis = isVis
  }
}

let source: SourceObject = new SourceObject("jack", 18, false);
let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);


export default function DataObjectPermissionTest() {
  describe('DataObjectPermissionTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_DataObject_setSessionId_Callback_PermissionTest_0100
     * @tc.name DataObjectPermissionTest01
     * @tc.desc Test DataObject setSessionId Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_setSessionId_Callback_PermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_setSessionId_Callback_PermissionTest_0100 start ************')
      try {
        g_object.setSessionId(distributedDataObject.genSessionId(), ()=>{});
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setSession. Code: ' + err.code + ',message: ' + err.message)
        expect(err.code).assertEqual('201')
      }
      console.info(TAG + '************ SUB_DataObject_setSessionId_Callback_PermissionTest_0100 end ************')
    })

    /**
     * @tc.number SUB_DataObject_setSessionId_Promise_PermissionTest_0100
     * @tc.name DataObjectPermissionTest02
     * @tc.desc Test DataObject setSessionId Promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_setSessionId_Promise_PermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_setSessionId_Promise_PermissionTest_0100 start ************')
      try {
        g_object.setSessionId(distributedDataObject.genSessionId());
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setSession. Code: ' + err.code + ',message: ' + err.message)
        expect(err.code).assertEqual('201')
      }
      console.info(TAG + '************ SUB_DataObject_setSessionId_Promise_PermissionTest_0100 end ************')
    })
  })
}