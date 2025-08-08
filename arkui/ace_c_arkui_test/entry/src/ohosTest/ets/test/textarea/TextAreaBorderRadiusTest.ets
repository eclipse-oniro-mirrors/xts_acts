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

export default function textAreaBorderRadiusTest() {

  describe('TextAreaBorderRadiusTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_BORDERRADIUS_0100
     * @tc.name: testTextAreaBorderRadius001
     * @tc.desc: testing borderRadius for textArea with single value 16vp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaBorderRadius001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaBorderRadius001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_BORDERRADIUS_0200
     * @tc.name: testTextAreaBorderRadius002
     * @tc.desc: testing borderRadius for textArea with overall value array 8,16,10,20(vp)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaBorderRadius002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaBorderRadius002()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_BORDERRADIUS_0300
     * @tc.name: testTextAreaBorderRadius003
     * @tc.desc: testing borderRadius for textArea with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaBorderRadius003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaBorderRadius003()).assertEqual(0)
      done();
    });
  })
}
