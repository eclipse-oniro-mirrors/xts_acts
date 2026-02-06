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


export default function animationCurve() {
  describe('animationCurve', () => {
    beforeEach(async (done: Function) => {
      console.info("animationCurve beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/animationCurve",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animationCurve state pages:" + JSON.stringify(pages));
        if (!("animationCurve" == pages.name)) {
          console.info("get animationCurve pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push animationCurve page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animationCurve page error:" + err);
      }
      console.info("animationCurve beforeEach end");
      done();
    });

     /**
     * @tc.number: curves_ori_value_0001
     * @tc.name  : curves_ori_value_0001
     * @tc.desc  : set linear,The return value is 'linear' and passes
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('curves_ori_value_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('curves_ori_value_0001 START');
      let driver = Driver.create();
      let buttonIndex = await driver.findComponent(ON.id('changeIndex++'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let tabsOri = getInspectorByKey('tabsOri');
      console.info('curves_ori_value_0001' + JSON.stringify(JSON.parse(tabsOri).$attrs.animationCurve));
      expect(JSON.parse(tabsOri).$attrs.animationCurve).assertEqual('linear');
      console.info('curves_ori_value_0001 END');
      done();
    });

    /**
     * @tc.number: curves_ori_value_0002
     * @tc.name  : curves_ori_value_0002
     * @tc.desc  : set undefined,The return value is 'cubic-bezier(0.200000,0.000000,0.100000,1.000000)' and passes
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('curves_ori_value_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('curves_ori_value_0002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Index++'));
      await button.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('changeIndex++'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let tabsOri = getInspectorByKey('tabsOri');
      console.info('curves_ori_value_0002' + JSON.stringify(JSON.parse(tabsOri).$attrs.animationCurve));
      expect(JSON.parse(tabsOri).$attrs.animationCurve).assertEqual('cubic-bezier(0.200000,0.000000,0.100000,1.000000)');
      console.info('curves_ori_value_0002 END');
      done();
    });

    /**
     * @tc.number: curves_ori_value_0003
     * @tc.name  : curves_ori_value_0003
     * @tc.desc  : set null,The return value is 'cubic-bezier(0.200000,0.000000,0.100000,1.000000)' and passes
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('curves_ori_value_0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('curves_ori_value_0003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Index++'));
      await button.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('changeIndex++'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let tabsOri = getInspectorByKey('tabsOri');
      console.info('curves_ori_value_0003' + JSON.stringify(JSON.parse(tabsOri).$attrs.animationCurve));
      expect(JSON.parse(tabsOri).$attrs.animationCurve).assertEqual('cubic-bezier(0.200000,0.000000,0.100000,1.000000)');
      console.info('curves_ori_value_0003 END');
      done();
    });

    /**
     * @tc.number: curves_ori_value_0004
     * @tc.name  : curves_ori_value_0004
     * @tc.desc  : set -9,The return value is 'cubic-bezier(0.200000,0.000000,0.100000,1.000000)' and passes
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('curves_ori_value_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('curves_ori_value_0004 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Index++'));
      await button.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let buttonIndex = await driver.findComponent(ON.id('changeIndex++'));
      await buttonIndex.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let tabsOri = getInspectorByKey('tabsOri');
      console.info('curves_ori_value_0004' + JSON.stringify(JSON.parse(tabsOri).$attrs.animationCurve));
      expect(JSON.parse(tabsOri).$attrs.animationCurve).assertEqual('cubic-bezier(0.200000,0.000000,0.100000,1.000000)');
      console.info('curves_ori_value_0004 END');
      done();
    });

    /**
     * @tc.number: curves_ori_value_0005.0
     * @tc.name  : curves_ori_value_0005
     * @tc.desc  : set  ICurve:cubicBezierCurve(0.1, 0.0, 0.1, 0.5),The return value is 'cubic-bezier(0.100000,0.000000,0.100000,0.500000)' and passes
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('curves_ori_value_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    console.info('curves_ori_value_0005 START');
    let driver = Driver.create();
    let button = await driver.findComponent(ON.id('Index++'));
    await button.click();
    await CommonFunc.sleep(SLEEP_TIME);
    let buttonIndex = await driver.findComponent(ON.id('changeIndex++'));
    await buttonIndex.click();
    await CommonFunc.sleep(SLEEP_TIME);
    let tabsOri = getInspectorByKey('tabsOri');
    console.info('curves_ori_value_0005' + JSON.stringify(JSON.parse(tabsOri).$attrs.animationCurve));
    expect(JSON.parse(tabsOri).$attrs.animationCurve).assertEqual('cubic-bezier(0.100000,0.000000,0.100000,0.500000)');
    console.info('curves_ori_value_0005 END');
    done();
    });
  })
}
