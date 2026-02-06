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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegBtnItemTest0010() {
  describe('SegBtnItemTest0010', () => {
    beforeEach(async (done: Function) => {
      console.info("SegBtnItemTest0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegBtnItem0010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegBtnItem0010" == pages.name)) {
          console.info("get SegBtnItemTest0010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegBtnItemTest0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegBtnItemTest0010 page error:" + err);
      }
      console.info("SegBtnItemTest0010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegBtnItemTest0010 after each called");
    });

    /**
     * @tc.name   SegBtnItemTest0010_001
     * @tc.number SegBtnItemTest0010_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegBtnItemTest0010_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SegBtnItemTest0010_001] START');
      await CommonFunc.sleep(1000);
      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
      console.info("[SegBtnItemTest0010_001] btn0.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn0.$attrs.accessibilityLevel));
      console.info("[SegBtnItemTest0010_001] btn0.$attrs.accessibilityDescription is: " +
      JSON.stringify(btn0.$attrs.accessibilityDescription));
      expect(btn0.$attrs.accessibilityLevel).assertEqual('auto');
      expect(btn0.$attrs.accessibilityDescription).assertEqual('tab1');
      await CommonFunc.sleep(500);
      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[1]
      console.info("[SegBtnItemTest0010_001] btn1.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn1.$attrs.accessibilityLevel));
      expect(btn1.$attrs.accessibilityLevel).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[2]
      console.info("[SegBtnItemTest0010_001] btn2.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn2.$attrs.accessibilityLevel));
      expect(btn2.$attrs.accessibilityLevel).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[3]
      console.info("[SegBtnItemTest0010_001]  btn3.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn3.$attrs.accessibilityLevel));
      expect(btn3.$attrs.accessibilityLevel).assertEqual('no-hide-descendants');
      console.info('[SegBtnItemTest0010_001] END');
      done();
    });

    /**
     * @tc.name   SegBtnItemTest0010_002
     * @tc.number SegBtnItemTest0010_002
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SegBtnItemTest0010_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SegBtnItemTest0010_002] START');
      await CommonFunc.sleep(1000);
      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[0]
      console.info("[SegBtnItemTest0010_001] btn0.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn0.$attrs.accessibilityLevel));
      console.info("[SegBtnItemTest0010_001] btn0.$attrs.accessibilityDescription is: " +
      JSON.stringify(btn0.$attrs.accessibilityDescription));
      expect(btn0.$attrs.accessibilityLevel).assertEqual('auto');
      expect(btn0.$attrs.accessibilityDescription).assertEqual('email1');
      await CommonFunc.sleep(500);
      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[1]
      console.info("[SegBtnItemTest0010_001] btn1.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn1.$attrs.accessibilityLevel));
      expect(btn1.$attrs.accessibilityLevel).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[2]
      console.info("[SegBtnItemTest0010_001] btn2.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn2.$attrs.accessibilityLevel));
      expect(btn2.$attrs.accessibilityLevel).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[3]
      console.info("[SegBtnItemTest0010_001] btn3.$attrs.accessibilityLevel is: " +
      JSON.stringify(btn3.$attrs.accessibilityLevel));
      expect(btn3.$attrs.accessibilityLevel).assertEqual('no-hide-descendants');
      await CommonFunc.sleep(500);
      let icon0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_001] icon0.$attrs.selectedIcon is: " +
      JSON.stringify(icon0.$attrs.src));
      console.info("[SegBtnItemTest0010_001] icon0.$attrs.accessibilityText is: " +
      JSON.stringify(icon0.$attrs.accessibilityText));
      expect(icon0.$attrs.src).assertEqual('resource:///125830169.svg');
      expect(icon0.$attrs.accessibilityText).assertEqual('email1');
      await CommonFunc.sleep(500);
      let icon1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[2]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[SegBtnItemTest0010_001] icon1.$attrs.icon is: " + JSON.stringify(icon1.$attrs.src));
      console.info("[SegBtnItemTest0010_001] icon1.$attrs.accessibilityText is: " +
      JSON.stringify(icon1.$attrs.accessibilityText));
      expect(icon1.$attrs.src).assertEqual('resource:///125830170.svg');
      expect(icon1.$attrs.accessibilityText).assertEqual('notSelect');
      console.info('[SegBtnItemTest0010_002] END');
      await CommonFunc.sleep(500);
      done();
    });
  })
}
