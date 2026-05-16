/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeChain() {
  describe('RelativeChain', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeChain beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeChain state pages:" + JSON.stringify(pages));
        if (!("RelativeChain" == pages.name)) {
          console.info("get  RelativeChain pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeChain page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeChain page error:" + err);
      }
      console.info("RelativeChain foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain after each called");
    });


    /**
     * @tc.name   RelativeChain_001
     * @tc.number RelativeChain_001
     * @tc.desc   RelativeChain_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row1.left - rel.left) - Math.round(row2.left - row1.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.left - row1.right) - Math.round(row3.left - row2.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row3.left - row2.right) - Math.round(rel.right - row3.right)) <= 1).assertTrue();

      console.info('[RelativeChain_001] END');
      done();
    });


    /**
     * @tc.name   RelativeChain_002
     * @tc.number RelativeChain_002
     * @tc.desc   RelativeChain_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain_002', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain_002] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('RelativeChainBt_1'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeChain');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain_002] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row1.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.left - row1.right) - Math.round(row3.left - row2.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(rel.right - row3.right)) <= 1).assertTrue();

      console.info('[RelativeChain_002] END');
      done();
    });


    /**
     * @tc.name   RelativeChain_003
     * @tc.number RelativeChain_003
     * @tc.desc   RelativeChain_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeChain_003', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeChain_003] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('RelativeChainBt_2'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeChain');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain_003] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));

      expect(Math.abs(Math.round(row2.left - row1.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row3.left - row2.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row1.left - rel.left) - Math.round(rel.right - row3.right)) <= 1).assertTrue();

      console.info('[RelativeChain_003] END');
      done();
    });
  })
}
