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

import { beforeEach, expect, describe, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function refreshPullDownRatioTest() {

  describe('RefreshPullDownRatioTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0100
     * @tc.name       : testRefreshPullDownRatio001
     * @tc.desc       : testing value for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio001', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0200
     * @tc.name       : testRefreshPullDownRatio002
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio002', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0300
     * @tc.name       : testRefreshPullDownRatio003
     * @tc.desc       : testing value for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio003', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0400
     * @tc.name       : testRefreshPullDownRatio004
     * @tc.desc       : testing value for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio004', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0500
     * @tc.name       : testRefreshPullDownRatio005
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio005', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0600
     * @tc.name       : testRefreshPullDownRatio006
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio006', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio006()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_DOWN_RATIO_0700
     * @tc.name       : testRefreshPullDownRatio007
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullDownRatio007', 0, async (done: Function) => {
      expect(nativeFunc.testRefreshPullDownRatio007()).assertEqual(0)
      done();
    })
  })
}
