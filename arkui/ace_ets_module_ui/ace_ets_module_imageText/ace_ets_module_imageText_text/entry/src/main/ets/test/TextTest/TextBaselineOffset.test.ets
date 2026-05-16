/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextBaselineOffsetTest() {
  describe('TextBaselineOffsetTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextBaselineOffsetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextBaselineOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextBaselineOffsetTest state pages: " + JSON.stringify(pages));
        if (!("TextBaselineOffset" == pages.name)) {
          console.info("get TextBaselineOffsetTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextBaselineOffsetTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextBaselineOffsetTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textBaselineOffset_10_0100
     * @tc.number SUB_ARKUI_TEXT_BASELINEOFFSET_PARAM_0100
     * @tc.desc   测试 Text 的 baselineOffset 属性 - 正数 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textBaselineOffset_10_0100', Level.LEVEL0, async () => {
      console.info('[textBaselineOffset_10_0100] START');
      let strJson: string = getInspectorByKey('text_baselineoffset_10');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let baselineOffsetValue: string = obj.$attrs.baselineOffset as string;
      console.info('textBaselineOffset_10_0100 baselineOffsetValue: ' + baselineOffsetValue);
      expect(baselineOffsetValue).assertEqual('10');
      console.info('[textBaselineOffset_10_0100] END');
    });

    /**
     * @tc.name   textBaselineOffset_negative_0200
     * @tc.number SUB_ARKUI_TEXT_BASELINEOFFSET_PARAM_0200
     * @tc.desc   测试 Text 的 baselineOffset 属性 - 负数 -5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textBaselineOffset_negative_0200', Level.LEVEL0, async () => {
      console.info('[textTextCase_normal_0100] START');
      let strJson: string = getInspectorByKey('text_baselineoffset_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let baselineOffsetValue: string = obj.$attrs.baselineOffset as string;
      console.info('textBaselineOffset_negative_0200 baselineOffsetValue: ' + baselineOffsetValue);
      expect(baselineOffsetValue).assertEqual('-5');
      console.info('[textBaselineOffset_null_0400] END');
    });

    /**
     * @tc.name   textBaselineOffset_zero_0300
     * @tc.number SUB_ARKUI_TEXT_BASELINEOFFSET_PARAM_0300
     * @tc.desc   测试 Text 的 baselineOffset 属性 - 零值 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textBaselineOffset_zero_0300', Level.LEVEL0, async () => {
      console.info('[textBaselineOffset_zero_0300] START');
      let strJson: string = getInspectorByKey('text_baselineoffset_zero');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let baselineOffsetValue: string = obj.$attrs.baselineOffset as string;
      console.info('textBaselineOffset_zero_0300 baselineOffsetValue: ' + baselineOffsetValue);
      expect(baselineOffsetValue).assertEqual('0');
      console.info('[textBaselineOffset_zero_0300] END');
    });

    /**
     * @tc.name   textBaselineOffset_null_0400
     * @tc.number SUB_ARKUI_TEXT_BASELINEOFFSET_PARAM_0400
     * @tc.desc   测试 Text 的 baselineOffset 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textBaselineOffset_null_0400', Level.LEVEL0, async () => {
      console.info('[textBaselineOffset_null_0400] START');
      let strJsonCompare: string = getInspectorByKey('text_baselineoffset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_baselineoffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 确保属性读取成功
      expect(obj.$attrs.baselineOffset).not().assertUndefined();
      console.info('textBaselineOffset_null_0400 obj: ' + obj.$attrs.baselineOffset);
      console.info('textBaselineOffset_null_0400 objCompare:' + objCompare.$attrs.baselineOffset);
      // 断言两者最终属性值相等，判断设置 null 时是否正确触发默认值逻辑
      expect(obj.$attrs.baselineOffset).assertEqual(objCompare.$attrs.baselineOffset);
      console.info('[textBaselineOffset_null_0400] END');
    });

    /**
     * @tc.name   textBaselineOffset_undefined_0500
     * @tc.number SUB_ARKUI_TEXT_BASELINEOFFSET_PARAM_0500
     * @tc.desc   测试 Text 的 baselineOffset 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textBaselineOffset_undefined_0500', Level.LEVEL0, async () => {
      console.info('[textBaselineOffset_undefined_0500] START');
      let strJsonCompare: string = getInspectorByKey('text_baselineoffset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_baselineoffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // 确保属性读取成功
      expect(obj.$attrs.baselineOffset).not().assertUndefined();
      console.info('textBaselineOffset_undefined_0500 obj: ' + obj.$attrs.baselineOffset);
      console.info('textBaselineOffset_undefined_0500 objCompare:' + objCompare.$attrs.baselineOffset);
      // 断言两者最终属性值相等，判断设置 undefined 时是否正确触发默认值逻辑
      expect(obj.$attrs.baselineOffset).assertEqual(objCompare.$attrs.baselineOffset);
      console.info('[textBaselineOffset_undefined_0500] END');
    });
  });
}