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

export default function onScrollIndexNullUndefinedTest() {
  describe('onScrollIndexNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("onScrollIndexNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcListDefault/onScrollIndexNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("onScrollIndexNullUndefinedTest" == pages.name)) {
          console.info("get onScrollIndexNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onScrollIndexNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onScrollIndexNullUndefinedTest page error:" + err);
      }
      console.info("onScrollIndexNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   arcListOnScrollIndexNullUndefined_0100
     * @tc.number SUB_ARKUI_ARCLIST_ONSCROLLINDEX_NULL_0100
     * @tc.desc   Test ArcList onScrollIndex property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListOnScrollIndexNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcListOnScrollIndexNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('arclist_onScrollIndex_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclist_onScrollIndex_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListOnScrollIndexNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.onScrollIndex));
      console.info("[arcListOnScrollIndexNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.onScrollIndex));

      // null 应该恢复为默认值 (onScrollIndex 在默认情况下可能不存在于 attrs 中)
      let hasDefaultCallback = objCompare.$attrs.onScrollIndex !== undefined && objCompare.$attrs.onScrollIndex !== null;
      let hasNullCallback = obj.$attrs.onScrollIndex !== undefined && obj.$attrs.onScrollIndex !== null;

      // 如果默认没有回调，null 后也应该没有
      if (!hasDefaultCallback) {
        expect(hasNullCallback).assertFalse();
      } else {
        expect(obj.$attrs.onScrollIndex).assertEqual(objCompare.$attrs.onScrollIndex);
      }
      console.info('[arcListOnScrollIndexNullUndefined_0100] END');
    })

    /**
     * @tc.name   arcListOnScrollIndexNullUndefined_0200
     * @tc.number SUB_ARKUI_ARCLIST_ONSCROLLINDEX_NULL_0200
     * @tc.desc   Test ArcList onScrollIndex property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcListOnScrollIndexNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[arcListOnScrollIndexNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('arclist_onScrollIndex_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('arclist_onScrollIndex_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[arcListOnScrollIndexNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.onScrollIndex));
      console.info("[arcListOnScrollIndexNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.onScrollIndex));

      // undefined 应该恢复为默认值
      let hasDefaultCallback = objCompare.$attrs.onScrollIndex !== undefined && objCompare.$attrs.onScrollIndex !== null;
      let hasUndefinedCallback = obj.$attrs.onScrollIndex !== undefined && obj.$attrs.onScrollIndex !== null;

      // 如果默认没有回调，undefined 后也应该没有
      if (!hasDefaultCallback) {
        expect(hasUndefinedCallback).assertFalse();
      } else {
        expect(obj.$attrs.onScrollIndex).assertEqual(objCompare.$attrs.onScrollIndex);
      }
      console.info('[arcListOnScrollIndexNullUndefined_0200] END');
    })
  })
}
