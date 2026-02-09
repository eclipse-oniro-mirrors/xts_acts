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

export default function commonAttrsTouchableTest() {

  describe('CommonAttrsTouchableTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsTouchable001
     * @tc.number SUB_ARKUI_CAPI_BUTTON_TOUCHABLE_0100
     * @tc.desc   testing touchable for commonAttrs with valid value true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTouchable001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`commonattrs/CommonAttrsTouchableTest`, done);
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('btnTouchable').$attrs.backgroundColor).assertEqual('#0xFF00FF00')
      done()
    })

    /**
     * @tc.name   testCommonAttrsTouchable002
     * @tc.number SUB_ARKUI_CAPI_BUTTON_TOUCHABLE_0200
     * @tc.desc   testing touchable for commonAttrs with valid value false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTouchable002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTouchable002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsTouchable003
     * @tc.number SUB_ARKUI_CAPI_BUTTON_TOUCHABLE_0300
     * @tc.desc   testing touchable for commonAttrs with invalid value-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTouchable003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTouchable003()).assertEqual(0)
      done()
    })
    
    /**
     * @tc.name   testCommonAttrsTouchable004
     * @tc.number SUB_ARKUI_CAPI_BUTTON_TOUCHABLE_0400
     * @tc.desc   testing resetAttribute touchable for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsTouchable004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsTouchable004()).assertEqual(0)
      done()
    })
  })
}