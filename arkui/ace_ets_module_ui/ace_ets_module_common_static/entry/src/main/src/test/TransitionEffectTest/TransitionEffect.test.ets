'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/TransitionEffect/TransitionEffectIndex';
const PAGE_NAME = 'TransitionEffectIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

async function clickById(driver: Driver, id: string): Promise<void> {
  const btn = await driver.findComponent(ON.id(id));
  expect(btn !== null).assertTrue();
  if (btn === null) {
    throw new Error('button not found: ' + id);
  }
  await (btn.click() as Promise<void>);
}

export default function TransitionEffectTest() {
  describe('TransitionEffectTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number TransitionEffectTest_001
     * @tc.name identity
     * @tc.desc Verify TransitionEffect.IDENTITY static getter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('identity', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'transitionIdentityBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('transitionIdentityStatus')).assertEqual('identity_ok');
      } catch (error) {
        console.error('identity error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number TransitionEffectTest_002
     * @tc.name slide
     * @tc.desc Verify TransitionEffect.SLIDE static getter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('slide', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'transitionSlideBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('transitionSlideStatus')).assertEqual('slide_ok');
      } catch (error) {
        console.error('slide error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number TransitionEffectTest_003
     * @tc.name slideSwitch
     * @tc.desc Verify TransitionEffect.SLIDE_SWITCH static getter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('slideSwitch', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'transitionSlideSwitchBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('transitionSlideSwitchStatus')).assertEqual('slideSwitch_ok');
      } catch (error) {
        console.error('slideSwitch error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
