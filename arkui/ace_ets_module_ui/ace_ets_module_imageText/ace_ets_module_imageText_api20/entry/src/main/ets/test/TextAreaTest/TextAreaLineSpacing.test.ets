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


export default function TextAreaLineSpacingTest() {
  describe('TextAreaLineSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaLineSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaLineSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaLineSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaLineSpacing" == pages.name)) {
          console.info("get TextAreaLineSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaLineSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaLineSpacingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0010
     * @tc.name      TextAreaLineSpacingTest_0010
     * @tc.desc      test the attr of TextArea: lineSpacing(LengthMetrics.lpx(20), { onlyBetweenLines: true })
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0010] START');
      let strJson = getInspectorByKey('TextArea_lineSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0010] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0010] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('20.00lpx');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('true');
      console.info('[TextAreaLineSpacingTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0020
     * @tc.name      TextAreaLineSpacingTest_0020
     * @tc.desc      test the attr of TextArea: lineSpacing(LengthMetrics.percent(1), { onlyBetweenLines: false })
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0020] START');
      let strJson = getInspectorByKey('TextArea_lineSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0020] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0020] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('30.00%');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0030
     * @tc.name      TextAreaLineSpacingTest_0030
     * @tc.desc      test the attr of TextArea: lineSpacing(default)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0030] START');
      let strJson = getInspectorByKey('TextArea_lineSpacing_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0030] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0030] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('0.00vp');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0040
     * @tc.name      TextAreaLineSpacingTest_0040
     * @tc.desc      test the attr of TextArea: lineSpacing(undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0040] START');
      let strJson = getInspectorByKey('TextArea_lineSpacing_undefined_all');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0040] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0040] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('0.00px');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0050
     * @tc.name      TextAreaLineSpacingTest_0050
     * @tc.desc      test the attr of TextAreaModifier: lineSpacing(LengthMetrics.px(20), { onlyBetweenLines: true })
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0050] START');
      let strJson = getInspectorByKey('TextAreaModifier_lineSpacing_true');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0050] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0050] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('20.00px');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('true');
      console.info('[TextAreaLineSpacingTest_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0060
     * @tc.name      TextAreaLineSpacingTest_0060
     * @tc.desc      test the attr of TextAreaModifier: lineSpacing(LengthMetrics.vp(20), { onlyBetweenLines: false })
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0060', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0060] START');
      let strJson = getInspectorByKey('TextAreaModifier_lineSpacing_false');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0060] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0060] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('20.00vp');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0070
     * @tc.name      TextAreaLineSpacingTest_0070
     * @tc.desc      test the attr of TextAreaModifier: lineSpacing(LengthMetrics.fp(20), undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0070', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0070] START');
      let strJson = getInspectorByKey('TextAreaModifier_lineSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0070] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0070] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('20.00fp');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0070] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0080
     * @tc.name      TextAreaLineSpacingTest_0080
     * @tc.desc      test the attr of TextAreaModifier: lineSpacing(undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0080', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0080] START');
      let strJson = getInspectorByKey('TextAreaModifier_lineSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0080] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0080] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('20.00fp');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0080] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextAreaLineSpacingTest_0090
     * @tc.name      TextAreaLineSpacingTest_0090
     * @tc.desc      test the attr of TextArea: lineSpacing(LengthMetrics.vp(20), undefined)
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextAreaLineSpacingTest_0090', Level.LEVEL2, async (done: Function) => {
      console.info('[TextAreaLineSpacingTest_0090] START');
      let strJson = getInspectorByKey('TextArea_lineSpacing_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextAreaLineSpacingTest_0090] lineSpacing: ' + JSON.stringify(obj.$attrs.lineSpacing));
      console.info('[TextAreaLineSpacingTest_0090] onlyBetweenLines: ' + JSON.stringify(obj.$attrs.onlyBetweenLines));
      expect(obj.$attrs.lineSpacing).assertEqual('20.00vp');
      expect(obj.$attrs.onlyBetweenLines).assertEqual('false');
      console.info('[TextAreaLineSpacingTest_0090] END');
      done();
    });
  })
}