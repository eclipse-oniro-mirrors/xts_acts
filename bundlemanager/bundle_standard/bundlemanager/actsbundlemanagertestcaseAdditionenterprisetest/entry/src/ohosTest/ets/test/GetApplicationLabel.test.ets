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
     * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7000
     * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7000
     * @tc.desc   Check the normal bundleName and appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
      await bundleManager.getApplicationLabel("ohos.acts.bundlemanagererrcode.test.enterprise", 0).then(data => {
        console.info("getApplicationLabelNormal success: " + JSON.stringify(data))
        expect(data).assertEqual("MyApplication");
        done()
      }).catch((err: BusinessError) => {
        console.info("getApplicationLabelNormal failed: " + JSON.stringify(err))
        expect(err).assertFail()
        done()
      })
    })
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7100
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7100
      * @tc.desc   Check the null bundleName
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
        try {
          await bundleManager.getApplicationLabel(null, 0).then(data => {
            console.info("getApplicationLabelWithNullBundleName success" + JSON.stringify(data))
            expect(data).assertFail();
            done()
          }).catch((err: BusinessError) => {
            console.info("getApplicationLabelWithNullBundleName failed" + JSON.stringify(err))
            expect().assertFail();
            done()
          })
        } catch (err) {
          console.info("getApplicationLabelWithNullBundleName fail" + JSON.stringify(err) + "==>" + err.message)
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('BusinessError 401: Parameter error. The type of bundleName must be string.')
          done();
        }
      })
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7200
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7200
      * @tc.desc   Check the undefined bundleName
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
        try {
          await bundleManager.getApplicationLabel(undefined, 0).then(data => {
            console.info("getApplicationLabelWithUndefinedBundleName success" + JSON.stringify(data))
            expect(data).assertFail()
            done()
          }).catch((err: BusinessError) => {
            console.info("getApplicationLabelWithUndefinedBundleName failed" + JSON.stringify(err))
            expect().assertFail();
            done()
          })
        } catch (err) {
          console.info("getApplicationLabelWithUndefinedBundleName fail" + JSON.stringify(err) + "==>" + err.message)
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('BusinessError 401: Parameter error. The type of bundleName must be string.')
          done();
        }
      })
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7300
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7300
      * @tc.desc   Check the null appIndex
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
        try {
          await bundleManager.getApplicationLabel("ohos.acts.bundlemanagererrcode.test.enterprise", null).then(data => {
            console.info("getApplicationLabelWithNullAppIndex success" + JSON.stringify(data))
            expect(data).assertFail()
            done()
          }).catch((err: BusinessError) => {
            console.info("getApplicationLabelWithNullAppIndex failed" + JSON.stringify(err))
            expect().assertFail();
            done()
          })
        } catch (err) {
          console.info("getApplicationLabelWithNullAppIndex fail" + JSON.stringify(err) + "==>" + err.message)
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual('BusinessError 401: Parameter error. The type of appIndex must be number.')
          done();
        }
      })
 
     /**
      * @tc.name   SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7400
      * @tc.number SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7400
      * @tc.desc   Check the undefined appIndex
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_BMS_FRAMEWORK_GETAPPLICATIONLABELADD_7400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) =>  {
       try {
            await bundleManager.getApplicationLabel("ohos.acts.bundlemanagererrcode.test.enterprise", undefined).then(data => {
            console.info("getApplicationLabelWithUndefinedAppIndex success" + JSON.stringify(data))
            expect(data).assertFail()
            done()
            }).catch((err: BusinessError) => {
            console.info("getApplicationLabelWithUndefinedAppIndex failed" + JSON.stringify(err))
            expect().assertFail();
            done();
          })
 
         } catch (err) {
           console.info("getApplicationLabelWithUndefinedAppIndex failx" + JSON.stringify(err) + "==>" + err.message )
           expect(err.code).assertEqual(401);
           expect(err.message).assertEqual('BusinessError 401: Parameter error. The type of appIndex must be number.')
           done();
         }
 
     })
 
 
   })
 }