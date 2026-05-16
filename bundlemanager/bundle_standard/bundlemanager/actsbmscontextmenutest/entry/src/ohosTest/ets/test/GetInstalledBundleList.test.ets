/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType ,Size ,Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';

let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;


export default function getInstalledBundleList() {
  describe('getInstalledBundleList', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100
     * @tc.desc   Test getInstalledBundleList unPermission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        await bundleManager.getInstalledBundleList(bundleFlags).then(data => {
          console.info("getInstalledBundleList promise success " + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info("getInstalledBundleList promise error " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        })
      } catch (err) {
        console.info("getInstalledBundleList catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200
     * @tc.desc   Test getInstalledBundleList with null flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        await bundleManager.getInstalledBundleList(null).then(data => {
          console.info("getInstalledBundleList promise success " + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info("getInstalledBundleList promise error " + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info("getInstalledBundleList catch " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0300
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0300
     * @tc.desc   Test getInstalledBundleList with undefined flag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        await bundleManager.getInstalledBundleList(undefined).then(data => {
          console.info("getInstalledBundleList promise success " + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info("getInstalledBundleList promise error " + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info("getInstalledBundleList catch " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    })

  })
}