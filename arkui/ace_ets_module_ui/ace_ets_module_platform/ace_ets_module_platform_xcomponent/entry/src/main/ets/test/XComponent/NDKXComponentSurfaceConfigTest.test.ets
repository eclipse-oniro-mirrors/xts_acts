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

export default function NDKXComponentSurfaceConfigTest() {
  describe('NDKXComponentSurfaceConfigTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentSurfaceConfig beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/NDKXComponentSurfaceConfigPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentSurfaceConfig state pages:" + JSON.stringify(pages));
        if (!("NDKXComponentSurfaceConfigPage" == pages.name)) {
          console.info("get XComponentSurfaceConfig pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentSurfaceConfig page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentSurfaceConfig page error:" + err);
      }
      console.info("XComponentSurfaceConfig beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentSurfaceConfig after each called");
    });

    /**
     * @tc.name   NDKXComponentSurfaceConfigTest_0100
     * @tc.number NDKXComponentSurfaceConfigTest_0100
     * @tc.desc   Test OH_ArkUI_SurfaceHolder_SetSurfaceConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NDKXComponentSurfaceConfigTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[NDKXComponentSurfaceConfigTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey("NDKXComponentSurfaceConfigPage_XComponent");
      expect(JSON.parse(strJson).$type).assertEqual("XComponent");

      console.info('[NDKXComponentSurfaceConfigTest_0100] END');
      done();
    });

    /**
     * @tc.name   NDKXComponentSurfaceConfigTest_0200
     * @tc.number NDKXComponentSurfaceConfigTest_0200
     * @tc.desc   Test OH_ArkUI_SurfaceHolder_SetSurfaceConfig ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NDKXComponentSurfaceConfigTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[NDKXComponentSurfaceConfigTest_0200] START');
      await CommonFunc.sleep(1000);

      expect(native.TestSetSurfaceConfigErrorCode001("NDKXComponentSurfaceConfigPage_XComponent")).assertEqual(0)

      console.info('[NDKXComponentSurfaceConfigTest_0200] END');
      done();
    });

    /**
     * @tc.name   NDKXComponentSurfaceConfigTest_0300
     * @tc.number NDKXComponentSurfaceConfigTest_0300
     * @tc.desc   Test OH_ArkUI_SurfaceHolder_SetSurfaceConfig ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NDKXComponentSurfaceConfigTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[NDKXComponentSurfaceConfigTest_0300] START');
      await CommonFunc.sleep(1000);

      expect(native.TestSetSurfaceConfigErrorCode002("NDKXComponentSurfaceConfigPage_XComponent")).assertEqual(0)

      console.info('[NDKXComponentSurfaceConfigTest_0300] END');
      done();
    });

    /**
     * @tc.name   NDKXComponentSurfaceConfigTest_0400
     * @tc.number NDKXComponentSurfaceConfigTest_0400
     * @tc.desc   Test OH_ArkUI_XComponentSurfaceConfig_Create ErrorCode return Non-nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NDKXComponentSurfaceConfigTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[NDKXComponentSurfaceConfigTest_0400] START');
      await CommonFunc.sleep(1000);

      expect(native.TestSurfaceConfigCreateReturnNoNullptr()).assertEqual(0)

      console.info('[NDKXComponentSurfaceConfigTest_0400] END');
      done();
    });
  })
}