/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"


export default function getApplicationLabel() {
  describe('getApplicationLabel', () => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0200
     * @tc.desc   Check the empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundleManager.getApplicationLabel("", 0).then(data => {
        console.info("getApplicationLabel success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getApplicationLabel failed" + JSON.stringify(err))
        expect(err.code).assertEqual(17700001)
        done()
      })
    })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0400
     * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0400
     * @tc.desc   Check the -1 AppIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundleManager.getApplicationLabel("ohos.acts.bundle.stage.test", -1).then(data => {
        console.info("getApplicationLabel success" + JSON.stringify(data))
        expect(data).assertFail()
        done()
      }).catch((err: BusinessError) => {
        console.info("getApplicationLabel failed" + JSON.stringify(err))
        expect(err.code).assertEqual(17700061)
        done()
      })
    })

  
    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0500
     * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0500
     * @tc.desc   Check the wrong type of appIndex (string instead of number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABEL_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      try {
        await bundleManager.getApplicationLabel("ohos.acts.bundle.stage.test", 0).then(data => {
          console.info("getApplicationLabelWithWrongAppIndexType success" + JSON.stringify(data))
          expect(data).assertFail()
          done()
        }).catch((err: BusinessError) => {
          console.info("getApplicationLabelWithWrongAppIndexType failed" + JSON.stringify(err) +  "==>" + err.message)
          expect(err.code).assertEqual(201);
          expect(err.message).assertEqual('BusinessError 201: Permission denied. An attempt was made to GetApplicationLabel forbidden by permission: ohos.permission.GET_BUNDLE_INFO_PRIVILEGED.')
          done()
        })
      } catch (err) {
        console.info("getApplicationLabelWithWrongAppIndexType fail" + JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })
 
 
   })
 }