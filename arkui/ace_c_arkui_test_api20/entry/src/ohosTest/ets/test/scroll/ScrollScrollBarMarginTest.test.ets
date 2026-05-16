/*
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function scrollScrollBarMarginTest() {

  describe('ScrollScrollBarMarginTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(500)
      done()
    })

    /**
     * @tc.name   BarMarginScroll_001
     * @tc.number SUB_ARKUI_CAPI_BarMarginScroll_001
     * @tc.desc   Test changes of scroll bar margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BarMarginScroll_001', Level.LEVEL1, async (done: Function) => {
      console.info('BarMarginScroll_001 START');
      let PAGE_TAG = 'ScrollScrollBarMarginTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(100)
      let strJson1 = getInspectorByKey("scroll_001");
      console.info("str is"+ strJson1);
      await Utils.sleep(100)
      expect(JSON.parse(strJson1).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 10.00vp, end: 20.00vp");

      await Utils.sleep(100)
      let strJson2 = getInspectorByKey("scroll_002");
      console.info("str is"+ strJson2);
      await Utils.sleep(100)
      expect(JSON.parse(strJson2).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.10vp, end: 0.20vp");

      await Utils.sleep(100)
      let strJson3 = getInspectorByKey("scroll_003");
      console.info("str is"+ strJson3);
      await Utils.sleep(100)
      expect(JSON.parse(strJson3).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00vp, end: 0.00vp");
      console.info('scroll003 pass');

      await Utils.sleep(100)
      let strJson4 = getInspectorByKey("scroll_004");
      console.info("str is"+ strJson4);
      await Utils.sleep(100)
      expect(JSON.parse(strJson4).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 999.00vp, end: 999.00vp");
      console.info('scroll004 pass');

      console.info('[barMarginScroll_0100] END');
      done();
    })

    /**
     * @tc.name   BarMarginScroll_002
     * @tc.number SUB_ARKUI_CAPI_BarMarginScroll_002
     * @tc.desc   Test changes of scroll bar margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BarMarginScroll_002', Level.LEVEL1, async (done: Function) => {
      console.info('BarMarginScroll_002 START');
      let PAGE_TAG = 'ScrollScrollBarMarginTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(100)
      let strJson1 = getInspectorByKey("grid_001");
      console.info("str is"+ strJson1);
      await Utils.sleep(100)
      expect(JSON.parse(strJson1).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 10.00vp, end: 20.00vp");

      await Utils.sleep(100)
      let strJson2 = getInspectorByKey("grid_002");
      console.info("str is"+ strJson2);
      await Utils.sleep(100)
      expect(JSON.parse(strJson2).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.10vp, end: 0.20vp");

      await Utils.sleep(100)
      let strJson3 = getInspectorByKey("grid_003");
      console.info("str is"+ strJson3);
      await Utils.sleep(100)
      expect(JSON.parse(strJson3).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00vp, end: 0.00vp");
      console.info('grid003 pass');

      await Utils.sleep(100)
      let strJson4 = getInspectorByKey("grid_004");
      console.info("str is"+ strJson4);
      await Utils.sleep(100)
      expect(JSON.parse(strJson4).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 999.00vp, end: 999.00vp");
      console.info('grid004 pass');

      console.info('[barMarginScroll_0200] END');
      done();
    })

    /**
     * @tc.name   BarMarginScroll_003
     * @tc.number SUB_ARKUI_CAPI_BarMarginScroll_003
     * @tc.desc   Test changes of scroll bar margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BarMarginScroll_003', Level.LEVEL1, async (done: Function) => {
      console.info('BarMarginScroll_003 START');
      let PAGE_TAG = 'ScrollScrollBarMarginTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(100)
      let strJson1 = getInspectorByKey("waterFlow_001");
      console.info("str is"+ strJson1);
      await Utils.sleep(100)
      expect(JSON.parse(strJson1).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 10.00vp, end: 20.00vp");

      await Utils.sleep(100)
      let strJson2 = getInspectorByKey("waterFlow_002");
      console.info("str is"+ strJson2);
      await Utils.sleep(100)
      expect(JSON.parse(strJson2).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.10vp, end: 0.20vp");

      await Utils.sleep(100)
      let strJson3 = getInspectorByKey("waterFlow_003");
      console.info("str is"+ strJson3);
      await Utils.sleep(100)
      expect(JSON.parse(strJson3).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00vp, end: 0.00vp");

      await Utils.sleep(100)
      let strJson4 = getInspectorByKey("waterFlow_004");
      console.info("str is"+ strJson4);
      await Utils.sleep(100)
      expect(JSON.parse(strJson4).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 999.00vp, end: 999.00vp");


      console.info('[barMarginScroll_0300] END');
      done();
    })

    /**
     * @tc.name   BarMarginScroll_004
     * @tc.number SUB_ARKUI_CAPI_BarMarginScroll_004
     * @tc.desc   Test changes of scroll bar margin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BarMarginScroll_004', Level.LEVEL1, async (done: Function) => {
      console.info('BarMarginScroll_004 START');
      let PAGE_TAG = 'ScrollScrollBarMarginTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      await Utils.sleep(100)
      let strJson1 = getInspectorByKey("list_001");
      console.info("str is"+ strJson1);
      await Utils.sleep(100)
      expect(JSON.parse(strJson1).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 10.00vp, end: 20.00vp");

      await Utils.sleep(100)
      let strJson2 = getInspectorByKey("list_002");
      console.info("str is"+ strJson2);
      await Utils.sleep(100)
      expect(JSON.parse(strJson2).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.10vp, end: 0.20vp");

      await Utils.sleep(100)
      let strJson3 = getInspectorByKey("list_003");
      console.info("str is"+ strJson3);
      await Utils.sleep(100)
      expect(JSON.parse(strJson3).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 0.00vp, end: 0.00vp");

      await Utils.sleep(100)
      let strJson4 = getInspectorByKey("list_004");
      console.info("str is"+ strJson4);
      await Utils.sleep(100)
      expect(JSON.parse(strJson4).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 999.00vp, end: 999.00vp");


      console.info('[barMarginScroll_0400] END');
      done();
    })
  })
}