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

export default function customComponentBorderRadiusTest() {
  customComponentBorderRadiusTest
  describe('CustomComponentBorderRadiusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERRADIUS_0100
     * @tc.name       : testCustomComponentBorderRadius001
     * @tc.desc       : testing borderRadius for customComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderRadius001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderRadius001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERRADIUS_0200
     * @tc.name       : testCustomComponentBorderRadius002
     * @tc.desc       : testing borderRadius for customComponent with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderRadius002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderRadius002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERRADIUS_0300
     * @tc.name       : testCustomComponentBorderRadius003
     * @tc.desc       : testing borderRadius for customComponent with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderRadius003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderRadius003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERRADIUS_0400
     * @tc.name       : testCustomComponentBorderRadius004
     * @tc.desc       : testing borderRadius for customComponent with large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCustomComponentBorderRadius004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderRadius004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERRADIUS_0500
     * @tc.name       : testCustomComponentBorderRadius005
     * @tc.desc       : testing borderRadius for customComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level2
     */
    it('testCustomComponentBorderRadius005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderRadius005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_BORDERRADIUS_0600
     * @tc.name       : testCustomComponentBorderRadius006
     * @tc.desc       : testing borderRadius for customComponent with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level2
     */
    it('testCustomComponentBorderRadius006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentBorderRadius006()).assertEqual(0)
      done()
    })
  })
}
