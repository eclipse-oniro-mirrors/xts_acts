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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest';

export default function checkboxJsunit() {
  describe('checkboxTest', () => {
    beforeEach(async (done: Function) => {
      console.info("checkboxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkbox',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBox state pages: " + JSON.stringify(pages));
        if (!("checkbox" == pages.name)) {
          console.info("get checkBox state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push checkBox page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   ArkUX_Stage_Checkbox_0100
     * @tc.number ArkUX_Stage_Checkbox_0100
     * @tc.desc   Set mark values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Checkbox_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          console.info("ArkUX_Stage_Checkbox_0100 component strJson is: " + strJson);
          console.info("ArkUX_Stage_Checkbox_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(JSON.parse(strJson).$attrs.mark).size).assertEqual('50.00vp');
          console.info('ArkUX_Stage_Checkbox_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_0400
     * @tc.number ArkUX_Stage_Checkbox_0400
     * @tc.desc   Set unselectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Checkbox_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          console.info("ArkUX_Stage_Checkbox_0400 component obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Checkbox_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /**
     * @tc.name   ArkUX_Stage_Checkbox_0300
     * @tc.number ArkUX_Stage_Checkbox_0300
     * @tc.desc   Set select values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Checkbox_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          console.info("ArkUX_Stage_Checkbox_0300 component obj is: " + JSON.stringify(JSON.parse(strJson)));

          expect(JSON.parse(strJson).$attrs.select).assertEqual("false");

          console.info('ArkUX_Stage_Checkbox_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Checkbox_attrs_0200
     * @tc.number ArkUX_Stage_Checkbox_attrs_0200
     * @tc.desc   Set selectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Checkbox_attrs_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_attrs_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('Checkbox_0100');
          console.info("ArkUX_Stage_Checkbox_attrs_0200 component obj is: " + JSON.stringify(JSON.parse(strJson)));
          expect(JSON.parse(strJson).$attrs.selectedColor).assertEqual("#FFED6F21");
          console.info('ArkUX_Stage_Checkbox_attrs_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Checkbox_attrs_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /**
     * @tc.name   ArkUX_Stage_Checkbox_attrs_0201
     * @tc.number ArkUX_Stage_Checkbox_attrs_0201
     * @tc.desc   Change unselectedColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Checkbox_attrs_0201', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Stage_Checkbox_attrs_0201 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('Checkbox_0100');
      console.info("ArkUX_Stage_Checkbox_attrs_0201 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.unselectedColor).assertEqual("#FFED6F21");
      console.info('ArkUX_Stage_Checkbox_attrs_0201 END');
      done();
    });

  })
}
