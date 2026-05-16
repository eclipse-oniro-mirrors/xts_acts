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

export default function headerFooterStyle() {
  describe('headerFooterStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("headerFooterStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItemGroup/headerFooterStyle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get headerFooterStyle state pages:" + JSON.stringify(pages));
        if (!("headerFooterStyle" == pages.name)) {
          console.info("get headerFooterStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push headerFooterStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push headerFooterStyle page error:" + err);
      }
      console.info("headerFooterStyle beforeEach end");
      done();
    });

    /**
     * @tc.name   listItemGroupHeaderStyle_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_PARAM_0100
     * @tc.desc   Test ListItemGroup headerStyle property with NONE value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupHeaderStyle_0100] START');
      let strJson: string = getInspectorByKey('list_headerStyle_none');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupHeaderStyle_0100] obj.$type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupHeaderStyle_0100] headerStyle: " + JSON.stringify(obj.$attrs.headerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      console.info('listItemGroupHeaderStyle_0100 NONE: ' + ListItemGroupHeaderFooterStyle.NONE);
      expect(ListItemGroupHeaderFooterStyle.NONE).assertEqual(0);
      console.info('[listItemGroupHeaderStyle_0100] END');
      done();
    })

    /**
     * @tc.name   listItemGroupHeaderStyle_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_PARAM_0200
     * @tc.desc   Test ListItemGroup headerStyle property with FLOATING value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupHeaderStyle_0200] START');
      let strJson: string = getInspectorByKey('list_headerStyle_floating');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupHeaderStyle_0200] obj.$type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupHeaderStyle_0200] headerStyle: " + JSON.stringify(obj.$attrs.headerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      console.info('listItemGroupHeaderStyle_0200 FLOATING: ' + ListItemGroupHeaderFooterStyle.FLOATING);
      expect(ListItemGroupHeaderFooterStyle.FLOATING).assertEqual(1);

      console.info('[listItemGroupHeaderStyle_0200] END');
      done();
    })

    /**
     * @tc.name   listItemGroupHeaderStyle_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_PARAM_0300
     * @tc.desc   Test ListItemGroup headerStyle property with undefined value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupHeaderStyle_0300] START');
      let strJsonDefault: string = getInspectorByKey('list_headerStyle_none');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJson: string = getInspectorByKey('list_headerStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupHeaderStyle_0300] headerStyleDefault: " + JSON.stringify(objDefault.$attrs.headerStyle));
      console.info("[listItemGroupHeaderStyle_0300] headerStyle: " + JSON.stringify(obj.$attrs.headerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      expect(obj.$attrs.headerStyle).assertEqual(objDefault.$attrs.headerStyle);
      console.info('[listItemGroupHeaderStyle_0300] END');
      done();
    })

    /**
     * @tc.name   listItemGroupHeaderStyle_0400
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_PARAM_0400
     * @tc.desc   Test ListItemGroup headerStyle property with null value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupHeaderStyle_0400] START');

      let strJsonDefault: string = getInspectorByKey('list_headerStyle_none');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJson: string = getInspectorByKey('list_headerStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupHeaderStyle_0400] headerStyleDefault: " + JSON.stringify(objDefault.$attrs.headerStyle));
      console.info("[listItemGroupHeaderStyle_0400] headerStyle: " + JSON.stringify(obj.$attrs.headerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      expect(obj.$attrs.headerStyle).assertEqual(objDefault.$attrs.headerStyle);
      console.info('[listItemGroupHeaderStyle_0400] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_PARAM_0100
     * @tc.desc   Test ListItemGroup footerStyle property with NONE value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupFooterStyle_0100] START');
      let strJson: string = getInspectorByKey('list_footerStyle_none');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupFooterStyle_0100] obj.$type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupFooterStyle_0100] footerStyle: " + JSON.stringify(obj.$attrs.footerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      console.info('ListItemGroupArea_0200 NONE: ' + ListItemGroupHeaderFooterStyle.NONE);
      expect(ListItemGroupHeaderFooterStyle.NONE).assertEqual(0);
      console.info('[listItemGroupFooterStyle_0100] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_PARAM_0200
     * @tc.desc   Test ListItemGroup footerStyle property with FLOATING value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupFooterStyle_0200] START');

      let strJson: string = getInspectorByKey('list_footerStyle_floating');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupFooterStyle_0200] obj.$type: " + JSON.stringify(obj.$type));
      console.info("[listItemGroupFooterStyle_0200] footerStyle: " + JSON.stringify(obj.$attrs.footerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      console.info('ListItemGroupArea_0200 NONE: ' + ListItemGroupHeaderFooterStyle.NONE);
      expect(ListItemGroupHeaderFooterStyle.FLOATING).assertEqual(1);
      console.info('[listItemGroupFooterStyle_0200] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_PARAM_0300
     * @tc.desc   Test ListItemGroup footerStyle property with undefined value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupFooterStyle_0300] START');
      let strJsonDefault: string = getInspectorByKey('list_footerStyle_none');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJson: string = getInspectorByKey('list_footerStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupFooterStyle_0300] footerStyleDefault: " + JSON.stringify(objDefault.$attrs.footerStyle));
      console.info("[listItemGroupFooterStyle_0300] footerStyle: " + JSON.stringify(obj.$attrs.footerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      expect(obj.$attrs.footerStyle).assertEqual(objDefault.$attrs.footerStyle);
      console.info('[listItemGroupFooterStyle_0300] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_0400
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_PARAM_0400
     * @tc.desc   Test ListItemGroup footerStyle property with null value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[listItemGroupFooterStyle_0400] START');
      let strJsonDefault: string = getInspectorByKey('list_footerStyle_none');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJson: string = getInspectorByKey('list_footerStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listItemGroupFooterStyle_0400] footerStyleDefault: " + JSON.stringify(objDefault.$attrs.footerStyle));
      console.info("[listItemGroupFooterStyle_0400] footerStyle: " + JSON.stringify(obj.$attrs.footerStyle));

      expect(obj.$type).assertEqual('ListItemGroup');
      expect(obj.$attrs.footerStyle).assertEqual(objDefault.$attrs.footerStyle);
      console.info('[listItemGroupFooterStyle_0400] END');
      done();
    })
  })
}