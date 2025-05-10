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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BY, Driver, UiDriver } from '@kit.TestKit';
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
    it('TimePickerApienableCascade_001', 0, async (done: Function) => {
      console.info('[TimePickerApienableCascade_001] START');
      let driver = await UiDriver.create()
      let clock24Button = await driver.findComponent(BY.key('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(BY.key('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(BY.key('timePicker-true'));
      await switchButton.click();
      await Utils.sleep(1000);
      let timePicker = Utils.getComponentRect('timePicker');
      let top = timePicker.top
      let bottom = timePicker.bottom
      let right = timePicker.right
      let middle = (bottom-top) / 2 + top
      let left =timePicker.left
      console.info('[TimePickerApienableCascade_001] left: ' + timePicker.left + ', top: ' + timePicker.top +
        ', right:' + timePicker.right + ', bottom:' + timePicker.bottom + 'middle:' + middle);
      let hour = await driver.findComponent(BY.key('hour'));
      let hour1 = await hour.getText();
      console.info('[TimePickerApienableCascade_001] hour1: ' + hour1);
      console.info('[TimePickerApienableCascade_001] hour1: ' + JSON.stringify(hour1));
      expect(hour1).assertEqual('hour:10');
      await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
      console.info('[TimePickerApienableCascade_001] winLeft:' + globalThis.winLeft);
      console.info('[TimePickerApienableCascade_001] winTop:' + globalThis.winTop);
      await Utils.sleep(8000);
      let hour2 = await hour.getText();
      let index = await hour2.indexOf(':');
      let Hour2 = parseInt(hour2.substring(index + 1, hour2.length).trim())
      console.info('[TimePickerApienableCascade_001] hour2:' + Hour2);
      console.info('[TimePickerApienableCascade_001] hour2:' + JSON.stringify(hour2));
      expect(Hour2 > 12).assertTrue();
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
    it('TimePickerApienableCascade_002', 0, async (done: Function) => {
      console.info('[TimePickerApienableCascade_002] START');
      let driver = await UiDriver.create()
      let clock24Button = await driver.findComponent(BY.key('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(BY.key('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(BY.key('timePicker-false'));
      await switchButton.click();
      await Utils.sleep(1000);
      let timePicker = Utils.getComponentRect('timePicker');
      let top = timePicker.top
      let bottom = timePicker.bottom
      let right = timePicker.right
      let middle = (bottom-top) / 2 + top
      let left =timePicker.left
      console.info('[TimePickerApienableCascade_002] left: ' + timePicker.left + ', top: ' + timePicker.top +
        ', right:' + timePicker.right + ', bottom:' + timePicker.bottom + 'middle:' + middle);
      let hour = await driver.findComponent(BY.key('hour'));
      let hour1 = await hour.getText();
      console.info('[TimePickerApienableCascade_002] hour1: ' + JSON.stringify(hour1));
      expect(hour1).assertEqual('hour:10');
      await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
      await Utils.sleep(8000);
      let hour2 = await hour.getText();
      let index = await hour2.indexOf(':');
      let Hour2 = parseInt(hour2.substring(index + 1, hour2.length).trim())
      console.info('[TimePickerApienableCascade_002] hour2:' + Hour2);
      expect(Hour2 < 12).assertTrue();
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
    it('TimePickerApienableCascade_003', 0, async (done: Function) => {
      console.info('[TimePickerApienableCascade_003] START');
      let driver = await UiDriver.create()
      let clock24Button = await driver.findComponent(BY.key('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(BY.key('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(BY.key('timePicker-null'));
      await switchButton.click();
      await Utils.sleep(1000);
      let timePicker = Utils.getComponentRect('timePicker');
      let top = timePicker.top
      let bottom = timePicker.bottom
      let right = timePicker.right
      let middle = (bottom-top) / 2 + top
      let left =timePicker.left
      console.info('[TimePickerApienableCascade_003] left: ' + timePicker.left + ', top: ' + timePicker.top +
        ', right:' + timePicker.right + ', bottom:' + timePicker.bottom + 'middle:' + middle);
      let hour = await driver.findComponent(BY.key('hour'));
      let hour1 = await hour.getText();
      console.info('[TimePickerApienableCascade_003] hour1: ' + JSON.stringify(hour1));
      expect(hour1).assertEqual('hour:10');
      await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
      await Utils.sleep(8000);
      let hour2 = await hour.getText();
      let index = await hour2.indexOf(':');
      let Hour2 = parseInt(hour2.substring(index + 1, hour2.length).trim())
      console.info('[TimePickerApienableCascade_003] hour2:' + Hour2);
      expect(Hour2 < 12).assertTrue();
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
    it('TimePickerApienableCascade_004', 0, async (done: Function) => {
      console.info('[TimePickerApienableCascade_004] START');
      // switch 12-hour
      let driver = await UiDriver.create()
      let clock24Button = await driver.findComponent(BY.key('24hour'));
      await clock24Button.click();
      await Utils.sleep(1000);
      let clock12Button = await driver.findComponent(BY.key('12hour'));
      await clock12Button.click();
      await Utils.sleep(1000);
      let switchButton = await driver.findComponent(BY.key('timePicker-undefined'));
      await switchButton.click();
      await Utils.sleep(1000);
      let timePicker = Utils.getComponentRect('timePicker');
      let top = timePicker.top
      let bottom = timePicker.bottom
      let right = timePicker.right
      let middle = (bottom-top) / 2 + top
      let left =timePicker.left
      console.info('[TimePickerApienableCascade_004] left: ' + timePicker.left + ', top: ' + timePicker.top +
        ', right:' + timePicker.right + ', bottom:' + timePicker.bottom + 'middle:' + middle);
      let hour = await driver.findComponent(BY.key('hour'));
      let hour1 = await hour.getText();
      console.info('[TimePickerApienableCascade_004] hour1: ' + JSON.stringify(hour1));
      expect(hour1).assertEqual('hour:10');
      await driver.swipe(Math.round(globalThis.winLeft+(right-left)/2+left), Math.round(globalThis.winTop+middle), Math.round(globalThis.winLeft+(right-left)/2+left),
        Math.round(0));
      await Utils.sleep(8000);
      let hour2 = await hour.getText();
      let index = await hour2.indexOf(':');
      let Hour2 = parseInt(hour2.substring(index + 1, hour2.length).trim())
      console.info('[TimePickerApienableCascade_004] hour2:' + Hour2);
      expect(Hour2 < 12).assertTrue();
      console.info('[TimePickerApienableCascade_004] END');
      done();
    });
  })
}
