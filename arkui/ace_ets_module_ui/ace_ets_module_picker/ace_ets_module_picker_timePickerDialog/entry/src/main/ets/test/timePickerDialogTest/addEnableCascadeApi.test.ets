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
import { router } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON, Component} from '@ohos.UiTest';

export default function TimePickerDialogApiEnableCascadeTest() {
  describe('TimePickerDialogApiEnableCascade', () => {
    beforeEach(async (done: Function) => {
      console.info('TimePickerDialogApiEnableCascade beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/addEnableCascadeApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TimePickerDialogApiEnableCascade state pages:' + JSON.stringify(pages));
        if (!('addEnableCascadeApi' == pages.name)) {
          console.info('get TimePickerDialogApiEnableCascade pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push TimePickerDialogApiEnableCascade page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TimePickerDialogApiEnableCascade page error:' + err);
      }
      console.info('TimePickerDialogApiEnableCascade beforeEach end');
      done();
    });

    /**
     * @tc.name   TimePickerDialog_EnableCascade_001
     * @tc.number TimePickerDialog_EnableCascade_001
     * @tc.desc   To test the enableCascade interface true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerDialog_EnableCascade_001', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableCascade_001';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('TimePickerDialog1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1])
      console.info('[TimePickerDialog_EnableCascade_001] obj1 is: ' + timePicker);
      console.info('[TimePickerDialog_EnableCascade_001] obj1 is: ' +
      JSON.stringify(JSON.parse(timePicker).$attrs.enableCascade));
      expect(JSON.parse(timePicker).$attrs.enableCascade).assertEqual(true);
      let btn1: Component = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   TimePickerDialog_EnableCascade_002
     * @tc.number TimePickerDialog_EnableCascade_002
     * @tc.desc   To test the enableCascade interface false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerDialog_EnableCascade_002', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableCascade_002';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('TimePickerDialog2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1])
      console.info('[TimePickerDialog_EnableCascade_002] obj1 is: ' + timePicker);
      console.info('[TimePickerDialog_EnableCascade_002] obj1 is: ' +
      JSON.stringify(JSON.parse(timePicker).$attrs.enableCascade));
      expect(JSON.parse(timePicker).$attrs.enableCascade).assertEqual(false);
      let btn1: Component = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   TimePickerDialog_EnableCascade_003
     * @tc.number TimePickerDialog_EnableCascade_003
     * @tc.desc   To test the enableCascade interface null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerDialog_EnableCascade_003', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableCascade_003';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('TimePickerDialog3'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1])
      console.info('[TimePickerDialog_EnableCascade_003] obj1 is: ' + timePicker);
      console.info('[TimePickerDialog_EnableCascade_003] obj1 is: ' +
      JSON.stringify(JSON.parse(timePicker).$attrs.enableCascade));
      expect(JSON.parse(timePicker).$attrs.enableCascade).assertEqual(false);
      let btn1: Component = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.name   TimePickerDialog_EnableCascade_004
     * @tc.number TimePickerDialog_EnableCascade_004
     * @tc.desc   To test the enableCascade interface undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerDialog_EnableCascade_004', Level.LEVEL1, async (done: Function) => {
      let tagName = 'TimePickerDialog_EnableCascade_004';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('TimePickerDialog4'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let timePicker = JSON.stringify(obj1.$children[1].$children[0].$children[0].$children[1])
      console.info('[TimePickerDialog_EnableCascade_004] obj1 is: ' + timePicker);
      console.info('[TimePickerDialog_EnableCascade_004] obj1 is: ' +
      JSON.stringify(JSON.parse(timePicker).$attrs.enableCascade));
      expect(JSON.parse(timePicker).$attrs.enableCascade).assertEqual(false);
      let btn1: Component = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await CommonFunc.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
