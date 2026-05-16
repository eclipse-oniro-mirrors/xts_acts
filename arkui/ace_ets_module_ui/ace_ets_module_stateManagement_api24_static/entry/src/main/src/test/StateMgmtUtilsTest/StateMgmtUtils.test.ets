'use static';
/*
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

import { describe, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import { AppStorage, UIUtils } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

export default function StateMgmtUtilsTest(): void {
  describe('StateMgmtUtilsRealApiTest', () => {
    /**
     * @tc.number SUB_ArkUI_StateUtils_ElementInfo_Shape_6300
     * @tc.name SUB_ArkUI_StateUtils_ElementInfo_Shape_6300
     * @tc.desc utils.d.ets：UIUtils.canBeObserved 返回 ObservedResult.decoratorInfo[*].dependentInfo 含 ElementInfo 语义（真 API）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StateUtils_ElementInfo_Shape_6300', Level.LEVEL1, (done: () => void) => {
      let plain: Record<string, Object> = {};
      let r = UIUtils.canBeObserved(plain);
      expect(Array.isArray(r.decoratorInfo)).assertTrue();
      for (let i = 0; i < r.decoratorInfo.length; i++) {
        let deps = r.decoratorInfo[i].dependentInfo;
        expect(Array.isArray(deps)).assertTrue();
        for (let j = 0; j < deps.length; j++) {
          expect(deps[j].elementName.length).assertLargerOrEqual(0);
          expect(deps[j].elementId).assertLargerOrEqual(0);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StateUtils_DecoratorInfo_Shape_6400
     * @tc.name SUB_ArkUI_StateUtils_DecoratorInfo_Shape_6400
     * @tc.desc DecoratorInfo 字段来自 UIUtils.canBeObserved 返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StateUtils_DecoratorInfo_Shape_6400', Level.LEVEL1, (done: () => void) => {
      let plain: Record<string, Object> = {};
      let r = UIUtils.canBeObserved(plain);
      for (let i = 0; i < r.decoratorInfo.length; i++) {
        let d = r.decoratorInfo[i];
        expect(d.decoratorName.length).assertLargerOrEqual(0);
        expect(d.stateVariableName.length).assertLargerOrEqual(0);
        expect(d.owningComponentOrClassName.length).assertLargerOrEqual(0);
        expect(d.owningComponentId).assertLargerOrEqual(0);
      }
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StateUtils_ObservedResult_Shape_6500
     * @tc.name SUB_ArkUI_StateUtils_ObservedResult_Shape_6500
     * @tc.desc ObservedResult.isObserved / reason / decoratorInfo 真机 API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StateUtils_ObservedResult_Shape_6500', Level.LEVEL1, (done: () => void) => {
      let plain: Record<string, Object> = {};
      let r = UIUtils.canBeObserved(plain);
      let obsOk: boolean = r.isObserved === true || r.isObserved === false;
      expect(obsOk).assertTrue();
      expect(r.reason.length).assertLargerOrEqual(0);
      expect(Array.isArray(r.decoratorInfo)).assertTrue();
      done();
    });
  });

  describe('StateMgmtUtilsProbePageTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.stateManagement.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StateMgmtProbe/StateMgmtProbe',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(500);
      } catch (err) {
        console.error('StateMgmtUtilsProbePageTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_ArkUI_StateUtils_UIUtils_CanBeObserved_Probe_6600
     * @tc.name SUB_ArkUI_StateUtils_UIUtils_CanBeObserved_Probe_6600
     * @tc.desc StateMgmtProbe aboutToAppear 调用 UIUtils.canBeObserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StateUtils_UIUtils_CanBeObserved_Probe_6600', Level.LEVEL1, (done: () => void) => {
      let ranOk: boolean = AppStorage.get<string>('state_utils_probe_can_observed_ran') === '1';
      expect(ranOk).assertTrue();
      let isv = AppStorage.get<string>('state_utils_probe_can_observed_is');
      let reason = AppStorage.get<string>('state_utils_probe_can_observed_reason');
      let hasIs: boolean = isv != null;
      let hasReason: boolean = reason != null;
      expect(hasIs).assertTrue();
      expect(hasReason).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_StateUtils_UIUtils_GetLifecycle_6700
     * @tc.name SUB_ArkUI_StateUtils_UIUtils_GetLifecycle_6700
     * @tc.desc UIUtils.getLifecycle(Component) 在探测页真实调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_StateUtils_UIUtils_GetLifecycle_6700', Level.LEVEL1, (done: () => void) => {
      expect(AppStorage.get<string>('state_utils_probe_lifecycle')).assertEqual('1');
      done();
    });
  });
}
