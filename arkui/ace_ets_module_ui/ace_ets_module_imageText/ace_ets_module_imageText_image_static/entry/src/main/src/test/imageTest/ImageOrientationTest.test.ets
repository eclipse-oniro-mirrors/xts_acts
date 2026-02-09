'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';


export default function ImageOrientationTest() {
  describe('ImageOrientationTest', () => {
    beforeAll(() => {
      console.info("ImageOrientationTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageOrientationTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageOrientation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageOrientationTest state pages:" + JSON.stringify(pages));
        if (!("ImageOrientation" == pages.name)) {
          console.info("get ImageOrientationTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push ImageOrientationTest page error:" + err);
      }
      console.info("ImageOrientationTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ImageOrientationTest after each called");
    });


    /**
     * @tc.name   ImageOrientationTest_0001
     * @tc.number ImageOrientationTest_0001
     * @tc.desc   To test the orientation LEFT_MIRRORED 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageOrientationTest_0001 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('LEFT_MIRRORED_ID'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);

      let strJson = inspector.getInspectorByKey('imageOrientation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageOrientationTest_0001 ImageRotateOrientation.LEFT_MIRRORED component obj is: ' + obj.getElement('$attrs').getString('orientation'));
      expect(obj.getElement('$attrs').getString('orientation')).assertEqual('8');

      let strJson1 = inspector.getInspectorByKey('LEFT_MIRRORED_IDText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('ImageOrientationTest_0001 undefined component obj is: ' + obj1.getElement('$attrs').getString('orientation'));
      expect(obj1.getElement('$attrs').getString('orientation')).assertEqual('8');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0002
     * @tc.number ImageOrientationTest_0002
     * @tc.desc   To test the orientation RIGHT_MIRRORED 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageOrientationTest_0002 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('RIGHT_MIRRORED_ID'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);

      let strJson = inspector.getInspectorByKey('imageOrientation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageOrientationTest_0002 ImageRotateOrientation.RIGHT_MIRRORED component obj is: ' + obj.getElement('$attrs').getString('orientation'));
      expect(obj.getElement('$attrs').getString('orientation')).assertEqual('6');

      let strJson1 = inspector.getInspectorByKey('RIGHT_MIRRORED_IDText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('ImageOrientationTest_0002 undefined component obj is: ' + obj1.getElement('$attrs').getString('orientation'));
      expect(obj1.getElement('$attrs').getString('orientation')).assertEqual('6');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0003
     * @tc.number ImageOrientationTest_0003
     * @tc.desc   To test the orientation UP_MIRRORED 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageOrientationTest_0003 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('UP_MIRRORED_ID'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);

      let strJson = inspector.getInspectorByKey('imageOrientation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageOrientationTest_0003 ImageRotateOrientation.UP_MIRRORED component obj is: ' + obj.getElement('$attrs').getString('orientation'));
      expect(obj.getElement('$attrs').getString('orientation')).assertEqual('5');

      let strJson1 = inspector.getInspectorByKey('UP_MIRRORED_IDText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('ImageOrientationTest_0003 undefined component obj is: ' + obj1.getElement('$attrs').getString('orientation'));
      expect(obj1.getElement('$attrs').getString('orientation')).assertEqual('5');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0004
     * @tc.number ImageOrientationTest_0004
     * @tc.desc   To test the orientation DOWN_MIRRORED 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageOrientationTest_0004 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('DOWN_MIRRORED_ID'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);

      let strJson = inspector.getInspectorByKey('imageOrientation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageOrientationTest_0004 ImageRotateOrientation.DOWN_MIRRORED component obj is: ' + obj.getElement('$attrs').getString('orientation'));
      expect(obj.getElement('$attrs').getString('orientation')).assertEqual('7');

      let strJson1 = inspector.getInspectorByKey('DOWN_MIRRORED_IDText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('ImageOrientationTest_0004 undefined component obj is: ' + obj1.getElement('$attrs').getString('orientation'));
      expect(obj1.getElement('$attrs').getString('orientation')).assertEqual('7');
      done();
    });
  })
}