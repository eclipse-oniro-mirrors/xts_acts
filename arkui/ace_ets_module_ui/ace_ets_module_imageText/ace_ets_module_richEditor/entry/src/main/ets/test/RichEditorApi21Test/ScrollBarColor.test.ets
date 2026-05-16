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


export default function RichEditorScrollBarColorTest() {
  describe('RichEditorScrollBarColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorScrollBarColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi21/ScrollBarColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorScrollBarColorTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorscrollBarColor" == pages.name)) {
          console.info("get RichEditorScrollBarColorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorScrollBarColorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorScrollBarColorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorScrollBarColorTest_0010
     * @tc.number SUB_ACE_RichEditorScrollBarColorTest_0010
     * @tc.desc   test the attr of RichEditor: scrollBarColor(ColorMetrics.resourceColor)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorScrollBarColorTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorScrollBarColorTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_ColorMetrics_resourceColor');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorScrollBarColorTest_0010] value: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertEqual('#FF2787D9');
      console.info('[RichEditorScrollBarColorTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorScrollBarColorTest_0020
     * @tc.number SUB_ACE_RichEditorScrollBarColorTest_0020
     * @tc.desc   test the attr of RichEditor: scrollBarColor(ColorMetrics.rgba)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorScrollBarColorTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorScrollBarColorTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_ColorMetrics_rgba');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorScrollBarColorTest_0020] value: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertEqual('#FFE182E1');
      console.info('[RichEditorScrollBarColorTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorScrollBarColorTest_0030
     * @tc.number SUB_ACE_RichEditorScrollBarColorTest_0030
     * @tc.desc   test the attr of RichEditor: scrollBarColor(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorScrollBarColorTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorScrollBarColorTest_0030] START');
      let strJson = getInspectorByKey('RichEditor_scrollBarColor_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorScrollBarColorTest_0030] value: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertContain('#');
      console.info('[RichEditorScrollBarColorTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorScrollBarColorTest_0040
     * @tc.number SUB_ACE_RichEditorScrollBarColorTest_0040
     * @tc.desc   test the attr of RichEditor: scrollBarColor(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorScrollBarColorTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorScrollBarColorTest_0040] START');
      let strJson = getInspectorByKey('RichEditor_scrollBarColor_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorScrollBarColorTest_0040] value: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertContain('#');
      console.info('[RichEditorScrollBarColorTest_0040] END');
      done();
    });

    /**
     * @tc.name   RichEditorScrollBarColorTest_0050
     * @tc.number SUB_ACE_RichEditorScrollBarColorTest_0050
     * @tc.desc   test the attr of RichEditor: scrollBarColor(null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorScrollBarColorTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorScrollBarColorTest_0050] START');
      let strJson = getInspectorByKey('RichEditor_scrollBarColor_null');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorScrollBarColorTest_0050] value: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor).assertContain('#');
      console.info('[RichEditorScrollBarColorTest_0050] END');
      done();
    });
  })
}