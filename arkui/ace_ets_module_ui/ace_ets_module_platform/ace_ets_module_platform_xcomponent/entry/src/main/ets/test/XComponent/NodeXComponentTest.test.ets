/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import native from 'libnativerender.so';

export default function NodeXComponentTest() {
  describe('NodeXComponentTest', () => {
    beforeEach(async (done: Function) => {
      console.info("NodeXComponentPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/NodeXComponentPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NodeXComponentPage state pages:" + JSON.stringify(pages));
        if (!("NodeXComponentPage" == pages.name)) {
          console.info("get NodeXComponentPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NodeXComponentPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NodeXComponentPage page error:" + err);
      }
      console.info("NodeXComponentPage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NodeXComponentPage after each called");
    });

    /**
     * @tc.name   NodeXComponentTest_0100
     * @tc.number NodeXComponentTest_0100
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0100] START');
      await CommonFunc.sleep(1000);

      expect(native.TestAttachNativeRootNodeErrorCode001('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0100] END');
      done();
    });

    /**
     * @tc.name   NodeXComponentTest_0200
     * @tc.number NodeXComponentTest_0200
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0200] START');
      await CommonFunc.sleep(1000);

      expect(native.TestAttachNativeRootNodeErrorCode002('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0200] END');
      done();
    });

    /**
     * @tc.name   NodeXComponentTest_0300
     * @tc.number NodeXComponentTest_0300
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0300] START');
      await CommonFunc.sleep(1000);

      expect(native.TestGetNativeXComponentReturnNull('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0300] END');
      done();
    });

    /**
     * @tc.name   NodeXComponentTest_0400
     * @tc.number NodeXComponentTest_0400
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0400] START');
      await CommonFunc.sleep(1000);

      expect(native.TestSurfaceHolderCreateReturnNull('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0400] END');
      done();
    });

    /**
     * @tc.name   NodeXComponentTest_0500
     * @tc.number NodeXComponentTest_0500
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0500] START');
      await CommonFunc.sleep(1000);

      expect(native.TestSurfaceHolderGetUserDataReturnNull('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0500] END');
      done();
    });

    /**
     * @tc.name   NodeXComponentTest_0600
     * @tc.number NodeXComponentTest_0600
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0600] START');
      await CommonFunc.sleep(1000);

      expect(native.TestSurfaceCallbackCreateReturnNull('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0600] END');
      done();
    });

    /**
     * @tc.name   NodeXComponentTest_0700
     * @tc.number NodeXComponentTest_0700
     * @tc.desc   Test OH_NativeXComponent_AttachNativeRootNode ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeXComponentTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[NodeXComponentTest_0700] START');
      await CommonFunc.sleep(1000);

      expect(native.TestXComponentGetNativeWindowReturnNull('NodeXComponentPage_XComponent')).assertEqual(0)

      await CommonFunc.sleep(1000);

      console.info('[NodeXComponentTest_0700] END');
      done();
    });

  })
}