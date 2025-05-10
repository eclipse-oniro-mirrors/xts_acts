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

export default function gridRowsTemplateTest() {

  describe('GridRowsTemplateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWTEMPLATE_0100
     * @tc.name       : testGridRowsTemplate001
     * @tc.desc       : testing RowsTemplate for Progress with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsTemplate001', 0, async (done: Function) => {
      expect(nativeFunc.testGridRowsTemplate001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWTEMPLATE_0200
     * @tc.name       : testGridRowsTemplate002
     * @tc.desc       : testing RowsTemplate for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsTemplate002', 0, async (done: Function) => {
      expect(nativeFunc.testGridRowsTemplate002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_ROWTEMPLATE_0300
     * @tc.name       : testGridRowsTemplate003
     * @tc.desc       : testing RowsTemplate for Progress with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridRowsTemplate003', 0, async (done: Function) => {
      expect(nativeFunc.testGridRowsTemplate003()).assertEqual(0)
      done();
    })

  })
}
