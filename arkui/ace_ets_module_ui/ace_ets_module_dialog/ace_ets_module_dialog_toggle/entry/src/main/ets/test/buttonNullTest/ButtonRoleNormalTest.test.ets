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

export default function buttonRoleNormalTest() {
  describe('buttonRoleNormalTest', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonRoleNormalTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonNull/ButtonRoleNormalTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonRoleNormalTest state pages:" + JSON.stringify(pages));
        if (!("ButtonRoleNormalTest" == pages.name)) {
          console.info("get buttonRoleNormalTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push buttonRoleNormalTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonRoleNormalTest page error:" + err);
        expect().assertFail();
      }
      console.info("buttonRoleNormalTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   buttonRoleNormal_0100
     * @tc.number SUB_ARKUI_BUTTON_ROLE_PARAM_001
     * @tc.desc   Test Button role attribute with ButtonRole.NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonRoleNormal_0100', Level.LEVEL1, async (done: Function) => {
      console.info('buttonRoleNormal_0100 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_role_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.role).assertEqual('ButtonRole.NORMAL');

      console.info('buttonRoleNormal_0100 END');
      done();
    });

  })
}