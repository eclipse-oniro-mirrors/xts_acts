/**
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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function customDialogGetstateTest() {
  describe('customDialogGetstateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("customDialogGetstateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/customdialog4',
      }
      router.clear();
      let pages = router.getState();
      console.info("get customDialogGetstateTest state pages: " + JSON.stringify(pages));
      if (!("customDialogBackgroundEffect" == pages.name)) {
        console.info("get customDialogGetstateTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push customDialogGetstateTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.number    customDialogGetstateTest001
     * @tc.name      customDialogGetstateTest001
     * @tc.desc      get dialog state
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
      it('customDialogGetstateTest001', Level.LEVEL0, async (done: Function) => {
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('dialogController001'));
      await btn1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('alertDialogFlag1');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('1');
      await Utils.sleep(3000)
      let strJson2 = getInspectorByKey('alertDialogFlag2');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('2');
      let btn2: Component = await driver.findComponent(ON.text('close dialog'));
      await btn2.click();
      await Utils.sleep(3000)
      let strJson3 = getInspectorByKey('alertDialogFlag3');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('3');
      await Utils.sleep(3000)
      let strJson4 = getInspectorByKey('alertDialogFlag4');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('4');
      done();
    });
  })
}