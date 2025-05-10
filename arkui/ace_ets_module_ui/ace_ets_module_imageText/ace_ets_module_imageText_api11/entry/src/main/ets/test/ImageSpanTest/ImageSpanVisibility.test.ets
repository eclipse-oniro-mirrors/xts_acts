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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function ImageSpanVisibilityTest() {
  describe('ImageSpanVisibilityTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageSpanVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/ImageSpanVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageSpanVisibilityTest state pages: " + JSON.stringify(pages));
        if (!("ImageSpanVisibility" == pages.name)) {
          console.info("get ImageSpanVisibilityTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageSpanVisibilityTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageSpanVisibilityTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_ImageSpanVisibilityTest_0010
     * @tc.name      ImageSpanVisibilityTest_0010
     * @tc.desc      test ImageSpan Visibility: Visibility.None
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageSpanVisibilityTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanVisibilityTest_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_Visibility_None');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageSpanVisibilityTest_0010] ImageSpan Visibility is: " + JSON.stringify(obj.$attrs.visibility));
      expect(obj.$attrs.visibility).assertEqual('Visibility.None');
      console.info('[ImageSpanVisibilityTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ImageSpanVisibilityTest_0020
     * @tc.name      ImageSpanVisibilityTest_0020
     * @tc.desc      test ImageSpan Visibility: Visibility.Hidden
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageSpanVisibilityTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanVisibilityTest_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_Visibility_Hidden');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageSpanVisibilityTest_0020] ImageSpan Visibility is: " + JSON.stringify(obj.$attrs.visibility));
      expect(obj.$attrs.visibility).assertEqual('Visibility.Hidden');
      console.info('[ImageSpanVisibilityTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ImageSpanVisibilityTest_0030
     * @tc.name      ImageSpanVisibilityTest_0030
     * @tc.desc      test ImageSpan Visibility: Visibility.Visible
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageSpanVisibilityTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanVisibilityTest_0030 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_Visibility_Visible');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageSpanVisibilityTest_0030] ImageSpan Visibility is: " + JSON.stringify(obj.$attrs.visibility));
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[ImageSpanVisibilityTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ImageSpanVisibilityTest_0040
     * @tc.name      ImageSpanVisibilityTest_0040
     * @tc.desc      test ImageSpan Visibility: default
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageSpanVisibilityTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanVisibilityTest_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_Visibility_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageSpanVisibilityTest_0040] ImageSpan Visibility is: " + JSON.stringify(obj.$attrs.visibility));
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[ImageSpanVisibilityTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ImageSpanVisibilityTest_0050
     * @tc.name      ImageSpanVisibilityTest_0050
     * @tc.desc      test ImageSpan Visibility: undefined
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('ImageSpanVisibilityTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('ImageSpanVisibilityTest_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_Visibility_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ImageSpanVisibilityTest_0050] ImageSpan Visibility is: " + JSON.stringify(obj.$attrs.visibility));
      expect(obj.$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[ImageSpanVisibilityTest_0050] END');
      done();
    });
  })
}
