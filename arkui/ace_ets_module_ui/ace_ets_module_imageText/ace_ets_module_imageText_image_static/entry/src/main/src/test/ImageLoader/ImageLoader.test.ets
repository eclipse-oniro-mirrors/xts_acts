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

export default function ImageLoaderTest() {
  describe('ImageLoaderTest', () => {
    beforeAll(() => {
      console.info("ImageLoaderTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageLoaderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageLoader/ImageLoader',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageLoaderTest state pages:" + JSON.stringify(pages));
        if (!("ImageLoader" == pages.name)) {
          console.info("get ImageLoaderTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageLoaderTest page error:" + err);
      }
      console.info("ImageLoaderTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageLoaderTest after each called");
    });

    /**
     * @tc.number   ImageLoader_static_001
     * @tc.name     ImageLoader_static_001
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL0
     */
    it('ImageLoader_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageLoader_static_001 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('load'));
      await (button1?.click() as Promise<void>);
      console.info('Controller1 click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('loadText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageLoader_static_001 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('imageWidth:130,imageHeight:170');
      done();
    })
    /**
     * @tc.number   ImageLoader_static_002
     * @tc.name     ImageLoader_static_002
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL0
     */
    it('ImageLoader_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageLoader_static_002 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('loadSync'));
      await (button1?.click() as Promise<void>);
      console.info('loadSync click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('loadSyncText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageLoader_static_002 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('imageWidth:265,imageHeight:352');
      done();
    })
    /**
     * @tc.number   ImageLoader_static_003
     * @tc.name     ImageLoader_static_003
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL0
     */
    it('ImageLoader_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageLoader_static_003 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('loadError'));
      await (button1?.click() as Promise<void>);
      console.info('loadError click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('loadErrorText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageLoader_static_003 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('111001');
      done();
    })
    /**
     * @tc.number   ImageLoader_static_004
     * @tc.name     ImageLoader_static_004
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL0
     */
    it('ImageLoader_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImageLoader_static_004 START');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.id('loadSyncError'));
      await (button1?.click() as Promise<void>);
      console.info('loadSyncError click success');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('loadSyncErrorText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageLoader_static_004 is: ' + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('111001');
      done();
    })
  })
}