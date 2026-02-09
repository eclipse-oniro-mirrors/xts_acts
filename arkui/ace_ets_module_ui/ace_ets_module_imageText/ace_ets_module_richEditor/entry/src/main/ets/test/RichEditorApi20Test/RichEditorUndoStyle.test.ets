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


export default function RichEditorUndoStyleTest() {
  describe('RichEditorUndoStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorUndoStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi20/RichEditorUndoStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorUndoStyleTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorUndoStyle" == pages.name)) {
          console.info("get RichEditorUndoStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorUndoStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorUndoStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorUndoStyleTest_0010
     * @tc.number SUB_ACE_RichEditorUndoStyleTest_0010
     * @tc.desc   test the attr of RichEditor: undoStyle(UndoStyle.CLEAR_STYLE)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorUndoStyleTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorUndoStyleTest_0010] START');
      let strJson = getInspectorByKey('RichEditor_undoStyle_CLEAR_STYLE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorUndoStyleTest_0010] undoStyle: ' + JSON.stringify(obj.$attrs.undoStyle));
      expect(obj.$attrs.undoStyle).assertEqual(0);
      console.info('[RichEditorUndoStyleTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorUndoStyleTest_0020
     * @tc.number SUB_ACE_RichEditorUndoStyleTest_0020
     * @tc.desc   test the attr of RichEditor: undoStyle(UndoStyle.KEEP_STYLE)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorUndoStyleTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorUndoStyleTest_0020] START');
      let strJson = getInspectorByKey('RichEditor_undoStyle_KEEP_STYLE');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorUndoStyleTest_0020] undoStyle: ' + JSON.stringify(obj.$attrs.undoStyle));
      expect(obj.$attrs.undoStyle).assertEqual(1);
      console.info('[RichEditorUndoStyleTest_0020] END');
      done();
    });

    /**
     * @tc.name   RichEditorUndoStyleTest_0030
     * @tc.number SUB_ACE_RichEditorUndoStyleTest_0030
     * @tc.desc   test the attr of RichEditor: undoStyle(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorUndoStyleTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorUndoStyleTest_0030] START');
      let strJson = getInspectorByKey('RichEditor_undoStyle_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorUndoStyleTest_0030] undoStyle: ' + JSON.stringify(obj.$attrs.undoStyle));
      expect(obj.$attrs.undoStyle).assertEqual(0);
      console.info('[RichEditorUndoStyleTest_0030] END');
      done();
    });

    /**
     * @tc.name   RichEditorUndoStyleTest_0040
     * @tc.number SUB_ACE_RichEditorUndoStyleTest_0040
     * @tc.desc   test the attr of RichEditor: undoStyle(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorUndoStyleTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorUndoStyleTest_0040] START');
      let strJson = getInspectorByKey('RichEditor_undoStyle_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[RichEditorUndoStyleTest_0040] undoStyle: ' + JSON.stringify(obj.$attrs.undoStyle));
      expect(obj.$attrs.undoStyle).assertEqual(0);
      console.info('[RichEditorUndoStyleTest_0040] END');
      done();
    });
  })
}