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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsMarkAnchorTest() {

  describe('CommonAttrsMarkAnchorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MARKANCHOR_0100
     * @tc.name       : testCommonAttrsMarkAnchorTest001
     * @tc.desc       : testing markanchor for text with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMarkAnchorTest001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMarkAnchorTest001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MARKANCHOR_0200
     * @tc.name       : testCommonAttrsMarkAnchorTest002
     * @tc.desc       : testing markanchor for text with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMarkAnchorTest002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMarkAnchorTest002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MARKANCHOR_0300
     * @tc.name       : testCommonAttrsMarkAnchorTest003
     * @tc.desc       : testing markanchor for text with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMarkAnchorTest003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMarkAnchorTest003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_MARKANCHOR_0400
     * @tc.name       : testCommonAttrsMarkAnchorTest004
     * @tc.desc       : testing resetAttribute markanchor for text
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsMarkAnchorTest004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsMarkAnchorTest004()).assertEqual(0)
      done()
    })
  })
}
