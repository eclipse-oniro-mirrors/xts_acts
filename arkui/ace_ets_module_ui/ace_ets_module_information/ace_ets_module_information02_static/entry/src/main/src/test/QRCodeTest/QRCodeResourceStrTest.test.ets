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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function qRCodeResourceStrTest() {
  describe('qRCodeResourceStrTest', () => {
    beforeAll(() => {
      console.info("QRCodeResourceStrTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("QRCodeResourceStrTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/QRCode/QRCodeResourceStr',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get QRCodeResourceStrTest state pages:" + JSON.stringify(pages));
        if (!("QRCodeResourceStr" == pages.name)) {
          console.info("get QRCodeResourceStrTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push QRCodeResourceStrTest page error:" + err);
      }
      console.info("QRCodeResourceStrTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("QRCodeResourceStrTest after each called");
    });

    /**
     * @tc.name   QRCodeResourceStrTest_001
     * @tc.number QRCodeResourceStrTest_001
     * @tc.desc   To test the value: $r('app.string.module_desc')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('QRCodeResourceStrTest_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('QRCodeResourceStrTest_001 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('QRCodeResource');
      let obj = JSON.parseJsonElement(strJson);
      console.info('QRCodeResourceStrTest_001 component obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('module description');
      console.info('[QRCodeResourceStrTest_001] END');
      done();
    });

    /**
     * @tc.name   QRCodeResourceStrTest_002
     * @tc.number QRCodeResourceStrTest_002
     * @tc.desc   To test the value: resourceStr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('QRCodeResourceStrTest_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('QRCodeResourceStrTest_002 START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('QRCode3Resource');
      let obj = JSON.parseJsonElement(strJson);
      console.info('QRCodeResourceStrTest_002 component obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('resourceStr');
      console.info('[QRCodeResourceStrTest_002] END');
      done();
    });
  })
}
