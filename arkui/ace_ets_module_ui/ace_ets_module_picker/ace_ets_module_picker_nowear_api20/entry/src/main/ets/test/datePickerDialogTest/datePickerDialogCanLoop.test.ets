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
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'


export default function DatePickerDialogCanLoopTest() {
  describe('DatePickerDialogCanLoopTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerDialogCanLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/datePickerDialogCanLoop',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerDialogCanLoopTest state pages:' + JSON.stringify(pages));
        if (!('datePickerDialogCanLoop' === pages.name)) {
          console.info('get DatePickerDialogCanLoopTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push DatePickerDialogCanLoopTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerDialogCanLoopTest page error:' + err);
      }
      console.info('DatePickerDialogCanLoopTest beforeEach end');
      done();
    });

    /**
     * @tc.name   DatePickerDialogCanLoopTest_0100
     * @tc.number DatePickerDialogCanLoopTest_0100
     * @tc.desc   To test the canLoop true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogCanLoopTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogCanLoopTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('trueID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let tree: ESObject = getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column1: ESObject = dialog.$children[0];
      let column2: ESObject = column1.$children[0];
      let stack: ESObject = column2.$children[1];
      let picker: ESObject = stack.$children[0];
      let canLoopAttr: string = picker.$attrs.canLoop;
      console.info('DatePickerDialogCanLoopTest_0100 true component obj is: ' + canLoopAttr);
      expect(canLoopAttr).assertEqual('true');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   DatePickerDialogCanLoopTest_0200
     * @tc.number DatePickerDialogCanLoopTest_0200
     * @tc.desc   To test the canLoop false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogCanLoopTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogCanLoopTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('falseID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let tree: ESObject = getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column1: ESObject = dialog.$children[0];
      let column2: ESObject = column1.$children[0];
      let stack: ESObject = column2.$children[1];
      let picker: ESObject = stack.$children[0];
      let canLoopAttr: string = picker.$attrs.canLoop;
      console.info('DatePickerDialogCanLoopTest_0200 false component obj is: ' + canLoopAttr);
      expect(canLoopAttr).assertEqual('false');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   DatePickerDialogCanLoopTest_0300
     * @tc.number DatePickerDialogCanLoopTest_0300
     * @tc.desc   To test the canLoop null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogCanLoopTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogCanLoopTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('nullID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let tree: ESObject = getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column1: ESObject = dialog.$children[0];
      let column2: ESObject = column1.$children[0];
      let stack: ESObject = column2.$children[1];
      let picker: ESObject = stack.$children[0];
      let canLoopAttr: string = picker.$attrs.canLoop;
      console.info('DatePickerDialogCanLoopTest_0300 null component obj is: ' + canLoopAttr);
      expect(canLoopAttr).assertEqual('true');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });

    /**
     * @tc.name   DatePickerDialogCanLoopTest_0400
     * @tc.number DatePickerDialogCanLoopTest_0400
     * @tc.desc   To test the canLoop undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DatePickerDialogCanLoopTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DatePickerDialogCanLoopTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('undefinedID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let tree: ESObject = getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column1: ESObject = dialog.$children[0];
      let column2: ESObject = column1.$children[0];
      let stack: ESObject = column2.$children[1];
      let picker: ESObject = stack.$children[0];
      let canLoopAttr: string = picker.$attrs.canLoop;
      console.info('DatePickerDialogCanLoopTest_0400 undefined component obj is: ' + canLoopAttr);
      expect(canLoopAttr).assertEqual('true');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    });
  })
}