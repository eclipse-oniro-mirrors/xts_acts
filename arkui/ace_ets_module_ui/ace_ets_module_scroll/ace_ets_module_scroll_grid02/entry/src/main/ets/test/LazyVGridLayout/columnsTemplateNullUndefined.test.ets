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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function columnsTemplateNullUndefined() {
  describe('columnsTemplateNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("columnsTemplateNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/columnsTemplateNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnsTemplateNullUndefined state pages:" + JSON.stringify(pages));
        if (!("columnsTemplateNullUndefined" == pages.name)) {
          console.info("get columnsTemplateNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push columnsTemplateNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnsTemplateNullUndefined page error:" + err);
      }
      console.info("columnsTemplateNullUndefined beforeEach end");
      done();
    });

    // ========== columnsTemplate tests (string) ==========
    /**
     * @tc.name   columnsTemplateNullUndefined_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_NULL_0100
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[columnsTemplateNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnsTemplateNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // LazyVGridLayout columnsTemplate 不设置，默认值1列
      expect(obj.$attrs.columnsTemplate).assertEqual("");
      console.info('[columnsTemplateNullUndefined_0100] END');
    })

    /**
     * @tc.name   columnsTemplateNullUndefined_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_NULL_0200
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[columnsTemplateNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnsTemplateNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateNullUndefined_0200] empty string obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // LazyVGridLayout columnsTemplate 设置空字符串，应恢复为默认值（固定1列）
      expect(obj.$attrs.columnsTemplate).assertEqual("1fr");
      console.info('[columnsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   columnsTemplateNullUndefined_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_NULL_0300
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[columnsTemplateNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnsTemplateNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // LazyVGridLayout columnsTemplate 设置null
      expect(obj.$attrs.columnsTemplate).assertEqual("null");
      console.info('[columnsTemplateNullUndefined_0300] END');
    })

    /**
     * @tc.name   columnsTemplateNullUndefined_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSTEMPLATE_UNDEFINED_0400
     * @tc.desc   Test LazyVGridLayout columnsTemplate property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsTemplateNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[columnsTemplateNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('lazyVGrid_columnsTemplate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnsTemplateNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[columnsTemplateNullUndefined_0400] undefined obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // LazyVGridLayout columnsTemplate 设置undefined
      expect(obj.$attrs.columnsTemplate).assertEqual("undefined");
      console.info('[columnsTemplateNullUndefined_0400] END');
    })
  })
}
