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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import osAccountNdk from 'libosaccountndk.so'
import { Driver, ON } from '@kit.TestKit';

const OS_ACCOUNT_ERR_OK = 0;
const ARKUI_ERROR_CODE_NO_ERROR = 0

export default function ActsOsAccountNdkTest() {
  describe('ActsOsAccountNdkTest', () => {
    /**
     * @tc.number  :  : SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0100
     * @tc.name    :  : NativeDisplayManagerRotation001
     * @tc.desc    :  : testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation0 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation0();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation0 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0200
     * @tc.name    : NativeDisplayManagerRotation002
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation1 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation1();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation1 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0300
     * @tc.name    : NativeDisplayManagerRotation003
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation2 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation2();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation2 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  :  SUB_ArkUI_NATIVEDISPLAYMANAGERROTATION_0400
     * @tc.name    :  NativeDisplayManagerRotation004
     * @tc.desc    :  testing ArkUI_NATIVEDISPLAYMANAGER_ROTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerRotation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>GetDefaultDisplayRotation3 start====')
          let result = osAccountNdk.GetDefaultDisplayRotation0();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>GetDefaultDisplayRotation3 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  :  SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0100
     * @tc.name    :  NativeDisplayManagerOrientation001
     * @tc.desc    :  testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait0 start====')
          let result = osAccountNdk.DisplayManagerPortrait0();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait0 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0200
     * @tc.name    : NativeDisplayManagerOrientation002
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait1 start====')
          let result = osAccountNdk.DisplayManagerPortrait1();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait1 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0300
     * @tc.name    : NativeDisplayManagerOrientation003
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait2 start====')
          let result = osAccountNdk.DisplayManagerPortrait2();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait2 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0400
     * @tc.name    : NativeDisplayManagerOrientation004
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait3 start====')
          let result = osAccountNdk.DisplayManagerPortrait3();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait3 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
    /**
     * @tc.number  : SUB_ArkUI_NATIVEDISPLAYMANAGERORIENTATION_0500
     * @tc.name    : NativeDisplayManagerOrientation005
     * @tc.desc    : testing ArkUI_NATIVEDISPLAYMANAGERORIENTATION
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NativeDisplayManagerOrientation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info('====>DisplayManagerPortrait4 start====')
          let result = osAccountNdk.DisplayManagerPortrait4();
          expect(0).assertEqual(result)
          done()
        } catch (err) {
          console.error("====>DisplayManagerPortrait4 catch err: " + err)
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK)
        }
      })
  })
}
