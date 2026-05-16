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
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function digitalCrownSensitivityNullUndefinedTest() {
  describe('digitalCrownSensitivityNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("digitalCrownSensitivityNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcListDefault/digitalCrownSensitivityNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("digitalCrownSensitivityNullUndefinedTest" == pages.name)) {
          console.info("get digitalCrownSensitivityNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push digitalCrownSensitivityNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push digitalCrownSensitivityNullUndefinedTest page error:" + err);
      }
      console.info("digitalCrownSensitivityNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   arcListDigitalCrownSensitivityNullUndefined_0100
     * @tc.number SUB_ARKUI_ARCLIST_DIGITALCROWNSENSITIVITY_NULL_0100
     * @tc.desc   Test ArcList digitalCrownSensitivity property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListDigitalCrownSensitivityNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcListDigitalCrownSensitivityNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('arclist_digitalCrownSensitivity_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclist_digitalCrownSensitivity_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListDigitalCrownSensitivityNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.digitalCrownSensitivity));
      console.info("[arcListDigitalCrownSensitivityNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));

      // null 应该恢复为默认值
      expect(obj.$attrs.digitalCrownSensitivity).assertEqual(objCompare.$attrs.digitalCrownSensitivity);
      console.info('[arcListDigitalCrownSensitivityNullUndefined_0100] END');
    })

    /**
     * @tc.name   arcListDigitalCrownSensitivityNullUndefined_0200
     * @tc.number SUB_ARKUI_ARCLIST_DIGITALCROWNSENSITIVITY_NULL_0200
     * @tc.desc   Test ArcList digitalCrownSensitivity property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListDigitalCrownSensitivityNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[arcListDigitalCrownSensitivityNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('arclist_digitalCrownSensitivity_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclist_digitalCrownSensitivity_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListDigitalCrownSensitivityNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.digitalCrownSensitivity));
      console.info("[arcListDigitalCrownSensitivityNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.digitalCrownSensitivity));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.digitalCrownSensitivity).assertEqual(objCompare.$attrs.digitalCrownSensitivity);
      console.info('[arcListDigitalCrownSensitivityNullUndefined_0200] END');
    })
  })
}
