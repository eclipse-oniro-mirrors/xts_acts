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
import { Driver, ON, Component, Point} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 1500;


export default function animationCurveNullUndefinedTest() {
  describe('animationCurveNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("animationCurveNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/animationCurveNullUndefined/animationCurveNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animationCurveNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("animationCurveNullUndefined" == pages.name)) {
          console.info("get animationCurveNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push animationCurveNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animationCurveNullUndefinedTest page error:" + err);
      }
      console.info("animationCurveNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0001
     * @tc.number animationCurveNullUndefinedTest_0001
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0001 START');
      let driver = Driver.create();
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0001 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0002
     * @tc.number animationCurveNullUndefinedTest_0002
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0002 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0002' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0002 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0003
     * @tc.number animationCurveNullUndefinedTest_0003
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('animationCurveNullUndefinedTest_0003 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0003' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0003 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0004
     * @tc.number animationCurveNullUndefinedTest_0004
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0004 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0004' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0004 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0005
     * @tc.number animationCurveNullUndefinedTest_0005
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0005 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0005' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0005 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0006
     * @tc.number animationCurveNullUndefinedTest_0006
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0006 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0006' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0006 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0007
     * @tc.number animationCurveNullUndefinedTest_0007
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0007 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0007' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0007 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0008
     * @tc.number animationCurveNullUndefinedTest_0008
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0008 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0008' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0008 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0009
     * @tc.number animationCurveNullUndefinedTest_0009
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0009 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0009' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0009 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0010
     * @tc.number animationCurveNullUndefinedTest_0010
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0010 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0010' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0010 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0011
     * @tc.number animationCurveNullUndefinedTest_0011
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0011 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0011' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0011 END');
      done();
    });

    /**
     * @tc.name   animationCurveNullUndefinedTest_0012
     * @tc.number animationCurveNullUndefinedTest_0012
     * @tc.desc   
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('animationCurveNullUndefinedTest_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('animationCurveNullUndefinedTest_0012 START');
      let driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('animationCurveChangeIndex'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('animationCurveNullUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('animationCurveNullUndefinedTest_0012' + JSON.stringify(obj.$attrs.width));
      console.info('animationCurveNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.animationCurve).assertEqual('steps(1,end)');
      console.info('animationCurveNullUndefinedTest_0012 END');
      done();
    });
  })
}
