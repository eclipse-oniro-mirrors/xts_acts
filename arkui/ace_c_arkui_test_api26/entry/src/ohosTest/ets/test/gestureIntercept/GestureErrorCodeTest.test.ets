/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function gestureErrorCodeTest() {

  describe('gestureErrorCodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTUREERRORCODE_0100
     * @tc.number SUB_ACE_ARKUI_GESTUREERRORCODE_0100
     * @tc.desc   SUB_ACE_ARKUI_GESTUREERRORCODE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTUREERRORCODE_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GestureInterceptErrorCode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTUREERRORCODE_0200
     * @tc.number SUB_ACE_ARKUI_GESTUREERRORCODE_0200
     * @tc.desc   SUB_ACE_ARKUI_GESTUREERRORCODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTUREERRORCODE_0200', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GestureInterceptErrorCode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTUREERRORCODE_0300
     * @tc.number SUB_ACE_ARKUI_GESTUREERRORCODE_0300
     * @tc.desc   SUB_ACE_ARKUI_GESTUREERRORCODE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTUREERRORCODE_0300', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GestureInterceptErrorCode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTUREERRORCODE_0400
     * @tc.number SUB_ACE_ARKUI_GESTUREERRORCODE_0400
     * @tc.desc   SUB_ACE_ARKUI_GESTUREERRORCODE_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTUREERRORCODE_0400', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GestureInterceptErrorCode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTURNULLPTR_0100
     * @tc.number SUB_ACE_ARKUI_GESTURNULLPTR_0100
     * @tc.desc   SUB_ACE_ARKUI_GESTURNULLPTR_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTURNULLPTR_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.GestureInterceptNullTest001()).assertEqual(0)
      done()
    })
  })
}