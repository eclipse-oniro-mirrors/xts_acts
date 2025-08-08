/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';

export default function MenuJsunit() {
  describe('Menu', () => {
    beforeEach(async (done: Function) => {
      console.info("Menu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menu',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Menu state pages: " + JSON.stringify(pages));
        if (!("menu" == pages.name)) {
          console.info("get Menu state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push Menu page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Menu page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Menu_attrs_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Menu_attrs_0100', 0, async (done: Function) => {
      try {
        console.info('ArkUX_Stage_Menu_attrs_0100 START');
        let strJson = getInspectorByKey('MenuKey1');
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Menu_attrs_0100 component obj is: " + JSON.stringify(obj));
        expect(obj.$attrs.fontColor).assertEqual("#FF123654");
        console.info('ArkUX_Stage_Menu_attrs_0100 END ');
      } catch (err) {
        console.info('ArkUX_Stage_Menu_attrs_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Menu_attrs_0101
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Menu_attrs_0101', 0, async (done: Function) => {
      try {
        console.info('ArkUX_Stage_Menu_attrs_0101 START');
        let strJson = getInspectorByKey('MenuKey1');
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Menu_attrs_0101 component obj is: " + JSON.stringify(obj));
        expect(obj.$attrs.font.size).assertEqual("20.00fp");
        expect(obj.$attrs.font.weight).assertEqual("FontWeight.Normal");
        expect(obj.$attrs.font.style).assertEqual("FontStyle.Normal");
        expect(obj.$attrs.font.family).assertEqual("medium");
        console.info('ArkUX_Stage_Menu_attrs_0101 END ');
      } catch (err) {
        console.info('ArkUX_Stage_Menu_attrs_0101 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.number ArkUX_Stage_Menu_attrs_0102
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUX_Stage_Menu_attrs_0102', 0, async (done: Function) => {
      try {
        console.info('ArkUX_Stage_Menu_attrs_0102 START');
        let strJson = getInspectorByKey('MenuKey1');
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Menu_attrs_0102 component obj is: " + JSON.stringify(obj));
        expect(obj.$attrs.borderRadius.topLeft).assertEqual("12.00vp");
        expect(obj.$attrs.borderRadius.topRight).assertEqual("12.00vp");
        expect(obj.$attrs.borderRadius.bottomLeft).assertEqual("12.00vp");
        expect(obj.$attrs.borderRadius.bottomRight).assertEqual("12.00vp");
        console.info('ArkUX_Stage_Menu_attrs_0102 END ');
      } catch (err) {
        console.info('ArkUX_Stage_Menu_attrs_0102 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}