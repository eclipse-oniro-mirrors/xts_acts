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

export default function ImageSupportSvg2Test() {
  describe('ImageSupportSvg2Test', () => {
    beforeAll(() => {
      console.info("ImageSupportSvg2Test beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageSupportSvg2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageSupportSvg2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageSupportSvg2Test state pages:" + JSON.stringify(pages));
        if (!("ImageSupportSvg2" == pages.name)) {
          console.info("get ImageSupportSvg2Test pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push ImageSupportSvg2Test page error:" + err);
      }
      console.info("ImageSupportSvg2Test beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ImageSupportSvg2Test after each called");
    });
    /**
     * @tc.number   ImageSupportSvg2_static_001
     * @tc.name     ImageSupportSvg2_static_001
     * @tc.desc     Test the supportSvg2 interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ImageSupportSvg2_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageSupportSvg2_static_001 START');
      let strJson = inspector.getInspectorByKey('supportSvg2_001');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageSupportSvg2_static_001 is: ' + obj.getElement('$attrs').getString('supportSvg2'));
      expect(obj.getElement('$attrs').getString('supportSvg2')).assertEqual('true');
      done();
    })
    /**
     * @tc.number   ImageSupportSvg2_static_002
     * @tc.name     ImageSupportSvg2_static_002
     * @tc.desc     Test the supportSvg2 interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('ImageSupportSvg2_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageSupportSvg2_static_002 START');
      let strJson = inspector.getInspectorByKey('supportSvg2_002');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageSupportSvg2_static_002 is: ' + obj.getElement('$attrs').getString('supportSvg2'));
      expect(obj.getElement('$attrs').getString('supportSvg2')).assertEqual('false');
      done();
    })
    /**
     * @tc.number   supportSvg2_static_003
     * @tc.name     supportSvg2_static_003
     * @tc.desc     Test the supportSvg2 interface to set undefined
     * @tc.level    Level.LEVEL1
     */
    it('supportSvg2_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('supportSvg2_static_003 START');
      let strJson = inspector.getInspectorByKey('supportSvg2_003');
      let obj = JSON.parseJsonElement(strJson);
      console.info('supportSvg2_static_003 is: ' + obj.getElement('$attrs').getString('supportSvg2'));
      expect(obj.getElement('$attrs').getString('supportSvg2')).assertEqual('false');
      done();
    })
    /**
     * @tc.number   supportSvg2_static_004
     * @tc.name     supportSvg2_static_004
     * @tc.desc     Test the supportSvg2 interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('supportSvg2_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('supportSvg2_static_004 START');
      let strJson = inspector.getInspectorByKey('supportSvg2_004');
      let obj = JSON.parseJsonElement(strJson);
      console.info('supportSvg2_static_004 is: ' + obj.getElement('$attrs').getString('supportSvg2'));
      expect(obj.getElement('$attrs').getString('supportSvg2')).assertEqual('true');
      done();
    })
    /**
     * @tc.number   supportSvg2_static_005
     * @tc.name     supportSvg2_static_005
     * @tc.desc     Test the supportSvg2 interface to set normal values
     * @tc.level    Level.LEVEL1
     */
    it('supportSvg2_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('supportSvg2_static_005 START');
      let strJson = inspector.getInspectorByKey('supportSvg2_005');
      let obj = JSON.parseJsonElement(strJson);
      console.info('supportSvg2_static_005 is: ' + obj.getElement('$attrs').getString('supportSvg2'));
      expect(obj.getElement('$attrs').getString('supportSvg2')).assertEqual('false');
      done();
    })
    /**
     * @tc.number   supportSvg2_static_006
     * @tc.name     supportSvg2_static_006
     * @tc.desc     Test the supportSvg2 interface to set undefined
     * @tc.level    Level.LEVEL1
     */
    it('supportSvg2_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('supportSvg2_static_006 START');
      let strJson = inspector.getInspectorByKey('supportSvg2_006');
      let obj = JSON.parseJsonElement(strJson);
      console.info('supportSvg2_static_006 is: ' + obj.getElement('$attrs').getString('supportSvg2'));
      expect(obj.getElement('$attrs').getString('supportSvg2')).assertEqual('false');
      done();
    })
  })
}