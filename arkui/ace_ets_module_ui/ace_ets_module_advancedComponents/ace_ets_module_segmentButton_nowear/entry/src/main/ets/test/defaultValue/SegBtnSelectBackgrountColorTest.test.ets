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

export default function SegBtnSelectBackgrountColorTest() {
  describe('SegBtnSelectBackgrountColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SegBtnSelectBackgrountColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/defaultValue/SegBtnSelectBackgrountColor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegBtnSelectBackgrountColorTest" == pages.name)) {
          console.info("get SegBtnSelectBackgrountColorTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegBtnSelectBackgrountColorTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegBtnSelectBackgrountColorTest page error:" + err);
      }
      console.info("SegBtnSelectBackgrountColorTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegBtnSelectBackgrountColorTest after each called");
    });

    /**
     * @tc.name   SegBtnSelectBackgrountColorTest_001
     * @tc.number SegBtnSelectBackgrountColorTest_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegBtnSelectBackgrountColorTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SegBtnSelectBackgrountColorTest_001] START');
      await CommonFunc.sleep(1000);
      let result: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      let selectedBackgroundColor0: string =
        result.$children[0].$children[0].$children[1].$children[0].$attrs.backgroundColor;
      let selectedBackgroundColor1: string =
        result.$children[0].$children[1].$children[1].$children[0].$attrs.backgroundColor;
      let selectedBackgroundColor2: string =
        result.$children[0].$children[2].$children[1].$children[0].$attrs.backgroundColor;
      let selectedBackgroundColor3: string =
        result.$children[0].$children[3].$children[1].$children[0].$attrs.backgroundColor;
      let selectedBackgroundColor_1: string | undefined = AppStorage.get<string>('selectedBackgroundColor_1')
      let selectedBackgroundColor_2: string | undefined = AppStorage.get<string>('selectedBackgroundColor_2')
      await CommonFunc.sleep(2000);
      console.log("SegBtnSelectBackgrountColorTest_001 selectedBackgroundColor0 ", selectedBackgroundColor0)
      console.log("SegBtnSelectBackgrountColorTest_001 selectedBackgroundColor1 ", selectedBackgroundColor1)
      console.log("SegBtnSelectBackgrountColorTest_001 selectedBackgroundColor2 ", selectedBackgroundColor2)
      console.log("SegBtnSelectBackgrountColorTest_001 selectedBackgroundColor3 ", selectedBackgroundColor3)
      console.log("SegBtnSelectBackgrountColorTest_001 selectedBackgroundColor_1 ", selectedBackgroundColor_1)
      console.log("SegBtnSelectBackgrountColorTest_001 selectedBackgroundColor_2 ", selectedBackgroundColor_2)
      expect(selectedBackgroundColor0).assertEqual(selectedBackgroundColor_1);
      expect(selectedBackgroundColor1).assertEqual(selectedBackgroundColor_1);
      expect(selectedBackgroundColor2).assertEqual(selectedBackgroundColor_2);
      expect(selectedBackgroundColor3).assertEqual(selectedBackgroundColor_2);
      AppStorage.delete('selectedBackgroundColor_1');
      AppStorage.delete('selectedBackgroundColor_2');
      await CommonFunc.sleep(2000);
      console.info('[SegBtnSelectBackgrountColorTest_001] END');
      done();
    });

  })
}