'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

const SLEEP_TIME = 1000;

export default function badgeResourceTest() {
  describe('badgeResourceTest', () => {
    beforeAll(() => {
      console.info("badgeResourceTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("badgeResourceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/BabgeBadgeParamWithString',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get badgeResourceTest state pages:" + JSON.stringify(pages));
        if (!("BabgeBadgeParamWithString" == pages.name)) {
          console.info("get badgeResourceTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push badgeResourceTest page error:" + err);
      }
      console.info("badgeResourceTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("badgeResourceTest after each called");
    });


    /**
     * @tc.name   badgeResourceTest_001
     * @tc.number badgeResourceTest_001
     * @tc.desc   FrameNode Badge Input Normal value: $r('app.string.text_string'),return value: text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_001 START');
      let strJson = inspector.getInspectorByKey('Badge_value_0100');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_003] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('text');
      console.info('[badgeResourceTest_003] END');
      done();
    });


    /**
     * @tc.name   badgeResourceTest_002
     * @tc.number badgeResourceTest_002
     * @tc.desc   FrameNode Badge Input Abnormal value: $r('app.media.icon'),return value: point
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_002 START');
      let strJson = inspector.getInspectorByKey('Badge_value_0200');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_002] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('point');
      console.info('[badgeResourceTest_002] END');
      done();
    });


    /**
     * @tc.name   badgeResourceTest_003
     * @tc.number badgeResourceTest_003
     * @tc.desc   Badge Input Normal value: $r('app.string.text_string'),return value: ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('badgeResourceTest_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('badgeResourceTest_003 START');
      let strJson = inspector.getInspectorByKey('Badge_value_0300');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[badgeResourceTest_003] obj is: ' + obj.getElement('$attrs').getString('value'));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('');
      console.info('[badgeResourceTest_003] END');
      done();
    });


  })
}
