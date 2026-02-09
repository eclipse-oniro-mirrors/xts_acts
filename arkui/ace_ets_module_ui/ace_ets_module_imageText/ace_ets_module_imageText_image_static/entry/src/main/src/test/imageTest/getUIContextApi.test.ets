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

export default function getUIContextApiTest() {
  describe('getUIContextApiTest', () => {
    beforeAll(() => {
      console.info("getUIContextApiTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("getUIContextApiTest after each called");
    });
    /**
     * @tc.number   getUIContextApi01Test_static_001
     * @tc.name     getUIContextApi01Test_static_001
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL0
     */
    it('getUIContextApi01Test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi01Test_static_001 START');
      let PAGE_TAG = 'getUIContextApi01';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi01Test_static_001 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      console.info('Button001 click success');
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi01_text001');
      console.info('getUIContextApi01_text001 success');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi01Test_static_001 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageCacheCount = 50');
      done();
    })
    /**
     * @tc.number   getUIContextApi01Test_static_002
     * @tc.name     getUIContextApi01Test_static_002
     * @tc.desc     Test the setImageRawDataCacheSize interface to set normal values
     * @tc.level    Level.LEVEL0
     */
    it('getUIContextApi01Test_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi01Test_static_002 START');
      let PAGE_TAG = 'getUIContextApi01';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi01Test_static_002 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi01_text002');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi01Test_static_002 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageRawDataCacheSize = 10485760(B)');
      done();
    })
    /**
     * @tc.number   getUIContextApi02Test_static_001
     * @tc.name     getUIContextApi02Test_static_001
     * @tc.desc     Test the setImageCacheCount interface to set 0
     * @tc.level    Level.LEVEL2
     */
    it('getUIContextApi02Test_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi02Test_static_001 START');
      let PAGE_TAG = 'getUIContextApi02';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi02Test_static_001 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi02_text001');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi02Test_static_001 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageCacheCount = 0');
      done();
    })
    /**
     * @tc.number   getUIContextApi02Test_static_002
     * @tc.name     getUIContextApi02Test_static_002
     * @tc.desc     Test the setImageRawDataCacheSize interface to set 0
     * @tc.level    Level.LEVEL2
     */
    it('getUIContextApi02Test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi02Test_static_002 START');
      let PAGE_TAG = 'getUIContextApi02';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi02Test_static_002 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi02_text002');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi02Test_static_002 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageRawDataCacheSize = 0');
      done();
    })
    /**
     * @tc.number   getUIContextApi03Test_static_001
     * @tc.name     getUIContextApi03Test_static_001
     * @tc.desc     Test the setImageCacheCount interface to set 1
     * @tc.level    Level.LEVEL2
     */
    it('getUIContextApi03Test_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi03Test_static_001 START');
      let PAGE_TAG = 'getUIContextApi03';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi03Test_static_001 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi03_text001');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi03Test_static_001 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageCacheCount = 1');
      done();
    })
    /**
     * @tc.number   getUIContextApi03Test_static_002
     * @tc.name     getUIContextApi03Test_static_002
     * @tc.desc     Test the setImageRawDataCacheSize interface to set 1
     * @tc.level    Level.LEVEL2
     */
    it('getUIContextApi03Test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi03Test_static_002 START');
      let PAGE_TAG = 'getUIContextApi03';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi03Test_static_002 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi03_text002');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi03Test_static_002 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageRawDataCacheSize = 1');
      done();
    })
    /**
     * @tc.number   getUIContextApi04Test_static_001
     * @tc.name     getUIContextApi04Test_static_001
     * @tc.desc     Test the setImageCacheCount interface to set maximum
     * @tc.level    Level.LEVEL2
     */
    it('getUIContextApi04Test_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi04Test_static_001 START');
      let PAGE_TAG = 'getUIContextApi04';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi04Test_static_001 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi04_text001');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi04Test_static_001 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageCacheCount = 2147483647');
      done();
    })
    /**
     * @tc.number   getUIContextApi04Test_static_002
     * @tc.name     getUIContextApi04Test_static_002
     * @tc.desc     Test the setImageRawDataCacheSize interface to set maximum
     * @tc.level    Level.LEVEL2
     */
    it('getUIContextApi04Test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('getUIContextApi04Test_static_002 START');
      let PAGE_TAG = 'getUIContextApi04';
      await Utils.pushPage(`image/${PAGE_TAG}`);
      console.info('getUIContextApi04Test_static_002 page success');
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('Button001'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(100);
      let strJson = inspector.getInspectorByKey('getUIContextApi04_text002');
      let obj = JSON.parseJsonElement(strJson);
      let hdr: string = obj.getElement('$attrs').getString('content');
      console.info('getUIContextApi04Test_static_002 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('setImageRawDataCacheSize = 2147483647');
      done();
    })
  })
}
