/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function buttonLabelStyleNullTest() {
  describe('buttonLabelStyleNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonLabelStyleNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonNull/ButtonLabelStyleNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonLabelStyleNullTest state pages:" + JSON.stringify(pages));
        if (!("ButtonLabelStyleNullTest" == pages.name)) {
          console.info("get buttonLabelStyleNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push buttonLabelStyleNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonLabelStyleNullTest page error:" + err);
        expect().assertFail();
      }
      console.info("buttonLabelStyleNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   buttonLabelStyle_Null_001
     * @tc.number SUB_ARKUI_BUTTON_LABELSTYLE_PARAM_001
     * @tc.desc   Test Button labelStyle with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonLabelStyle_Null_001', Level.LEVEL1, async (done: Function) => {
      console.info('buttonLabelStyle_Null_001 START');
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('button_labelStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+ '========attrs========')
      expect(obj.$attrs.labelStyle).assertContain("FontStyle.Normal");

      console.info('buttonLabelStyle_Null_001 END');
      done();
    });

    /**
     * @tc.name   buttonLabelStyle_Undefined_002
     * @tc.number SUB_ARKUI_BUTTON_LABELSTYLE_PARAM_002
     * @tc.desc   Test Button labelStyle with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonLabelStyle_Undefined_002', Level.LEVEL1, async (done: Function) => {
      console.info('buttonLabelStyle_Undefined_002 START');
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('button_labelStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+ '========attrs========')
      expect(obj.$attrs.labelStyle).assertContain("FontStyle.Normal");

      console.info('buttonLabelStyle_Undefined_002 END');
      done();
    });

  })
}