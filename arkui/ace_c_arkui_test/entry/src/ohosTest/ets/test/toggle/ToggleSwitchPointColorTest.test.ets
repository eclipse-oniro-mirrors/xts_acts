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

export default function toggleSwitchPointColorTest() {

  describe('ToggleSwitchPointColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SWITCHPOINTCOLOR_0100
     * @tc.name       : testToggleSwitchPointColor001
     * @tc.desc       : testing switchPointColor for toggle with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleSwitchPointColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSwitchPointColor001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SWITCHPOINTCOLOR_0200
     * @tc.name       : testToggleSwitchPointColor002
     * @tc.desc       : testing switchPointColor for toggle with small value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleSwitchPointColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSwitchPointColor002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SWITCHPOINTCOLOR_0300
     * @tc.name       : testToggleSwitchPointColor003
     * @tc.desc       : testing switchPointColor for toggle with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testToggleSwitchPointColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSwitchPointColor003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SWITCHPOINTCOLOR_0400
     * @tc.name       : testToggleSwitchPointColor004
     * @tc.desc       : testing switchPointColor for toggle with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleSwitchPointColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSwitchPointColor004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TOGGLE_SWITCHPOINTCOLOR_0500
     * @tc.name       : testToggleSwitchPointColor005
     * @tc.desc       : testing switchPointColor for toggle with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testToggleSwitchPointColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testToggleSwitchPointColor005()).assertEqual(0)
      done()
    })
  })
}
