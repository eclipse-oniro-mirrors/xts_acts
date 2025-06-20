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

import { expect, describe, it, afterEach, Level} from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function loadingProgressColorTest() {

  describe('LoadingProgressColorTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LOADINGPROGRESS_COLOR_0100
     * @tc.name       : testLoadingProgressColor001
     * @tc.desc       : testing color for LoadingProgress with red value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadingProgressColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLoadingProgressColor001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LOADINGPROGRESS_COLOR_0200
     * @tc.name       : testLoadingProgressColor002
     * @tc.desc       : testing color for LoadingProgress with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadingProgressColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLoadingProgressColor002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LOADINGPROGRESS_COLOR_0300
     * @tc.name       : testLoadingProgressColor003
     * @tc.desc       : testing color for LoadingProgress with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadingProgressColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLoadingProgressColor003()).assertEqual(0)
      done();
    });
  })
}
