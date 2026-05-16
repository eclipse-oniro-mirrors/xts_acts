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
import { Driver } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/RotateAngleOptions/RotateAngleOptionsIndex';
const PAGE_NAME = 'RotateAngleOptionsIndex';

function getRotateAttrByKey(key: string, attrName: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getElement('rotate').getString(attrName);
}

export default function RotateAngleOptionsTest() {
  describe('RotateAngleOptionsTest', () => {
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
     * @tc.number RotateAngleOptionsTest_001
     * @tc.name angleX
     * @tc.desc Verify RotateAngleOptions.angleX property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('angleX', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionsangleX', 'angleX')).assertEqual('10.000000');
      } catch (error) {
        console.error('angleX error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RotateAngleOptionsTest_002
     * @tc.name angleY
     * @tc.desc Verify RotateAngleOptions.angleY property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('angleY', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionsangleY', 'angleY')).assertEqual('20.000000');
      } catch (error) {
        console.error('angleY error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RotateAngleOptionsTest_003
     * @tc.name angleZ
     * @tc.desc Verify RotateAngleOptions.angleZ property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('angleZ', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionsangleZ', 'angleZ')).assertEqual('30.000000');
      } catch (error) {
        console.error('angleZ error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RotateAngleOptionsTest_004
     * @tc.name centerX
     * @tc.desc Verify RotateAngleOptions.centerX property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('centerX', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionscenterX', 'centerX')).assertEqual('20.00vp');
      } catch (error) {
        console.error('centerX error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RotateAngleOptionsTest_005
     * @tc.name centerY
     * @tc.desc Verify RotateAngleOptions.centerY property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('centerY', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionscenterY', 'centerY')).assertEqual('30.00vp');
      } catch (error) {
        console.error('centerY error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RotateAngleOptionsTest_006
     * @tc.name centerZ
     * @tc.desc Verify RotateAngleOptions.centerZ property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('centerZ', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionscenterZ', 'centerZ')).assertEqual('10.00vp');
      } catch (error) {
        console.error('centerZ error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RotateAngleOptionsTest_007
     * @tc.name perspective
     * @tc.desc Verify RotateAngleOptions.perspective property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('perspective', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await CommonFunc.sleep(300);
        expect(getRotateAttrByKey('RotateAngleOptionsperspective', 'perspective')).assertEqual('1.000000');
      } catch (error) {
        console.error('perspective error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
