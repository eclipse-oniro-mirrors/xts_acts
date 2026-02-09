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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium';
// 导入测试依赖kit
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function ImageHDRBrightnessTest() {
  describe('ImageHDRBrightnessTest', () => {
    beforeAll(() => {
      console.info("ImageHDRBrightnessTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api19.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageHDRBrightnessTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageHdrBrightness/ImageHdrBrightness',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageHDRBrightnessTest state pages:" + JSON.stringify(pages));
        if (!("ImageHdrBrightness" == pages.name)) {
          console.info("get ImageHDRBrightnessTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ImageHDRBrightnessTest page error:" + err);
      }
      console.info("ImageHDRBrightnessTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ImageHDRBrightnessTest after each called");
    });
    /**
         * @tc.number   ImageHDRBrightnessTest_static_001
         * @tc.name     ImageHDRBrightnessTest_static_001
         * @tc.desc     ImageHDRBrightnessTest_static_001
         * @tc.level    Level.LEVEL0
         */
    it('ImageHDRBrightnessTest_static_001',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr00'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('0.0');
      done();
    })
    /**
         * @tc.number   ImageHDRBrightnessTest_static_002
         * @tc.name     ImageHDRBrightnessTest_static_002
         * @tc.desc     ImageHDRBrightnessTest_static_002
         * @tc.level    Level.LEVEL0
         */
    it('ImageHDRBrightnessTest_static_002',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr03'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('0.3');
      done();
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_003
     * @tc.name     ImageHDRBrightnessTest_static_003
     * @tc.desc     ImageHDRBrightnessTest_static_003
     * @tc.level    Level.LEVEL0
     */
    it('ImageHDRBrightnessTest_static_003',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr08'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('0.8');
      done()
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_004
     * @tc.name     ImageHDRBrightnessTest_static_004
     * @tc.desc     ImageHDRBrightnessTest_static_004
     * @tc.level    Level.LEVEL0
     */
    it('ImageHDRBrightnessTest_static_004',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr10'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_005
     * @tc.name     ImageHDRBrightnessTest_static_005
     * @tc.desc     ImageHDRBrightnessTest_static_005
     * @tc.level    Level.LEVEL2
     */
    it('ImageHDRBrightnessTest_static_005',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr_1'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_006
     * @tc.name     ImageHDRBrightnessTest_static_006
     * @tc.desc     ImageHDRBrightnessTest_static_006
     * @tc.level    Level.LEVEL0
     */
    it('ImageHDRBrightnessTest_static_006',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr20'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_007
     * @tc.name     ImageHDRBrightnessTest_static_007
     * @tc.desc     ImageHDRBrightnessTest_static_007
     * @tc.level    Level.LEVEL0
     */
    it('ImageHDRBrightnessTest_static_007',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr20'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_008
     * @tc.name     ImageHDRBrightnessTest_static_008
     * @tc.desc     ImageHDRBrightnessTest_static_008
     * @tc.level    Level.LEVEL0
     */
    it('ImageHDRBrightnessTest_static_008',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdrNull'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    /**
     * @tc.number   ImageHDRBrightnessTest_static_009
     * @tc.name     ImageHDRBrightnessTest_static_009
     * @tc.desc     ImageHDRBrightnessTest_static_009
     * @tc.level    Level.LEVEL0
     */
    it('ImageHDRBrightnessTest_static_009',Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdrUndefined'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('hdrImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    /**
         * @tc.number   ImageHDRBrightnessTest_static_010
         * @tc.name     ImageHDRBrightnessTest_static_010
         * @tc.desc     ImageHDRBrightnessTest_static_010
         * @tc.level    Level.LEVEL0
         */
    it('ImageHDRBrightnessTest_static_010',Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('noHdrBrightnessImageKey');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: number = obj.getElement('$attrs').getDouble('hdrBrightness')
      console.info('hdrBrightness is: ' + obj.getElement('$attrs').getDouble('hdrBrightness'));
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done();
    })

  })
}
