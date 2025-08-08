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

export default function gridColumnTemplateTest() {

  describe('GridColumnTemplateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_COLUMNTEMPLATE_0100
     * @tc.name       : testGridColumnTemplate001
     * @tc.desc       : testing ColumnTemplate for Grid with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridColumnTemplate001', 0, async (done: Function) => {
      expect(nativeFunc.testGridColumnTemplate001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_COLUMNTEMPLATE_0200
     * @tc.name       : testGridColumnTemplate002
     * @tc.desc       : testing ColumnTemplate for Grid with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridColumnTemplate002', 0, async (done: Function) => {
      expect(nativeFunc.testGridColumnTemplate002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_GRID_COLUMNTEMPLATE_0300
     * @tc.name       : testGridColumnTemplate003
     * @tc.desc       : testing ColumnTemplate for Grid with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGridColumnTemplate003', 0, async (done: Function) => {
      expect(nativeFunc.testGridColumnTemplate003()).assertEqual(0)
      done();
    })

  })
}
