'use static';
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function PointsUndefinedModifierTest() {
  describe('PointsUndefinedModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('PointsUndefinedModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Polyline/pointsUndefinedModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get PointsUndefinedModifierTest state pages:' + JSON.stringify(pages));
        if (!('pointsUndefinedModifier' == pages.name)) {
          console.info('get PointsUndefinedModifierTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push PointsUndefinedModifierTest page error:' + err);
      }
      console.info('PointsUndefinedModifierTest beforeEach end');
    });

    /**
     * @tc.number    PointsUndefinedModifierTest_static_0100
     * @tc.name      PointsUndefinedModifierTest_static_0100
     * @tc.desc      PointsUndefinedModifierTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('PointsUndefinedModifierTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PointsUndefinedModifierTest_static_0100] START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let points_action = await driver.findComponent(ON.id('points_action_modifier')) as Component;
      await points_action.click();
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('polyline_action_modifier');
      let pointsValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('points');
      expect(pointsValue.asBoolean()).assertEqual(true);

      await points_action.click();
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('polyline_action_modifier');
      let pointsValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('points');
      expect(pointsValue1.asBoolean()).assertEqual(false);

      console.info('[PointsUndefinedModifierTest_static_0100] END');
      done();
    });

  })
}
