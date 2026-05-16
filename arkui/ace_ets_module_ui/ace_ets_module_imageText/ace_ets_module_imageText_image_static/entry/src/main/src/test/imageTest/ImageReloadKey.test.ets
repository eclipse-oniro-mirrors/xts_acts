'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function ImageReloadKeyTest() {
  describe('ImageReloadKeyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageReloadKeyTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageReloadKeyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageReloadKey',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageReloadKeyTest state pages:" + JSON.stringify(pages));
        if (!("ImageReloadKey" == pages.name)) {
          console.info("get ImageReloadKeyTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageReloadKeyTest page error:" + err);
      }
      console.info("ImageReloadKeyTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageReloadKeyTest after each called");
    });
    /**
     * @tc.number   SUB_ARKUI_IMAGE_RELOAD_PARAM_0100
     * @tc.name     ImageReloadKeyTest_static_001
     * @tc.desc     Test Image reloadKey constructor parameter with normal string value
     * @tc.level    Level.LEVEL1
     */
    it('ImageReloadKeyTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageReloadKeyTest_static_001 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('reloadKeyImage1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageReloadKeyTest_static_001 reloadKey is: ' + obj.getElement('$attrs').getString('reloadKey'));
      expect(obj.getElement('$attrs').getString('reloadKey')).assertEqual('key1');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_RELOAD_PARAM_0200
     * @tc.name     ImageReloadKeyTest_static_002
     * @tc.desc     Test Image reloadKey constructor parameter with different string value
     * @tc.level    Level.LEVEL1
     */
    it('ImageReloadKeyTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageReloadKeyTest_static_002 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('reloadKeyImage2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageReloadKeyTest_static_002 reloadKey is: ' + obj.getElement('$attrs').getString('reloadKey'));
      expect(obj.getElement('$attrs').getString('reloadKey')).assertEqual('key2');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_RELOAD_PARAM_0300
     * @tc.name     ImageReloadKeyTest_static_003
     * @tc.desc     Test Image reloadKey constructor parameter with empty string
     * @tc.level    Level.LEVEL2
     */
    it('ImageReloadKeyTest_static_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageReloadKeyTest_static_003 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('reloadKeyImage3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageReloadKeyTest_static_003 reloadKey is: ' + obj.getElement('$attrs').getString('reloadKey'));
      expect(obj.getElement('$attrs').getString('reloadKey')).assertEqual('');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_RELOAD_PARAM_0400
     * @tc.name     ImageReloadKeyTest_static_004
     * @tc.desc     Test Image reloadKey dynamic change via state variable
     * @tc.level    Level.LEVEL1
     */
    it('ImageReloadKeyTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageReloadKeyTest_static_004 START');
      const driver = Driver.create();
      // Check initial reloadKey value
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('reloadKeyImage4');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageReloadKeyTest_static_004 initial reloadKey is: ' + obj.getElement('$attrs').getString('reloadKey'));
      expect(obj.getElement('$attrs').getString('reloadKey')).assertEqual('key4');
      // Click button to change reloadKey
      const button = await driver.findComponent(ON.id('changeKey4Btn'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_S);
      // Check updated reloadKey value
      let strJsonAfter = inspector.getInspectorByKey('reloadKeyImage4');
      let objAfter = JSON.parseJsonElement(strJsonAfter);
      console.info('ImageReloadKeyTest_static_004 after click reloadKey is: ' + objAfter.getElement('$attrs').getString('reloadKey'));
      expect(objAfter.getElement('$attrs').getString('reloadKey')).assertEqual('key4_new');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_RELOAD_PARAM_0500
     * @tc.name     ImageReloadKeyTest_static_005
     * @tc.desc     Test Image reloadKey with AttributeModifier dynamic change
     * @tc.level    Level.LEVEL2
     */
    it('ImageReloadKeyTest_static_005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageReloadKeyTest_static_005 START');
      const driver = Driver.create();
      // Check initial reloadKey value
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('reloadKeyImage5');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageReloadKeyTest_static_005 initial reloadKey is: ' + obj.getElement('$attrs').getString('reloadKey'));
      expect(obj.getElement('$attrs').getString('reloadKey')).assertEqual('key5');
      // Click button to change reloadKey
      const button = await driver.findComponent(ON.id('changeKey5Btn'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(SLEEP_TIME_S);
      // Check updated reloadKey value
      let strJsonAfter = inspector.getInspectorByKey('reloadKeyImage5');
      let objAfter = JSON.parseJsonElement(strJsonAfter);
      console.info('ImageReloadKeyTest_static_005 after click reloadKey is: ' + objAfter.getElement('$attrs').getString('reloadKey'));
      expect(objAfter.getElement('$attrs').getString('reloadKey')).assertEqual('key5_new');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_RELOAD_PARAM_0600
     * @tc.name     ImageReloadKeyTest_static_006
     * @tc.desc     Test Image without reloadKey parameter (default value should be empty)
     * @tc.level    Level.LEVEL2
     */
    it('ImageReloadKeyTest_static_006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageReloadKeyTest_static_006 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('reloadKeyImage6');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageReloadKeyTest_static_006 reloadKey is: ' + obj.getElement('$attrs').getString('reloadKey'));
      expect(obj.getElement('$attrs').getString('reloadKey')).assertEqual('');
      done();
    })
  })
}