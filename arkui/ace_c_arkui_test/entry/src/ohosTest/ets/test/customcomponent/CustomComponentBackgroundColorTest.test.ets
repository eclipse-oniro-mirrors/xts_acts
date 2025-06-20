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

export default function customComponentBackgroundColorTest() {

  describe('CustomComponentBackgroundColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BACKGROUNDCOLOR_0100
     * @tc.name       : testCustomComponentBackgroundColor001
     * @tc.desc       : testing backgroundColor for customComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBackgroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBackgroundColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BACKGROUNDCOLOR_0200
     * @tc.name       : testCustomComponentBackgroundColor002
     * @tc.desc       : testing backgroundColor for customComponent with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBackgroundColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBackgroundColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BACKGROUNDCOLOR_0300
     * @tc.name       : testCustomComponentBackgroundColor003
     * @tc.desc       : testing backgroundColor for customComponent with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBackgroundColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBackgroundColor003()).assertEqual(0)
      done()
    })
  })
}
