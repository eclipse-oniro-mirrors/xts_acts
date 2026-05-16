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

'use static';

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { LayoutPolicy } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function LayoutPolicyTest() {
  describe('LayoutPolicyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("LayoutPolicyTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.ets.module.common.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("LayoutPolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LayoutPolicy/LayoutPolicyIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("LayoutPolicyTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "LayoutPolicyIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("LayoutPolicyTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("LayoutPolicyTest after each called");
    });

    /**
     * @tc.number LayoutPolicyTest_001
     * @tc.name layoutPolicy_wrapContent_notNull
     * @tc.desc Test LayoutPolicy.wrapContent static readonly property is not null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_wrapContent_notNull', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_notNull START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let wc = LayoutPolicy.wrapContent;
        let fi = LayoutPolicy.fixAtIdealSize;
        console.info('LayoutPolicyTest: wrapContent != fixAtIdealSize = ' + (wc !== fi));
        expect(wc !== fi).assertEqual(true);
        console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_notNull END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_wrapContent_notNull error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LayoutPolicyTest_002
     * @tc.name layoutPolicy_fixAtIdealSize_notNull
     * @tc.desc Test LayoutPolicy.fixAtIdealSize static readonly property is not null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_fixAtIdealSize_notNull', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_notNull START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let fi = LayoutPolicy.fixAtIdealSize;
        let mp = LayoutPolicy.matchParent;
        console.info('LayoutPolicyTest: fixAtIdealSize != matchParent = ' + (fi !== mp));
        expect(fi !== mp).assertEqual(true);
        console.info('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_notNull END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_notNull error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LayoutPolicyTest_003
     * @tc.name layoutPolicy_wrapContent_notEqualFixAtIdealSize
     * @tc.desc Test LayoutPolicy.wrapContent and fixAtIdealSize are different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_wrapContent_notEqualFixAtIdealSize', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_notEqualFixAtIdealSize START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let wrapContent = LayoutPolicy.wrapContent;
        let fixAtIdealSize = LayoutPolicy.fixAtIdealSize;
        console.info('LayoutPolicyTest: wrapContent=' + wrapContent + ' fixAtIdealSize=' + fixAtIdealSize);
        expect(wrapContent === fixAtIdealSize).assertEqual(false);
        console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_notEqualFixAtIdealSize END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_wrapContent_notEqualFixAtIdealSize error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LayoutPolicyTest_004
     * @tc.name layoutPolicy_wrapContent_sameSingletonReference
     * @tc.desc Test LayoutPolicy.wrapContent returns same reference each time (static readonly)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_wrapContent_sameSingletonReference', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_sameSingletonReference START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let policy1 = LayoutPolicy.wrapContent;
        let policy2 = LayoutPolicy.wrapContent;
        console.info('LayoutPolicyTest: wrapContent same reference = ' + (policy1 === policy2));
        expect(policy1).assertEqual(policy2);
        console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_sameSingletonReference END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_wrapContent_sameSingletonReference error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LayoutPolicyTest_005
     * @tc.name layoutPolicy_fixAtIdealSize_sameSingletonReference
     * @tc.desc Test LayoutPolicy.fixAtIdealSize returns same reference each time (static readonly)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_fixAtIdealSize_sameSingletonReference', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_sameSingletonReference START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let policy1 = LayoutPolicy.fixAtIdealSize;
        let policy2 = LayoutPolicy.fixAtIdealSize;
        console.info('LayoutPolicyTest: fixAtIdealSize same reference = ' + (policy1 === policy2));
        expect(policy1).assertEqual(policy2);
        console.info('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_sameSingletonReference END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_sameSingletonReference error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LayoutPolicyTest_006
     * @tc.name layoutPolicy_wrapContent_componentRender
     * @tc.desc Test that a component with LayoutPolicy.wrapContent renders correctly via inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_wrapContent_componentRender', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_componentRender START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('wrapContentRow');
        console.info('LayoutPolicyTest: wrapContentRow inspector = ' + strJson);
        expect(strJson != null && strJson !== '').assertTrue();
        console.info('LayoutPolicyTest execute: layoutPolicy_wrapContent_componentRender END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_wrapContent_componentRender error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number LayoutPolicyTest_007
     * @tc.name layoutPolicy_fixAtIdealSize_componentRender
     * @tc.desc Test that a component with LayoutPolicy.fixAtIdealSize renders correctly via inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('layoutPolicy_fixAtIdealSize_componentRender', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_componentRender START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('fixAtIdealSizeRow');
        console.info('LayoutPolicyTest: fixAtIdealSizeRow inspector = ' + strJson);
        expect(strJson != null && strJson !== '').assertTrue();
        console.info('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_componentRender END');
        done();
      } catch (error) {
        console.error('LayoutPolicyTest execute: layoutPolicy_fixAtIdealSize_componentRender error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
