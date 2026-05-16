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

export default function BaseShapeWidthHeightNullUndefinedTest() {
  describe('BaseShapeWidthHeightNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("BaseShapeWidthHeightNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Shape/BaseShapeWidthHeightNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get BaseShapeWidthHeightNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("TextMethodsNull2" == pages.name)) {
          console.info("get BaseShapeWidthHeightNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push BaseShapeWidthHeightNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BaseShapeWidthHeightNullUndefinedTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001
     * @tc.number SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001
     * @tc.desc   测试 BaseShape clipShape 属性 width 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001 START');
      let strJson: string = getInspectorByKey('BaseShapeWidthHeightNullUndefined_Column_WidthNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.width).assertContain('vp');
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001 END');
    })

    /**
     * @tc.name   SUB_ARKUI_BASESHAPE_WIDTH_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_BASESHAPE_WIDTH_PARAM_UNDEFINED_001
     * @tc.desc   测试 BaseShape clipShape 属性 width 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_UNDEFINED_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_UNDEFINED_001 START');
      let strJson: string = getInspectorByKey('BaseShapeWidthHeightNullUndefined_Column_WidthUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.width).assertContain('vp');
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_UNDEFINED_001 END');
    })

    /**
     * @tc.name   SUB_ARKUI_BASESHAPE_WIDTH_PARAM_EMPTY_001
     * @tc.number SUB_ARKUI_BASESHAPE_WIDTH_PARAM_EMPTY_001
     * @tc.desc   测试 BaseShape clipShape 属性 width 参数为 ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_EMPTY_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_EMPTY_001 START');
      let strJson: string = getInspectorByKey('BaseShapeWidthHeightNullUndefined_Column_WidthEmpty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.width).assertContain('vp');
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_EMPTY_001 END');
    })

    /**
     * @tc.name   SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_NULL_001
     * @tc.number SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_NULL_001
     * @tc.desc   测试 BaseShape clipShape 属性 height 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_NULL_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_NULL_001 START');
      let strJson: string = getInspectorByKey('BaseShapeWidthHeightNullUndefined_Column_HeightNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.height).assertContain('vp');
      console.info('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_NULL_001 END');
    })

    /**
     * @tc.name   SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_UNDEFINED_001
     * @tc.desc   测试 BaseShape clipShape 属性 height 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_UNDEFINED_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_UNDEFINED_001 START');
      let strJson: string = getInspectorByKey('BaseShapeWidthHeightNullUndefined_Column_HeightUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.height).assertContain('vp');
      console.info('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_UNDEFINED_001 END');
    })

    /**
     * @tc.name   SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_EMPTY_001
     * @tc.number SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_EMPTY_001
     * @tc.desc   测试 BaseShape clipShape 属性 height 参数为 ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_EMPTY_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_EMPTY_001 START');
      let strJson: string = getInspectorByKey('BaseShapeWidthHeightNullUndefined_Column_HeightEmpty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.height).assertContain('vp');
      console.info('SUB_ARKUI_BASESHAPE_HEIGHT_PARAM_EMPTY_001 END');
    })
  })
}
