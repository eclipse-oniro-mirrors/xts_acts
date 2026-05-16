/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';
import { UiComponent, Driver, Component, ON, BY } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

class TerminationInfoTest {
  static terminatedCode: number = -1;
  static terminatedWantStr: string = '';
  static hasError: boolean = false;
  static errorMessage: string = '';
}

export default function embeddedComponentTerminationInfoTest() {
  describe('EmbeddedComponentTerminationInfoTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'pages/embeddedComponent/EmbeddedComponentTerminationInfo',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('EmbeddedComponentTerminationInfo' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push EmbeddedComponentTerminationInfo page error:' + err);
      }
    });

    beforeEach(() => {
      TerminationInfoTest.terminatedCode = -1;
      TerminationInfoTest.terminatedWantStr = '';
      TerminationInfoTest.hasError = false;
      TerminationInfoTest.errorMessage = '';
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   embeddedComponent_terminationInfo_want_normal_001
     * @tc.number SUB_ARKUI_EMBEDDED_TERMINATION_WANT_NORMAL_001
     * @tc.desc   测试EmbeddedComponent onTerminated回调中TerminationInfo.want传入正常Want对象
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('embeddedComponent_terminationInfo_want_normal_001', Level.LEVEL0, async (done: Function) => {
      console.info('[embeddedComponent_terminationInfo_want_normal_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let terminationText = await driver.findComponent(ON.id('termination_text'));
      if (terminationText) {
        let text = await terminationText.getText();
        expect(text).assertContain('EmbeddedComponent Test');
      }
      console.info('[embeddedComponent_terminationInfo_want_normal_001] END');
      done();
    });

    /**
     * @tc.name   embeddedComponent_terminationInfo_want_undefined_002
     * @tc.number SUB_ARKUI_EMBEDDED_TERMINATION_WANT_UNDEFINED_002
     * @tc.desc   测试EmbeddedComponent onTerminated回调中TerminationInfo.want为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('embeddedComponent_terminationInfo_want_undefined_002', Level.LEVEL2, async (done: Function) => {
      console.info('[embeddedComponent_terminationInfo_want_undefined_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let terminationText = await driver.findComponent(ON.id('termination_text'));
      if (terminationText) {
        let text = await terminationText.getText();
        expect(text).assertContain('EmbeddedComponent Test');
      }
      console.info('[embeddedComponent_terminationInfo_want_undefined_002] END');
      done();
    });

    /**
     * @tc.name   embeddedComponent_terminationInfo_want_null_003
     * @tc.number SUB_ARKUI_EMBEDDED_TERMINATION_WANT_NULL_003
     * @tc.desc   测试EmbeddedComponent onTerminated回调中TerminationInfo.want为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('embeddedComponent_terminationInfo_want_null_003', Level.LEVEL2, async (done: Function) => {
      console.info('[embeddedComponent_terminationInfo_want_null_003] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let terminationText = await driver.findComponent(ON.id('termination_text'));
      if (terminationText) {
        let text = await terminationText.getText();
        expect(text).assertContain('EmbeddedComponent Test');
      }
      console.info('[embeddedComponent_terminationInfo_want_null_003] END');
      done();
    });

    /**
     * @tc.name   embeddedComponent_terminationInfo_want_bundleName_004
     * @tc.number SUB_ARKUI_EMBEDDED_TERMINATION_WANT_BUNDLENAME_004
     * @tc.desc   测试EmbeddedComponent onTerminated回调中TerminationInfo.want.bundleName字段
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('embeddedComponent_terminationInfo_want_bundleName_004', Level.LEVEL0, async (done: Function) => {
      console.info('[embeddedComponent_terminationInfo_want_bundleName_004] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let codeText = await driver.findComponent(ON.id('code_text'));
      if (codeText) {
        let text = await codeText.getText();
        expect(text).assertContain('Code:');
      }
      console.info('[embeddedComponent_terminationInfo_want_bundleName_004] END');
      done();
    });

    /**
     * @tc.name   embeddedComponent_terminationInfo_code_normal_005
     * @tc.number SUB_ARKUI_EMBEDDED_TERMINATION_CODE_NORMAL_005
     * @tc.desc   测试EmbeddedComponent onTerminated回调中TerminationInfo.code正常返回值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('embeddedComponent_terminationInfo_code_normal_005', Level.LEVEL0, async (done: Function) => {
      console.info('[embeddedComponent_terminationInfo_code_normal_005] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let wantText = await driver.findComponent(ON.id('want_text'));
      if (wantText) {
        let text = await wantText.getText();
        expect(text).assertContain('Want:');
      }
      console.info('[embeddedComponent_terminationInfo_code_normal_005] END');
      done();
    });

    /**
     * @tc.name   embeddedComponent_onError_callback_006
     * @tc.number SUB_ARKUI_EMBEDDED_ONERROR_CALLBACK_006
     * @tc.desc   测试EmbeddedComponent onError回调函数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('embeddedComponent_onError_callback_006', Level.LEVEL0, async (done: Function) => {
      console.info('[embeddedComponent_onError_callback_006] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let errorText = await driver.findComponent(ON.id('error_text'));
      if (errorText) {
        let text = await errorText.getText();
        expect(text).assertContain('Error:');
      }
      console.info('[embeddedComponent_onError_callback_006] END');
      done();
    });
  });
}
