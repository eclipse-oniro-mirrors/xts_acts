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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

const SLEEP_TIME_1000 = 1000;
const SLEEP_TIME_2500 = 2500;

export default function DrawChildrenTest() {
  describe('DrawChildrenTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DrawChildrenTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CreateComponentObserver/drawChildren',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DrawChildrenTest state pages:' + JSON.stringify(pages));
        if (!('drawChildren' === pages.name)) {
          console.info('get DrawChildrenTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(SLEEP_TIME_2500);
          console.info('push DrawChildrenTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DrawChildrenTest page error:' + err);
      }
      console.info('DrawChildrenTest beforeEach end');
      done();
    });

    /**
    * @tc.number: DrawChildrenTest_001
    * @tc.name  : DrawChildrenTest_001
    * @tc.desc  : Test the size changes of the monitoring sub components
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('DrawChildrenTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('DrawChildrenTest_001 START');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = getInspectorByKey('Button1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DrawChildrenTest_001 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('text1尺寸ok');
      let driver = await Driver.create();
      let btn1 = await driver.findComponent(ON.id('Button1'));
      await btn1.click();
      await Utils.sleep(SLEEP_TIME_1000);
      strJson = getInspectorByKey('Button1');
      obj = JSON.parse(strJson);
      console.info('DrawChildrenTest_001 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('text1尺寸okok');
      console.info('[DrawChildrenTest_001] END');
      done();
    });

    /**
    * @tc.number: DrawChildrenTest_002
    * @tc.name  : DrawChildrenTest_002
    * @tc.desc  : Test the rotation changes of the monitoring sub component
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('DrawChildrenTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('DrawChildrenTest_002 START');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = getInspectorByKey('Button2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DrawChildrenTest_002 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('text2旋转ok');
      await Utils.sleep(SLEEP_TIME_1000);
      let driver = await Driver.create();
      let btn1 = await driver.findComponent(ON.id('Button2'));
      await btn1.click();
      await Utils.sleep(SLEEP_TIME_1000);
      strJson = getInspectorByKey('Button2');
      obj = JSON.parse(strJson);
      console.info('DrawChildrenTest_002 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('text2旋转okok');
      console.info('[DrawChildrenTest_002] END');
      done();
    });

    /**
    * @tc.number: DrawChildrenTest_003
    * @tc.name  : DrawChildrenTest_003
    * @tc.desc  : Test to cancel monitoring of sub component size changes
    * @tc.level : Level 1
    * @tc.type
    * @tc.size
    */
    it('DrawChildrenTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('DrawChildrenTest_003 START');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = getInspectorByKey('Button3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('DrawChildrenTest_003 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('text1offokok');
      let driver = await Driver.create();
      let btn1 = await driver.findComponent(ON.id('Button3'));
      await btn1.click();
      await Utils.sleep(SLEEP_TIME_1000);
      strJson = getInspectorByKey('Button3');
      obj = JSON.parse(strJson);
      console.info('DrawChildrenTest_003 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('text1offokok');
      console.info('[DrawChildrenTest_003] END');
      done();
    });
  })
}
