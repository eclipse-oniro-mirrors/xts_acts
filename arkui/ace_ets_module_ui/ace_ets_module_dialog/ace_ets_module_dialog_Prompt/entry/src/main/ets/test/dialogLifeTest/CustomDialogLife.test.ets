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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function CustomDialogLifeTest() {
  describe('CustomDialogLifeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CustomDialogLifeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogLife/CustomDialogLife',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CustomDialogLifeTest state pages:' + JSON.stringify(pages));
        if (!('CustomDialogLife' == pages.name)) {
          console.info('get CustomDialogLifeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push CustomDialogLifeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CustomDialogLifeTest page error:' + err);
      }
      console.info('CustomDialogLifeTest beforeEach end');
      done();
    });

   /**
     * @tc.number    CustomDialogLife_0001
     * @tc.name      CustomDialogLife_0001
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CustomDialogLife_0001', Level.LEVEL2, async (done: Function) => {
      console.info('CustomDialogLife_0101 START');
      await CommonFunc.sleep(1000);
      sendEventByKey('CustomDialog',10,"")
      await CommonFunc.sleep(1000);
      console.info('CustomDialogLife_0101 click after')
      let customDialogFlag1 = getInspectorByKey('customDialogFlag1');
      expect(JSON.parse(customDialogFlag1).$attrs.content).assertEqual('true');
      let customDialogFlag2 = getInspectorByKey('customDialogFlag2');
      expect(JSON.parse(customDialogFlag2).$attrs.content).assertEqual('true');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.text('button'));
      await button.click();
      await CommonFunc.sleep(2000);
      let customDialogFlag3 = getInspectorByKey('customDialogFlag3');
      expect(JSON.parse(customDialogFlag3).$attrs.content).assertEqual('true');
      let customDialogFlag4 = getInspectorByKey('customDialogFlag4');
      expect(JSON.parse(customDialogFlag4).$attrs.content).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('CustomDialogLife_0100 END');
      done();
    });
  })
}