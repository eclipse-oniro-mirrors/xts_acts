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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
const SLEEP_TIME_S = 100;

export default function ImageContentTransitionTest() {
  describe('ImageContentTransitionTest', () => {
    beforeAll(() => {
      console.info("ImageContentTransitionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageContentTransitionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageContentTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageContentTransitionTest state pages:" + JSON.stringify(pages));
        if (!("ImageContentTransition" == pages.name)) {
          console.info("get ImageContentTransitionTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageContentTransitionTest page error:" + err);
      }
      console.info("ImageContentTransitionTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageContentTransitionTest after each called");
    });
    /**
     * @tc.number   ContentTransition_static_001
     * @tc.name     ContentTransition_static_001
     * @tc.desc     Test the contentTransition interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ContentTransition_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContentTransition_static_001 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ContentTransition001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('ContentTransition001');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ContentTransition_static_001 is: ' + obj.getElement('$attrs').getString('contentTransition'));
      expect(obj.getElement('$attrs').getString('contentTransition')).assertEqual('ContentTransitionEffect.IDENTITY');
      done();
    })
    /**
     * @tc.number   ContentTransition_static_002
     * @tc.name     ContentTransition_static_002
     * @tc.desc     Test the contentTransition interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ContentTransition_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContentTransition_static_002 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ContentTransition002'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('ContentTransition002');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ContentTransition_static_002 is: ' + obj.getElement('$attrs').getString('contentTransition'));
      expect(obj.getElement('$attrs').getString('contentTransition')).assertEqual('ContentTransitionEffect.OPACITY');
      done();
    })
    /**
     * @tc.number   ContentTransition_static_003
     * @tc.name     ContentTransition_static_003
     * @tc.desc     Test the contentTransition interface to set undefined
     * @tc.level    Level.LEVEL2
     */
    it('ContentTransition_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ContentTransition_static_003 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ContentTransition003'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('ContentTransition003');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ContentTransition_static_003 is: ' + obj.getElement('$attrs').getString('contentTransition'));
      expect(obj.getElement('$attrs').getString('contentTransition')).assertEqual('ContentTransitionEffect.IDENTITY');
      done();
    })
    /**
     * @tc.number   ContentTransition_static_004
     * @tc.name     ContentTransition_static_004
     * @tc.desc     Test the contentTransition interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ContentTransition_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContentTransition_static_004 START');
      let strJson = inspector.getInspectorByKey('ContentTransition004');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ContentTransition_static_004 is: ' + obj.getElement('$attrs').getString('contentTransition'));
      expect(obj.getElement('$attrs').getString('contentTransition')).assertEqual('ContentTransitionEffect.IDENTITY');
      done();
    })
    /**
     * @tc.number   ContentTransition_static_005
     * @tc.name     ContentTransition_static_005
     * @tc.desc     Test the contentTransition interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ContentTransition_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContentTransition_static_005 START');
      let strJson = inspector.getInspectorByKey('ContentTransition005');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ContentTransition_static_005 is: ' + obj.getElement('$attrs').getString('contentTransition'));
      expect(obj.getElement('$attrs').getString('contentTransition')).assertEqual('ContentTransitionEffect.OPACITY');
      done();
    })
    /**
     * @tc.number   ContentTransition_static_006
     * @tc.name     ContentTransition_static_006
     * @tc.desc     Test the contentTransition interface to set undefined
     * @tc.level    Level.LEVEL1
     */
    it('ContentTransition_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContentTransition_static_006 START');
      let strJson = inspector.getInspectorByKey('ContentTransition006');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ContentTransition_static_006 is: ' + obj.getElement('$attrs').getString('contentTransition'));
      expect(obj.getElement('$attrs').getString('contentTransition')).assertEqual('ContentTransitionEffect.IDENTITY');
      done();
    })
  })
}