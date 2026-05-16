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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function AttributeUpdaterNullUndefinedTest() {
  describe('AttributeUpdaterNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AttributeUpdaterNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/AttributeUpdaterNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttributeUpdaterNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get AttributeUpdaterNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push AttributeUpdaterNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttributeUpdaterNullUndefinedTest page error:" + err);
      }
      console.info("AttributeUpdaterNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("AttributeUpdaterNullUndefinedTest after each called");
    });

    /**
     * @tc.name   AttributeUpdaterApplyNormalAttributeNull_0100
     * @tc.number SUB_ARKUI_ATTRIBUTEUPDATER_APPLYNORMALATTRIBUTE_NULL_0100
     * @tc.desc   Test AttributeUpdater.applyNormalAttribute with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AttributeUpdaterApplyNormalAttributeNull_0100', Level.LEVEL2, async (done: Function) => {
      console.info('setResourceManagerCacheMaxCountForHSPNull_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_attributeModifier_null'));
      await button1.click();
      await Utils.sleep(1000);
      expect(AppStorage.get('applyNormalAttributeNullUndefined')).assertEqual(null);
      expect(AppStorage.get('initializeModifierNullUndefined')).assertEqual(null);
      expect(AppStorage.get('onComponentChangedNullUndefined')).assertEqual(null);
      AppStorage.delete('applyNormalAttributeNullUndefined')
      AppStorage.delete('initializeModifierNullUndefined')
      AppStorage.delete('onComponentChangedNullUndefined')
      console.info('[setResourceManagerCacheMaxCountForHSPNull_0100] END');
      done();
    })

    /**
     * @tc.name   AttributeUpdaterApplyNormalAttributeUndefined_0200
     * @tc.number SUB_ARKUI_ATTRIBUTEUPDATER_APPLYNORMALATTRIBUTE_UNDEFINED_0200
     * @tc.desc   Test AttributeUpdater.applyNormalAttribute with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('AttributeUpdaterApplyNormalAttributeUndefined_0200', Level.LEVEL2, async (done: Function) => {
      console.info('AttributeUpdaterApplyNormalAttributeUndefined_0200 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_attributeModifier_undefined'));
      await button1.click();
      await Utils.sleep(1000);
      expect(AppStorage.get('applyNormalAttributeNullUndefined')).assertEqual(undefined);
      expect(AppStorage.get('initializeModifierNullUndefined')).assertEqual(undefined);
      expect(AppStorage.get('onComponentChangedNullUndefined')).assertEqual(undefined);
      AppStorage.delete('applyNormalAttributeNullUndefined')
      AppStorage.delete('initializeModifierNullUndefined')
      AppStorage.delete('onComponentChangedNullUndefined')
      console.info('[AttributeUpdaterApplyNormalAttributeUndefined_0200] END');
      done();
    })

  })
}
