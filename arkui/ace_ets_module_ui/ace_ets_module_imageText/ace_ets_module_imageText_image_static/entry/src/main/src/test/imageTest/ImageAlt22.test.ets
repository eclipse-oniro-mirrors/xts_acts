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

export default function ImageAlt22Test() {
  describe('ImageAlt22Test', () => {
    beforeAll(() => {
      console.info("ImageAlt22Test beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageAlt22Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageAlt22',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageAlt22Test state pages:" + JSON.stringify(pages));
        if (!("ImageAlt22" == pages.name)) {
          console.info("get ImageAlt22Test pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageAlt22Test page error:" + err);
      }
      console.info("ImageAlt22Test beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageAlt22Test after each called");
    });
    /**
     * @tc.number   ImageAlt22Test_static_001
     * @tc.name     ImageAlt22Test_static_001
     * @tc.desc     Test the alt interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ImageAlt22Test_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageAlt22Test_static_001 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('image001');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageAlt22Test_static_001 is: ' + obj.getElement('$attrs').getString('altPlaceholder'));
      console.info('ImageAlt22Test_static_001 is: ' + obj.getElement('$attrs').getString('altError'));
      expect(obj.getElement('$attrs').getString('altPlaceholder')).assertEqual('/resources/rawfile/apple.jpg');
      expect(obj.getElement('$attrs').getString('altError')).assertEqual('/resources/rawfile/hand.png');
      done();
    })
    /**
     * @tc.number   ImageAlt22Test_static_002
     * @tc.name     ImageAlt22Test_static_002
     * @tc.desc     Test the alt interface to set undefined
     * @tc.level    Level.LEVEL2
     */
    it('ImageAlt22Test_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageAlt22Test_static_002 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('image002');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageAlt22Test_static_002 is: ' + obj.getElement('$attrs').getString('altPlaceholder'));
      console.info('ImageAlt22Test_static_002 is: ' + obj.getElement('$attrs').getString('altError'));
      expect(obj.getElement('$attrs').getString('altPlaceholder')).assertEqual('');
      expect(obj.getElement('$attrs').getString('altError')).assertEqual('');
      done();
    })
    /**
     * @tc.number   ImageAlt22Test_static_003
     * @tc.name     ImageAlt22Test_static_003
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL3
     */
    it('ImageAlt22Test_static_003', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('ImageAlt22Test_static_003 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('image003');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageAlt22Test_static_003 is: ' + obj.getElement('$attrs').getString('altPlaceholder'));
      console.info('ImageAlt22Test_static_003 is: ' + obj.getElement('$attrs').getString('altError'));
      expect(obj.getElement('$attrs').getString('altPlaceholder')).assertEqual('/resources/rawfile/apple.jpg');
      expect(obj.getElement('$attrs').getString('altError')).assertEqual('/resources/rawfile/hand.png');
      done();
    })
    /**
     * @tc.number   ImageAlt22Test_static_004
     * @tc.name     ImageAlt22Test_static_004
     * @tc.desc     Test the setImageCacheCount interface to set normal values
     * @tc.level    Level.LEVEL3
     */
    it('ImageAlt22Test_static_004', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('ImageAlt22Test_static_004 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('image004');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageAlt22Test_static_004 is: ' + obj.getElement('$attrs').getString('altPlaceholder'));
      console.info('ImageAlt22Test_static_004 is: ' + obj.getElement('$attrs').getString('altError'));
      expect(obj.getElement('$attrs').getString('altPlaceholder')).assertEqual('');
      expect(obj.getElement('$attrs').getString('altError')).assertEqual('');
      done();
    })
  })
}