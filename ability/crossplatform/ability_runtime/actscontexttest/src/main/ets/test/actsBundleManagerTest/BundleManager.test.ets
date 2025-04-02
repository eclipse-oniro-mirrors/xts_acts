/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function BundleManager() {
  describe("BundleManager", () => {

    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : ABILITY_TEST_LAUNCHTYPE_0100
     * @tc.name      : testLaunchType001
     * @tc.desc      : test LaunchType SINGLETON
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLaunchType001', 0, async (done: Function) => {
      try {
        console.log('testLaunchType001 begin');
        expect(bundleManager.LaunchType.SINGLETON).assertEqual(0);
        console.log('testLaunchType001 success');
        done();
      } catch (err) {
        console.log('testLaunchType001 fail' + err);
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_LAUNCHTYPE_0200
     * @tc.name      : testLaunchType002
     * @tc.desc      : test LaunchType MULTITON
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testLaunchType002', 0, async (done: Function) => {
      try {
        console.log('testLaunchType002 begin');
        expect(bundleManager.LaunchType.MULTITON).assertEqual(1);
        console.log('testLaunchType002 success');
        done();
      } catch (err) {
        console.log('testLaunchType002 fail' + err);
        done();
      }
    })
  })
}
