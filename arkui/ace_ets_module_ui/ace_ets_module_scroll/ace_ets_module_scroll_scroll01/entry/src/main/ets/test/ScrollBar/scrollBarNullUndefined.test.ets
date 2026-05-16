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
import events_emitter from '@ohos.events.emitter';

export default function scrollBarNullUndefined() {
  describe('scrollBarNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollBarNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollBar/scrollBarNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollBarNullUndefined state pages:" + JSON.stringify(pages));
        if (!("scrollBarNullUndefined" == pages.name)) {
          console.info("get scrollBarNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollBarNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBarNullUndefined page error:" + err);
      }
      console.info("scrollBarNullUndefined beforeEach end");
      done();
    });

    // ========== enableNestedScroll tests ==========
    /**
     * @tc.name   enableNestedScrollNullUndefined_0100
     * @tc.number enableNestedScrollNullUndefined_0100
     * @tc.desc   Test ScrollBar enableNestedScroll property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableNestedScrollNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[enableNestedScrollNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('scrollBar_enableNestedScroll_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[enableNestedScrollNullUndefined_0100] default obj is: " + JSON.stringify(obj.$attrs.enableNestedScroll));

      // ScrollBar enableNestedScroll 不设置
      expect(obj.$attrs.enableNestedScroll).assertEqual("false");
      console.info('[enableNestedScrollNullUndefined_0100] END');
    })

    /**
     * @tc.name   enableNestedScrollNullUndefined_0200
     * @tc.number enableNestedScrollNullUndefined_0200
     * @tc.desc   Test ScrollBar enableNestedScroll property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableNestedScrollNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[enableNestedScrollNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('scrollBar_enableNestedScroll_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[enableNestedScrollNullUndefined_0200] default obj is: " + JSON.stringify(obj.$attrs.enableNestedScroll));

      // ScrollBar enableNestedScroll 设置null
      expect(obj.$attrs.enableNestedScroll).assertEqual("false");
      console.info('[enableNestedScrollNullUndefined_0200] END');
    })

    /**
     * @tc.name   enableNestedScrollNullUndefined_0300
     * @tc.number enableNestedScrollNullUndefined_0300
     * @tc.desc   Test ScrollBar enableNestedScroll property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableNestedScrollNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[enableNestedScrollNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('scrollBar_enableNestedScroll_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[enableNestedScrollNullUndefined_0300] default obj is: " + JSON.stringify(obj.$attrs.enableNestedScroll));

      // ScrollBar enableNestedScroll 设置undefined
      expect(obj.$attrs.enableNestedScroll).assertEqual("false");
      console.info('[enableNestedScrollNullUndefined_0300] END');
    })

    // ========== scrollBarColor tests ==========
    /**
     * @tc.name   scrollBarColorNullUndefined_0100
     * @tc.number scrollBarColorNullUndefined_0100
     * @tc.desc   Test ScrollBar scrollBarColor property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarColorNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scrollBarColorNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('scrollBar_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scrollBar_scrollBarColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollBarColorNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[scrollBarColorNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // ScrollBar scrollBarColor 设置null
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[scrollBarColorNullUndefined_0100] END');
    })

    /**
     * @tc.name   scrollBarColorNullUndefined_0200
     * @tc.number scrollBarColorNullUndefined_0200
     * @tc.desc   Test ScrollBar scrollBarColor property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarColorNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[scrollBarColorNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('scrollBar_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('scrollBar_scrollBarColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scrollBarColorNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[scrollBarColorNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // ScrollBar scrollBarColor 设置undefined
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[scrollBarColorNullUndefined_0200] END');
    })
  })
}