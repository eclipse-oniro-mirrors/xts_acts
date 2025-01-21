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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeChain2 () {
  describe('RelativeChain2', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeChain2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeChain2 state pages:" + JSON.stringify(pages));
        if (!("RelativeChain2" == pages.name)) {
          console.info("get  RelativeChain2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain2"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeChain2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeChain2 page error:" + err);
      }
      console.info("RelativeChain2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain2 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0400
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeChain2_001', 0, async (done: Function) => {
      console.info('[RelativeChain2_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain2');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow2_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow2_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow2_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain2_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row1.top - rel.top) - Math.round(row2.top - row1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.top - row1.bottom) - Math.round(row3.top - row2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row3.top - row2.bottom) - Math.round(rel.bottom - row3.bottom)) <= 1).assertTrue();

      console.info('[RelativeChain2_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0410
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeChain2_002', 0, async (done: Function) => {
      console.info('[RelativeChain2_002] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('RelativeChain2Bt_1'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeChain2');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow2_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow2_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow2_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain2_002] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row1.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.top - row1.bottom) - Math.round(row3.top - row2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(rel.bottom - row3.bottom)) <= 1).assertTrue();

      console.info('[RelativeChain2_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0420
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeChain2_003', 0, async (done: Function) => {
      console.info('[RelativeChain2_003] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('RelativeChain2Bt_2'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeChain2');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow2_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow2_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow2_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain2_003] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(row2.top - row1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row3.top - row2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row1.top - rel.top) - Math.round(rel.bottom - row3.bottom)) <= 1).assertTrue();

      console.info('[RelativeChain2_003] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0520
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeChain2_004', 0, async (done: Function) => {
      console.info('[RelativeChain2_004] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('Relative2Height'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);
      let rel = CommonFunc.getComponentRect('RelativeChain2');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow2_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow2_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow2_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain2_004] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));

      expect(Math.abs(Math.round(row1.top - rel.top) - Math.round(row2.top - row1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.top - row1.bottom) - Math.round(row3.top - row2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row3.top - row2.bottom) - Math.round(rel.bottom - row3.bottom)) <= 1).assertTrue();

      console.info('[RelativeChain2_004] END');
      done();
    });






  })
}
