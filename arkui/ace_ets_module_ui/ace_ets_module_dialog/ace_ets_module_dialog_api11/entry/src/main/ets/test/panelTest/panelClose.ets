/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";
let emitKey = "emitUserAgent";
export default function panelTest() {

  describe('ActsPanel_showCloseIconTest', () => {
    beforeEach(async (done: Function) => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info("panel beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Panel/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panel state success " + JSON.stringify(pages));
        if (!(" Index" == pages.name)) {
          console.info("get panel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push panel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" panel after each called");
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0100
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0100
     * @tc.desc   Sets the showCloseIcon property parameter to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0100 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0100');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0100 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0100 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("true");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0100 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0200
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0200
     * @tc.desc   Sets the showCloseIcon property parameter to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0200', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0200 START')
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0200');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0200 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0200 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0200 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0200 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0300
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0300
     * @tc.desc   Sets the showCloseIcon property parameter from true to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0300', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0300 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0300');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0300 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0300 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0300 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0300 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0400
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0400
     * @tc.desc   Sets the showCloseIcon property parameter from false to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0400', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0400 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0400');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0400 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0400 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("true");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0400 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0400 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0500
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0500
     * @tc.desc   Sets the showCloseIcon property parameter to " "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0500', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0500 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0500');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0500 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0500 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0500 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0500 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0600
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0600
     * @tc.desc   Sets the showCloseIcon property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0600', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0600 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0600');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0600 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0600 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0600 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0600 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0700
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0700
     * @tc.desc   Sets the showCloseIcon property parameter to number 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0700', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0700 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0700');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0700 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0700 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0700 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0700 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0800
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0800
     * @tc.desc   Sets the showCloseIcon property parameter to number 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0800', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0800 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0800');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0800 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0800 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0800 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0800 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_0900
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_0900
     * @tc.desc   Sets the showCloseIcon property parameter to number 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_0900', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_0900 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_0900');
        console.info('ArkUX_Stage_Panel_showCloseIcon_0900 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_0900 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_0900 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_0900 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_1000
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_1000
     * @tc.desc   Sets the showCloseIcon property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_1000', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_1000 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_1000');
        console.info('ArkUX_Stage_Panel_showCloseIcon_1000 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_1000 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_1000 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_1000 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_1100
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_1100
     * @tc.desc   Sets the showCloseIcon property parameter to string "true"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_1100', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_1100 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_1100');
        console.info('ArkUX_Stage_Panel_showCloseIcon_1100 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_1100 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_1100 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_1100 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_1200
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_1200
     * @tc.desc   Not sets the showCloseIcon property parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_1200', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_1200 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_1200');
        console.info('ArkUX_Stage_Panel_showCloseIcon_1200 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_1200 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_1200 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_1200 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_1300
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_1300
     * @tc.desc   Sets the showCloseIcon property parameter from true to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_1300', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_1300 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_1300');
        console.info('ArkUX_Stage_Panel_showCloseIcon_1300 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_1300 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_1300 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_1300 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_1400
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_1400
     * @tc.desc   Sets the showCloseIcon property parameter from true to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_1400', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_1400 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_1400');
        console.info('ArkUX_Stage_Panel_showCloseIcon_1400 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_1400 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_1400 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_1400 ERR  ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Panel_showCloseIcon_1500
     * @tc.number ArkUX_Stage_Panel_showCloseIcon_1500
     * @tc.desc   Sets the showCloseIcon property parameter from true to " "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUX_Stage_Panel_showCloseIcon_1500', Level.LEVEL2, async (done: Function) => {
      console.info('ArkUX_Stage_Panel_showCloseIcon_1500 START');
      try {
        let strJson = getInspectorByKey('ArkUX_Stage_Panel_showCloseIcon_1500');
        console.info('ArkUX_Stage_Panel_showCloseIcon_1500 START  :' + JSON.stringify(strJson));
        let obj: ESObject = JSON.parse(strJson);
        console.info("ArkUX_Stage_Panel_showCloseIcon_1500 component obj.$attrs.showCloseIcon is: " +
        JSON.stringify(obj.$attrs.showCloseIcon));
        expect(obj.$attrs.showCloseIcon).assertEqual("false");
        console.info('ArkUX_Stage_Panel_showCloseIcon_1500 END ');
      } catch (err) {
        expect().assertFail();
        console.info('ArkUX_Stage_Panel_showCloseIcon_1500 ERR  ' + JSON.stringify(err))
      }
      done();
    });
  })
}
