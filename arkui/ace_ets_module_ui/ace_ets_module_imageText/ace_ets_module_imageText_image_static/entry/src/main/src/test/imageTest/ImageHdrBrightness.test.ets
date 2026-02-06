'use static';
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
export default function ImageHdrBrightnessTest() {
  describe('ImageHdrBrightnessTest', () => {
    beforeAll(() => {
      console.info("ImageHdrBrightnessTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageHdrBrightnessTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageHdrBrightness',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageHdrBrightnessTest state pages:" + JSON.stringify(pages));
        if (!("ImageHdrBrightness" == pages.name)) {
          console.info("get ImageHdrBrightnessTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageHdrBrightnessTest page error:" + err);
      }
      console.info("ImageHdrBrightnessTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageHdrBrightnessTest after each called");
    });

    /**
     * @tc.name   ImageHDRBrightnessTest_001
     * @tc.number ImageHDRBrightnessTest_001
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageHDRBrightnessTest_001 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr00'));
      await (button?.click() as Promise<void>);
      console.info('ImageHDRBrightnessTest_001 click');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageHDRBrightnessTest_001 strJson');
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness');
      console.info('ImageHDRBrightnessTest_001 hdr');
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('0.0');

      let strJson1 = inspector.getInspectorByKey('modifier2');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness');
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('0.0');
      done();
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_002
     * @tc.number ImageHDRBrightnessTest_002
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('ImageHDRBrightnessTest_002 START');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr03'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness');
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('0.3');

      let strJson1 = inspector.getInspectorByKey('modifier3');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('0.3');
      done();
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_003
     * @tc.number ImageHDRBrightnessTest_003
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr08'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('0.8');

      let strJson1 = inspector.getInspectorByKey('modifier4');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('0.8');
      done()
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_004
     * @tc.number ImageHDRBrightnessTest_004
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr10'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      let strJson1 = inspector.getInspectorByKey('modifier5');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('1.0');
      done()
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_005
     * @tc.number ImageHDRBrightnessTest_005
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr_1'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');

      let strJson1 = inspector.getInspectorByKey('modifier6');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('1.0');
      done()
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_006
     * @tc.number ImageHDRBrightnessTest_006
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr20'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');

      let strJson1 = inspector.getInspectorByKey('modifier7');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('1.0');
      done()
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_007
     * @tc.number ImageHDRBrightnessTest_007
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdrUndefined'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');

      let strJson1 = inspector.getInspectorByKey('modifier1');
      let obj1 = JSON.parseJsonElement(strJson1);
      let hdr1: number = obj1.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj1.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr1.toFixed(1)).assertEqual('1.0');
      done()
    })

    /**
     * @tc.name   ImageHDRBrightnessTest_008
     * @tc.number ImageHDRBrightnessTest_008
     * @tc.desc   test the ImageHDRBrightness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageHDRBrightnessTest_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('noHdrBrightnessImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done();
    })
  })
}
