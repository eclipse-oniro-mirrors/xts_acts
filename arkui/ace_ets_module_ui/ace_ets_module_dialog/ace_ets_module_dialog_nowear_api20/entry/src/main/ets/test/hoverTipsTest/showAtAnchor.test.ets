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
import Utils from '../../MainAbility/common/Utils';
import { Rect } from '@kit.ArkGraphics3D';

const SLEEP_TIME = 1500;
const POSITION_X = 80;
const X = 0;
const Y = 0;

export default function showAtAnchorTest() {
  describe('showAtAnchorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showAtAnchorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tips/showAtAnchor',
      }
      router.clear();
      let pages = router.getState();
      console.info("get showAtAnchorTest state pages: " + JSON.stringify(pages));
      if (!("showAtAnchor" == pages.name)) {
        console.info("get showAtAnchorTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(SLEEP_TIME);
        console.info("push showAtAnchorTest success: " + JSON.stringify(result));
      }
      done();
    });


    /**
     * @tc.name   showAtAnchor_value_0001
     * @tc.number showAtAnchor_value_0001
     * @tc.desc   set undefined,The center position of the two pop-up tips is the same,Perform a reset operation after the end of the case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('showAtAnchor_value_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showAtAnchor_value_0001 START');
      let driver: Driver = Driver.create();
      let TipsButton = await driver.findComponent(ON.id('oriBtn'));
      let center1: Point = await TipsButton.getBoundsCenter();
      console.info('showAtAnchor_value_0001 component obj is: ' + JSON.stringify(center1));
      await driver.mouseMoveTo(center1);
      await Utils.sleep(SLEEP_TIME);
      let tips1: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips1).assertTrue();
      let tipsPoint1Center: Point = await tips1.getBoundsCenter();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      let center2_X: number = center1.x+POSITION_X;
      let center2_Y: number = center1.y;
      await driver.mouseMoveTo({x:center2_X,y:center2_Y});
      await Utils.sleep(SLEEP_TIME);
      let tips2: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips2).assertTrue();
      let tipsPoint2Center: Point = await tips2.getBoundsCenter();
      let tipsBol: boolean = false
      if(JSON.stringify(tipsPoint1Center) === JSON.stringify(tipsPoint2Center)){
        tipsBol = true;
      }
      expect(tipsBol).assertTrue();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      console.info('showAtAnchor_value_0001 END');
      done();
    });

    /**
     * @tc.name   showAtAnchor_value_0002
     * @tc.number showAtAnchor_value_0002
     * @tc.desc   set null,The center position of the two pop-up tips is the same,Perform a reset operation after the end of the case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('showAtAnchor_value_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showAtAnchor_value_0002 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showAtAnchorBth'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let TipsButton = await driver.findComponent(ON.id('oriBtn'));
      let center1: Point = await TipsButton.getBoundsCenter();
      console.info('showAtAnchor_value_0002 component obj is: ' + JSON.stringify(center1));
      await driver.mouseMoveTo(center1);
      await Utils.sleep(SLEEP_TIME);
      let tips1: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips1).assertTrue();
      let tipsPoint1Center: Point = await tips1.getBoundsCenter();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      let center2_X: number = center1.x+POSITION_X;
      let center2_Y: number = center1.y;
      await driver.mouseMoveTo({x:center2_X,y:center2_Y});
      await Utils.sleep(SLEEP_TIME);
      let tips2: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips2).assertTrue();
      let tipsPoint2Center: Point = await tips2.getBoundsCenter();
      let tipsBol: boolean = false
      if(JSON.stringify(tipsPoint1Center) === JSON.stringify(tipsPoint2Center)){
        tipsBol = true;
      }
      expect(tipsBol).assertTrue();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      console.info('showAtAnchor_value_0002 END');
      done();
    });

    /**
     * @tc.name   showAtAnchor_value_0003
     * @tc.number showAtAnchor_value_0003
     * @tc.desc   set TARGET,The center position of the two pop-up tips is the same,Perform a reset operation after the end of the case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('showAtAnchor_value_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showAtAnchor_value_0003 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showAtAnchorBth'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let TipsButton = await driver.findComponent(ON.id('oriBtn'));
      let center1: Point = await TipsButton.getBoundsCenter();
      console.info('showAtAnchor_value_0003 component obj is: ' + JSON.stringify(center1));
      await driver.mouseMoveTo(center1);
      await Utils.sleep(SLEEP_TIME);
      let tips1: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips1).assertTrue();
      let tipsPoint1Center: Point = await tips1.getBoundsCenter();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      let center2_X: number = center1.x+POSITION_X;
      let center2_Y: number = center1.y;
      await driver.mouseMoveTo({x:center2_X,y:center2_Y});
      await Utils.sleep(SLEEP_TIME);
      let tips2: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips2).assertTrue();
      let tipsPoint2Center: Point = await tips2.getBoundsCenter();
      let tipsBol: boolean = false
      if(JSON.stringify(tipsPoint1Center) === JSON.stringify(tipsPoint2Center)){
        tipsBol = true;
      }
      expect(tipsBol).assertTrue();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      console.info('showAtAnchor_value_0003 END');
      done();
    });

    /**
     * @tc.name   showAtAnchor_value_0004
     * @tc.number showAtAnchor_value_0004
     * @tc.desc   set CURSOR,The center position of the two pop-up tips is inconsistent,Perform a reset operation after the end of the case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('showAtAnchor_value_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showAtAnchor_value_0004 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showAtAnchorBth'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let TipsButton = await driver.findComponent(ON.id('oriBtn'));
      let center1: Point = await TipsButton.getBoundsCenter();
      await driver.mouseMoveTo(center1);
      await Utils.sleep(SLEEP_TIME);
      let tips1: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips1).assertTrue();
      let tipsPoint1Center: Point = await tips1.getBoundsCenter();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      let center2_X: number = center1.x+POSITION_X;
      let center2_Y: number = center1.y;
      await driver.mouseMoveTo({x:center2_X,y:center2_Y});
      await Utils.sleep(SLEEP_TIME);
      let tips2: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips2).assertTrue();
      let tipsPoint2Center: Point = await tips2.getBoundsCenter();
      let tipsBol: boolean = false;
      if(JSON.stringify(tipsPoint1Center) === JSON.stringify(tipsPoint2Center)){
        tipsBol = true;
      }
      expect(tipsBol).assertFalse();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      console.info('showAtAnchor_value_0004 END');
      done();
    });

    /**
     * @tc.name   showAtAnchor_value_0005
     * @tc.number showAtAnchor_value_0005
     * @tc.desc   set -9,The center position of the two pop-up tips is the same,Perform a reset operation after the end of the case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('showAtAnchor_value_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showAtAnchor_value_0005 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showAtAnchorBth'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let TipsButton = await driver.findComponent(ON.id('oriBtn'));
      let center1: Point = await TipsButton.getBoundsCenter();
      console.info('showAtAnchor_value_0005 component obj is: ' + JSON.stringify(center1));
      await driver.mouseMoveTo(center1);
      await Utils.sleep(SLEEP_TIME);
      let tips1: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips1).assertTrue();
      let tipsPoint1Center: Point = await tips1.getBoundsCenter();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      let center2_X: number = center1.x+POSITION_X;
      let center2_Y: number = center1.y;
      await driver.mouseMoveTo({x:center2_X,y:center2_Y});
      await Utils.sleep(SLEEP_TIME);
      let tips2: Component = await driver.findComponent(ON.type('Column').isAfter(ON.text('hover tips')));
      expect(!!tips2).assertTrue();
      let tipsPoint2Center: Point = await tips2.getBoundsCenter();
      let tipsBol: boolean = false
      if(JSON.stringify(tipsPoint1Center) === JSON.stringify(tipsPoint2Center)){
        tipsBol = true;
      }
      expect(tipsBol).assertTrue();
      await driver.mouseMoveTo({
        x: X, y: Y
      });
      await Utils.sleep(SLEEP_TIME);
      console.info('showAtAnchor_value_0005 END');
      done();
    });

  })
}