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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function stackTranslateTest() {

  describe('StackTranslateTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSLATE_0100
     * @tc.name       : testStackTranslate001
     * @tc.desc       : testing translate for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTranslate001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTranslate001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_TRANSLATE_0200
     * @tc.name       : testStackTranslate002
     * @tc.desc       : testing translate for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStackTranslate002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testStackTranslate002()).assertEqual(0)
      done()
    })

  })
}
