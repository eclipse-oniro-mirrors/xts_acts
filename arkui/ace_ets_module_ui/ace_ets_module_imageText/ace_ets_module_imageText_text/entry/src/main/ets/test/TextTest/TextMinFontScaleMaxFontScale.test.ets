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

export default function TextMinFontScaleMaxFontScaleTest() {
  describe('TextMinFontScaleMaxFontScaleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMinFontScaleMaxFontScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMinFontScaleMaxFontScale',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMinFontScaleMaxFontScaleTest state pages: " + JSON.stringify(pages));
        if (!("TextMinFontScaleMaxFontScale" == pages.name)) {
          console.info("get TextMinFontScaleMaxFontScaleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMinFontScaleMaxFontScaleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMinFontScaleMaxFontScaleTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   textMinFontScale_0100
     * @tc.number SUB_ARKUI_TEXT_MINFONTSCALE_PARAM_0100
     * @tc.desc   测试 Text minFontScale 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMinFontScale_0100', Level.LEVEL0, async () => {
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMinFontScale_0100 START');
      
      // 获取默认值组件信息
      let strJsonCompare: string = getInspectorByKey('text_minfontscale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      
      // 获取 null 参数组件信息
      let strJson: string = getInspectorByKey('text_minfontscale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'default minFontScale: ' + JSON.stringify(objCompare.$attrs.minFontScale));
      console.info('TextMinFontScaleMaxFontScaleTest', 'null minFontScale: ' + JSON.stringify(obj.$attrs.minFontScale));
      
      // 确保属性读取成功
      expect(obj.$attrs.minFontScale).not().assertUndefined();
      
      // 断言两者最终属性值相等，说明 null 参数正确恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMinFontScale_0100 END');
    });

    /**
     * @tc.name   textMinFontScale_0200
     * @tc.number SUB_ARKUI_TEXT_MINFONTSCALE_PARAM_0200
     * @tc.desc   测试 Text minFontScale 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMinFontScale_0200', Level.LEVEL0, async () => {
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMinFontScale_0200 START');
      
      // 获取默认值组件信息
      let strJsonCompare: string = getInspectorByKey('text_minfontscale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      
      // 获取 undefined 参数组件信息
      let strJson: string = getInspectorByKey('text_minfontscale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'default minFontScale: ' + JSON.stringify(objCompare.$attrs.minFontScale));
      console.info('TextMinFontScaleMaxFontScaleTest', 'undefined minFontScale: ' + JSON.stringify(obj.$attrs.minFontScale));
      
      // 确保属性读取成功
      expect(obj.$attrs.minFontScale).not().assertUndefined();
      
      // 断言两者最终属性值相等，说明 undefined 参数正确恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMinFontScale_0200 END');
    });

    /**
     * @tc.name   textMaxFontScale_0100
     * @tc.number SUB_ARKUI_TEXT_MAXFONTSCALE_PARAM_0100
     * @tc.desc   测试 Text maxFontScale 属性 - null 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMaxFontScale_0100', Level.LEVEL0, async () => {
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMaxFontScale_0100 START');
      
      // 获取默认值组件信息
      let strJsonCompare: string = getInspectorByKey('text_maxfontscale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      
      // 获取 null 参数组件信息
      let strJson: string = getInspectorByKey('text_maxfontscale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'default maxFontScale: ' + JSON.stringify(objCompare.$attrs.maxFontScale));
      console.info('TextMinFontScaleMaxFontScaleTest', 'null maxFontScale: ' + JSON.stringify(obj.$attrs.maxFontScale));
      
      // 确保属性读取成功
      expect(obj.$attrs.maxFontScale).not().assertUndefined();
      
      // 断言两者最终属性值相等，说明 null 参数正确恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMaxFontScale_0100 END');
    });

    /**
     * @tc.name   textMaxFontScale_0200
     * @tc.number SUB_ARKUI_TEXT_MAXFONTSCALE_PARAM_0200
     * @tc.desc   测试 Text maxFontScale 属性 - undefined 参数应恢复默认值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textMaxFontScale_0200', Level.LEVEL0, async () => {
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMaxFontScale_0200 START');
      
      // 获取默认值组件信息
      let strJsonCompare: string = getInspectorByKey('text_maxfontscale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      
      // 获取 undefined 参数组件信息
      let strJson: string = getInspectorByKey('text_maxfontscale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'default maxFontScale: ' + JSON.stringify(objCompare.$attrs.maxFontScale));
      console.info('TextMinFontScaleMaxFontScaleTest', 'undefined maxFontScale: ' + JSON.stringify(obj.$attrs.maxFontScale));
      
      // 确保属性读取成功
      expect(obj.$attrs.maxFontScale).not().assertUndefined();
      
      // 断言两者最终属性值相等，说明 undefined 参数正确恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      
      console.info('TextMinFontScaleMaxFontScaleTest', 'textMaxFontScale_0200 END');
    });
  });
}