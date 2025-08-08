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

import { beforeEach, expect, describe, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function refreshPullToRefreshTest() {

  describe('RefreshPullToRefreshTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_TO_REFRESH_0100
     * @tc.name       : testRefreshPullToRefresh001
     * @tc.desc       : testing value for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullToRefresh001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshPullToRefresh001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_TO_REFRESH_0200
     * @tc.name       : testRefreshPullToRefresh002
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullToRefresh002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshPullToRefresh002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_TO_REFRESH_0300
     * @tc.name       : testRefreshPullToRefresh003
     * @tc.desc       : testing value for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullToRefresh003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshPullToRefresh003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_TO_REFRESH_0400
     * @tc.name       : testRefreshPullToRefresh004
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullToRefresh004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshPullToRefresh004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_TO_REFRESH_0500
     * @tc.name       : testRefreshPullToRefresh005
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullToRefresh005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshPullToRefresh005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_REFRESH_PULL_TO_REFRESH_0600
     * @tc.name       : testRefreshPullToRefresh006
     * @tc.desc       : testing value for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRefreshPullToRefresh006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testRefreshPullToRefresh006()).assertEqual(0)
      done();
    })
  })
}
