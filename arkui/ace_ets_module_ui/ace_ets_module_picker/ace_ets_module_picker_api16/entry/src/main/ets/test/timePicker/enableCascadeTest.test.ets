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
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

function getRectCenterVp(rect: string) {
  let regexp: RegExp = new RegExp('\\[', 'g');
  let rtn: string[] = rect.replace(regexp, '').replace(regexp, '').split(',')
  return [
    px2vp(Number.parseFloat(rtn[0].trim()) + (Number.parseFloat(rtn[2].trim()) - Number.parseFloat(rtn[0].trim())) / 2),
    px2vp(Number.parseFloat(rtn[1].trim()) + (Number.parseFloat(rtn[3].trim()) - Number.parseFloat(rtn[1].trim())) / 2),
  ]
}

export default function enableCascadeTest() {
  describe('TimePickerApienableCascade', () => {
    beforeEach(async (done: Function) => {
      console.info('TimePickerAddApi beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/enableCascadeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TimePickerAddApi state pages:' + JSON.stringify(pages));
        if (!('enableCascadeTest' == pages.name)) {
          console.info('get TimePickerAddApi pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TimePickerAddApi page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TimePickerAddApi page error:' + err);
      }
      console.info('TimePickerAddApi beforeEach end');
      done();
    });
    /* *
    * @tc.number: TimePickerApienableCascade_001
    * @tc.name  : TimePickerApienableCascade_001
    * @tc.desc  : To test the enableCascade interface true
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('TimePickerApienableCascade_001', Level.LEVEL1, async (done: Function) => {
      console.info('[TimePickerApienableCascade_001] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-true'));
      await switchButton.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('timePicker');
      await Utils.sleep(1000);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TimePickerApienableCascade_001] attrs:' + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000);
      expect(obj.$attrs.enableCascade).assertEqual(true);
      console.info('[TimePickerApienableCascade_001] END');
      done();
    });
    /* *
    * @tc.number: TimePickerApienableCascade_002
    * @tc.name  : TimePickerApienableCascade_002
    * @tc.desc  : To test the enableCascade interface false
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('TimePickerApienableCascade_002', Level.LEVEL1, async (done: Function) => {
      console.info('[TimePickerApienableCascade_002] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-false'));
      await switchButton.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('timePicker');
      await Utils.sleep(1000);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TimePickerApienableCascade_002] attrs:' + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000);
      expect(obj.$attrs.enableCascade).assertEqual(false);
      console.info('[TimePickerApienableCascade_002] END');
      done();
    });
    /* *
    * @tc.number: TimePickerApienableCascade_003
    * @tc.name  : TimePickerApienableCascade_003
    * @tc.desc  : To test the enableCascade interface null
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('TimePickerApienableCascade_003', Level.LEVEL1, async (done: Function) => {
      console.info('[TimePickerApienableCascade_003] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-null'));
      await switchButton.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('timePicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TimePickerApienableCascade_003] attrs:' + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000);
      expect(obj.$attrs.enableCascade).assertEqual(false);
      console.info('[TimePickerApienableCascade_003] END');
      done();
    });

    /* *
    * @tc.number: TimePickerApienableCascade_004
    * @tc.name  : TimePickerApienableCascade_004
    * @tc.desc  : To test the enableCascade interface undefined
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('TimePickerApienableCascade_004', Level.LEVEL1, async (done: Function) => {
      console.info('[TimePickerApienableCascade_004] START');
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      let clock24Button = await driver.findComponent(ON.id('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(ON.id('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(ON.id('timePicker-undefined'));
      await switchButton.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('timePicker');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[TimePickerApienableCascade_004] attrs:' + JSON.stringify(obj.$attrs.enableCascade));
      await Utils.sleep(1000);
      expect(obj.$attrs.enableCascade).assertEqual(false);
      console.info('[TimePickerApienableCascade_004] END');
      done();
    });
  })
}
