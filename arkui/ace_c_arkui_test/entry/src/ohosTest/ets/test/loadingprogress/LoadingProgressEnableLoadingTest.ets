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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function loadingProgressEnableLoadingTest() {

  describe('LoadingProgressEnableLoadingTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LOADINGPROGRESS_ENABLELOADING_0100
     * @tc.name       : testLoadingProgressEnableLoading001
     * @tc.desc       : testing enableLoading for LoadingProgress with true value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadingProgressEnableLoading001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLoadingProgressEnableLoading001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LOADINGPROGRESS_ENABLELOADING_0200
     * @tc.name       : testLoadingProgressEnableLoading002
     * @tc.desc       : testing enableLoading for LoadingProgress with false value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadingProgressEnableLoading002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLoadingProgressEnableLoading002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LOADINGPROGRESS_ENABLELOADING_0300
     * @tc.name       : testLoadingProgressEnableLoading003
     * @tc.desc       : testing enableLoading for LoadingProgress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadingProgressEnableLoading003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLoadingProgressEnableLoading003()).assertEqual(0)
      done();
    });
  })
}
