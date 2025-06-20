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

export default function AlertDialogLifeTest() {
  describe('AlertDialogLifeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('AlertDialogLifeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogLife/AlertDialogLife',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get AlertDialogLifeTest state pages:' + JSON.stringify(pages));
        if (!('AlertDialogLife' == pages.name)) {
          console.info('get AlertDialogLifeTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push AlertDialogLifeTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push AlertDialogLifeTest page error:' + err);
      }
      console.info('AlertDialogLifeTest beforeEach end');
      done();
    });


    it('AlertDialogLife_0001', Level.LEVEL2, async (done: Function) => {
      console.info('AlertDialogLife_0001 START');
      await CommonFunc.sleep(1000);
      sendEventByKey('AlertDialog',10,"")
      await CommonFunc.sleep(1000);
      console.info('AlertDialogLife_0101 click after')
      let actionSheetFlag1 = getInspectorByKey('actionSheetFlag1');
      expect(JSON.parse(actionSheetFlag1).$attrs.content).assertEqual('true');
      let actionSheetFlag2 = getInspectorByKey('actionSheetFlag2');
      expect(JSON.parse(actionSheetFlag2).$attrs.content).assertEqual('true');
      let driver: Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.text('button'));
      await button.click();
      await CommonFunc.sleep(2000);
      let actionSheetFlag3 = getInspectorByKey('actionSheetFlag3');
      expect(JSON.parse(actionSheetFlag3).$attrs.content).assertEqual('true');
      let actionSheetFlag4 = getInspectorByKey('actionSheetFlag4');
      expect(JSON.parse(actionSheetFlag4).$attrs.content).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('AlertDialogLife_0001 END');
      done();
    });
  })
}