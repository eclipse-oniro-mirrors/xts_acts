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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import { UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function dragSpringLoadingTest() {
  describe('dragSpringLoadingTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragEvent/dragSpringLoading',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get dragSpringLoadingTest state pages: ' + JSON.stringify(pages));
        if (!('NormalEts' == pages.name)) {
          console.info('get dragSpringLoadingTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push dragSpringLoadingTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push dragSpringLoadingTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('dragSpringLoadingTest after each called');
    });

    /**
     * @tc.name   dragSpringLoadingTest_0010
     * @tc.number dragSpringLoadingTest_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragSpringLoadingTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('dragSpringLoadingTest_0010 START');
      let driver = await Driver.create();
      let abortBegin = await driver.findComponent(ON.id('abortBegin'));
      await abortBegin.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('abortBegin');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[dragSpringLoadingTest_0010] dragSpringLoading: ' + JSON.stringify(obj.$attrs));
      console.info('[dragSpringLoadingTest_0010] dragSpringLoadingLabelObj: ' + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('begin: true');

      let image1 = await driver.findComponent(ON.id('image1'));
      let button1 = await driver.findComponent(ON.id('button1'));
      let imageRect = await image1.getBounds();
      let buttonRect = await button1.getBounds();
      await CommonFunc.sleep(500);
      await driver.drag(imageRect.left, imageRect.bottom,
        imageRect.left, buttonRect.bottom, 200)
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('currentNotifySequence');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[dragSpringLoadingTest_0010] dragSpringLoadingLabelObj1: ' + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('1');

      let strJson2 = getInspectorByKey('beginInfo');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[dragSpringLoadingTest_0010] dragSpringLoadingLabelObj2: ' + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertContain('24');
      expect(obj2.$attrs.content).assertContain('.png');

      let strJson3 = getInspectorByKey('beginConfig');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[dragSpringLoadingTest_0010] dragSpringLoadingLabelObj3: ' + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('0,0,3,100');

      let strJson4 = getInspectorByKey('cancel');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[dragSpringLoadingTest_0010] dragSpringLoadingLabelObj4: ' + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('DragSpringLoading cancel');
      console.info('[dragSpringLoadingTest_0010] END');
      done();
    });

    /**
     * @tc.name   dragSpringLoadingTest_0020
     * @tc.number dragSpringLoadingTest_0020
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragSpringLoadingTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('dragSpringLoadingTest_0020 START');
      let driver = await Driver.create();
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(500);

      let updateThree = await driver.findComponent(ON.id('updateThree'));
      await updateThree.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('updateThree');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[dragSpringLoadingTest_0020] dragSpringLoadingLabelObj: ' + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('threeUpdate: true');

      let updateStillTimeLimit = await driver.findComponent(ON.id('updateStillTimeLimit'));
      await updateStillTimeLimit.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('updateStillTimeLimit');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[dragSpringLoadingTest_0020] dragSpringLoadingLabelObj1: ' + JSON.stringify(obj1.$attrs.label));
      expect(obj1.$attrs.label).assertEqual('stillTimeLimit: 0');

      let updateInterval = await driver.findComponent(ON.id('updateInterval'));
      await updateInterval.click();
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('updateInterval');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[dragSpringLoadingTest_0020] dragSpringLoadingLabelObj2: ' + JSON.stringify(obj2.$attrs.label));
      expect(obj2.$attrs.label).assertEqual('updateInterval: 0');

      let updateNotifyCount = await driver.findComponent(ON.id('updateNotifyCount'));
      await updateNotifyCount.click();
      await CommonFunc.sleep(500);
      let strJson3 = getInspectorByKey('updateNotifyCount');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[dragSpringLoadingTest_0020] dragSpringLoadingLabelObj3: ' + JSON.stringify(obj3.$attrs.label));
      expect(obj3.$attrs.label).assertEqual('updateNotifyCount: 0');

      let updateToFinishInterval = await driver.findComponent(ON.id('updateToFinishInterval'));
      await updateToFinishInterval.click();
      await CommonFunc.sleep(500);
      let strJson4 = getInspectorByKey('updateToFinishInterval');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[dragSpringLoadingTest_0020] dragSpringLoadingLabelObj4: ' + JSON.stringify(obj4.$attrs.label));
      expect(obj4.$attrs.label).assertEqual('updateToFinishInterval: 0');

      let scrollBar1: Component = await driver.findComponent(ON.type('Scroll'));
      await scrollBar1.scrollToTop();
      await CommonFunc.sleep(500);

      let image1 = await driver.findComponent(ON.id('image1'));
      let button1 = await driver.findComponent(ON.id('button1'));
      let imageRect = await image1.getBounds();
      let buttonRect = await button1.getBounds();
      await CommonFunc.sleep(500);
      await driver.drag(imageRect.left, imageRect.bottom,
        imageRect.left, buttonRect.bottom, 200)
      await CommonFunc.sleep(1000);

      let strJson5 = getInspectorByKey('endConfig');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info('[dragSpringLoadingTest_0020] dragSpringLoadingLabelObj5: ' + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual('0,0,0,0');

      console.info('[dragSpringLoadingTest_0020] END');
      done();
    });
  })
}