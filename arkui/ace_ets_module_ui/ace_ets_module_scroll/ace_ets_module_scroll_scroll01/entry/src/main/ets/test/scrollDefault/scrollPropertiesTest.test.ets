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

export default function scrollPropertiesTest() {
  describe('scrollPropertiesTest', () => {
    beforeAll(async (done: Function) => {
      console.info("scrollPropertiesTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scrollDefault/scrollPropertiesTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("scrollPropertiesTest" == pages.name)) {
          console.info("get scrollPropertiesTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollPropertiesTest page result:" + JSON.stringify(result));

          let driver = await Driver.create()
          let eventBtn = await driver.findComponent(ON.id('scrollEvent_nullUndefined_btn'));
          await eventBtn.click();
          console.info("scrollPropertiesTest click success");
          await CommonFunc.sleep(2000);
          done();
        }
      } catch (err) {
        console.error("push scrollPropertiesTest page error:" + err);
      }
      console.info("scrollPropertiesTest beforeEach end");
      done();
    });

    /**
     * @tc.name   autoAdjustScrollBarMargin_0100
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_PARAM_0100
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with true value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[autoAdjustScrollBarMargin_0100] START');

      let strJson: string = getInspectorByKey('scroll_autoAdjust_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[autoAdjustScrollBarMargin_0100] obj.$type: " + obj.$type);
      console.info("[autoAdjustScrollBarMargin_0100] autoAdjustScrollBarMargin: " +
        JSON.stringify(obj.$attrs.autoAdjustScrollBarMargin));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.autoAdjustScrollBarMargin).assertEqual('true');

      console.info('[autoAdjustScrollBarMargin_0100] END');
      done();
    })

    /**
     * @tc.name   autoAdjustScrollBarMargin_0200
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_PARAM_0200
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with false value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[autoAdjustScrollBarMargin_0200] START');

      let strJson: string = getInspectorByKey('scroll_autoAdjust_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[autoAdjustScrollBarMargin_0200] autoAdjustScrollBarMargin: " +
        JSON.stringify(obj.$attrs.autoAdjustScrollBarMargin));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.autoAdjustScrollBarMargin).assertEqual('false');

      console.info('[autoAdjustScrollBarMargin_0200] END');
      done();
    })

    /**
     * @tc.name   autoAdjustScrollBarMargin_0300
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_PARAM_0300
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with undefined value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[autoAdjustScrollBarMargin_0300] START');

      let strJson: string = getInspectorByKey('scroll_autoAdjust_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[autoAdjustScrollBarMargin_0300] autoAdjustScrollBarMargin: " +
        JSON.stringify(obj.$attrs.autoAdjustScrollBarMargin));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.autoAdjustScrollBarMargin).assertEqual('false');

      console.info('[autoAdjustScrollBarMargin_0300] END');
      done();
    })

    /**
     * @tc.name   autoAdjustScrollBarMargin_0400
     * @tc.number SUB_ARKUI_SCROLL_AUTOADJUSTSCROLLBARMARGIN_PARAM_0400
     * @tc.desc   Test Scroll autoAdjustScrollBarMargin property with null value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('autoAdjustScrollBarMargin_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[autoAdjustScrollBarMargin_0400] START');

      let strJson: string = getInspectorByKey('scroll_autoAdjust_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[autoAdjustScrollBarMargin_0400] autoAdjustScrollBarMargin: " +
        JSON.stringify(obj.$attrs.autoAdjustScrollBarMargin));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.autoAdjustScrollBarMargin).assertEqual('false');

      console.info('[autoAdjustScrollBarMargin_0400] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_0100
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_PARAM_0100
     * @tc.desc   Test Scroll enableScrollWithMouse property with true value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[enableScrollWithMouse_0100] START');

      let strJson: string = getInspectorByKey('scroll_enableMouse_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[enableScrollWithMouse_0100] obj.$type: " + obj.$type);
      console.info("[enableScrollWithMouse_0100] enableScrollWithMouse: " +
        JSON.stringify(obj.$attrs.enableScrollWithMouse));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.enableScrollWithMouse).assertEqual(true);

      console.info('[enableScrollWithMouse_0100] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_0200
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_PARAM_0200
     * @tc.desc   Test Scroll enableScrollWithMouse property with false value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[enableScrollWithMouse_0200] START');

      let strJson: string = getInspectorByKey('scroll_enableMouse_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[enableScrollWithMouse_0200] enableScrollWithMouse: " +
        JSON.stringify(obj.$attrs.enableScrollWithMouse));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.enableScrollWithMouse).assertEqual(false);

      console.info('[enableScrollWithMouse_0200] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_0300
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_PARAM_0300
     * @tc.desc   Test Scroll enableScrollWithMouse property with undefined value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[enableScrollWithMouse_0300] START');

      let strJson: string = getInspectorByKey('scroll_enableMouse_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[enableScrollWithMouse_0300] enableScrollWithMouse: " +
        JSON.stringify(obj.$attrs.enableScrollWithMouse));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.enableScrollWithMouse).assertEqual(false);

      console.info('[enableScrollWithMouse_0300] END');
      done();
    })

    /**
     * @tc.name   enableScrollWithMouse_0400
     * @tc.number SUB_ARKUI_SCROLL_ENABLESCROLLWITHMOUSE_PARAM_0400
     * @tc.desc   Test Scroll enableScrollWithMouse property with null value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('enableScrollWithMouse_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[enableScrollWithMouse_0400] START');

      let strJson: string = getInspectorByKey('scroll_enableMouse_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[enableScrollWithMouse_0400] enableScrollWithMouse: " +
        JSON.stringify(obj.$attrs.enableScrollWithMouse));

      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.enableScrollWithMouse).assertEqual(false);

      console.info('[enableScrollWithMouse_0400] END');
      done();
    })
  })
}