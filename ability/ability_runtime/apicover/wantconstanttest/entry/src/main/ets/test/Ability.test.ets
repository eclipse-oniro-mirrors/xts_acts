/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import wantConstant from '@ohos.app.ability.wantConstant'

let TAG: string;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
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
    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0100
     * @tc.name    Verify PAGE_PATH.
     * @tc.desc    Function test
     * @tc.level   3
     */

    it('SUB_AA_OpenHarmony_WantConstantCover_0100', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0100 ==>';
      expect(wantConstant.Params.PAGE_PATH)
        .assertEqual('ohos.param.atomicservice.pagePath');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0200
     * @tc.name    Verify ROUTER_NAME.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0200', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0200 ==>';
      expect(wantConstant.Params.ROUTER_NAME)
        .assertEqual('ohos.param.atomicservice.routerName');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0300
     * @tc.name    Verify PAGE_SOURCE_FILE.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0300', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0300 ==>';
      expect(wantConstant.Params.PAGE_SOURCE_FILE)
        .assertEqual('ohos.param.atomicservice.pageSourceFile');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0400
     * @tc.name    Verify BUILD_FUNCTION.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0400', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0400 ==>';
      expect(wantConstant.Params.BUILD_FUNCTION)
        .assertEqual('ohos.param.atomicservice.buildFunction');
      done();
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_WantConstantCover_0500
     * @tc.name    Verify SUB_PACKAGE_NAME.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_WantConstantCover_0500', 0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_WantConstantCover_0500 ==>';
      expect(wantConstant.Params.SUB_PACKAGE_NAME)
        .assertEqual('ohos.param.atomicservice.subpackageName');
      done();
    })
  })
}