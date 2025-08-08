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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function badgeTest() {
  describe('ActsBadgeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Badge/BadgeIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get badgeTest state success " + JSON.stringify(pages));
        if (!("BadgeIndex" == pages.name)) {
          console.info("get badgeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push badgeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push badgeTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("badgeTest beforeEach start");
      done();
    })

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0100
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Badge component container for Bttton, set fontWeight property parameter to 0
     */
    it('ArkUX_Stage_Badge_FontWeight_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0100');
          console.info('ArkUX_Stage_Badge_FontWeight_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0100 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0200
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Badge component container for the Text component,
     *               set the fontWeight property parameter to the default value 400
     */
    it('ArkUX_Stage_Badge_FontWeight_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0200');
          console.info('ArkUX_Stage_Badge_FontWeight_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0200 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("400");
          console.info('ArkUX_Stage_Badge_FontWeight_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0300
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight attribute parameter to a minimum boundary value of 100
     *               for the Badge component in its container
     */
    it('ArkUX_Stage_Badge_FontWeight_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0300');
          console.info('ArkUX_Stage_Badge_FontWeight_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0300 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("100");
          console.info('ArkUX_Stage_Badge_FontWeight_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0400
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight attribute parameter to a string of "800" greater than the default value.
     */
    it('ArkUX_Stage_Badge_FontWeight_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0400');
          console.info('ArkUX_Stage_Badge_FontWeight_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0400 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("800");
          console.info('ArkUX_Stage_Badge_FontWeight_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0500
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to less than the default value of 200
     */
    it('ArkUX_Stage_Badge_FontWeight_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0500');
          console.info('ArkUX_Stage_Badge_FontWeight_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0500 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0500 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("200");
          console.info('ArkUX_Stage_Badge_FontWeight_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0600
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to a maximum boundary value of 900
     */
    it('ArkUX_Stage_Badge_FontWeight_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0600');
          console.info('ArkUX_Stage_Badge_FontWeight_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0600 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0600 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("900");
          console.info('ArkUX_Stage_Badge_FontWeight_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0700
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the FontWeight attribute parameter to enum type "fontweight. Bolder".
     */
    it('ArkUX_Stage_Badge_FontWeight_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0700');
          console.info('ArkUX_Stage_Badge_FontWeight_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0700 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0700 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Badge_FontWeight_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0800
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Example Set the fontWeight attribute to outside the value range of 1000
     */
    it('ArkUX_Stage_Badge_FontWeight_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0800');
          console.info('ArkUX_Stage_Badge_FontWeight_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0800 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0800 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_0900
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to the exception value null
     */
    it('ArkUX_Stage_Badge_FontWeight_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_0900');
          console.info('ArkUX_Stage_Badge_FontWeight_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_0900 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_0900 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1000
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to the exception value undefined
     */
    it('ArkUX_Stage_Badge_FontWeight_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1000');
          console.info('ArkUX_Stage_Badge_FontWeight_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1000 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1000 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1100
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to the exception value -1
     */
    it('ArkUX_Stage_Badge_FontWeight_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1100');
          console.info('ArkUX_Stage_Badge_FontWeight_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1100 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1200
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to the exception value ""
     */
    it('ArkUX_Stage_Badge_FontWeight_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1200');
          console.info('ArkUX_Stage_Badge_FontWeight_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1200 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1300
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to the exception value "adf@$5"
     */
    it('ArkUX_Stage_Badge_FontWeight_1300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1300');
          console.info('ArkUX_Stage_Badge_FontWeight_1300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1300 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1400
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to 200 and again to 500
     */
    it('ArkUX_Stage_Badge_FontWeight_1400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1400');
          console.info('ArkUX_Stage_Badge_FontWeight_1400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1400 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("500");
          console.info('ArkUX_Stage_Badge_FontWeight_1400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1500
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight property parameter to 500, and again to the outlier null
     */
    it('ArkUX_Stage_Badge_FontWeight_1500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1500');
          console.info('ArkUX_Stage_Badge_FontWeight_1500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1500 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1500 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Badge_FontWeight_1500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_FontWeight_1600
     * @tc.name      Tests the FontWeight property of the badge component
     * @tc.desc      Set the fontWeight attribute parameter to 600 greater than the default value,
     *               and set the generic layoutWeight attribute value to null
     */
    it('ArkUX_Stage_Badge_FontWeight_1600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_1600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_FontWeight_1600');
          console.info('ArkUX_Stage_Badge_FontWeight_1600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_FontWeight_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_FontWeight_1600 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_FontWeight_1600 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("600");
          console.info('ArkUX_Stage_Badge_FontWeight_1600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_FontWeight_1600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0100
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to 0x00ff00
     */
    it('ArkUX_Stage_Badge_BorderColor_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0100');
          console.info('ArkUX_Stage_Badge_BorderColor_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0100 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Badge_BorderColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0200
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to '#fffd0000'
     */
    it('ArkUX_Stage_Badge_BorderColor_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0200');
          console.info('ArkUX_Stage_Badge_BorderColor_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0200 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Badge_BorderColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0300
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_Badge_BorderColor_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0300');
          console.info('ArkUX_Stage_Badge_BorderColor_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0300 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Badge_BorderColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0400
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_Badge_BorderColor_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0400');
          console.info('ArkUX_Stage_Badge_BorderColor_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0400 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Badge_BorderColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0500
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to $r("app.color.badge_BorderColor")
     */
    it('ArkUX_Stage_Badge_BorderColor_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0500');
          console.info('ArkUX_Stage_Badge_BorderColor_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0500 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0500 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Badge_BorderColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0600
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to the exception value ""
     */
    it('ArkUX_Stage_Badge_BorderColor_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0600');
          console.info('ArkUX_Stage_Badge_BorderColor_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0600 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0600 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Badge_BorderColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0700
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to the exception value null
     */
    it('ArkUX_Stage_Badge_BorderColor_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0700');
          console.info('ArkUX_Stage_Badge_BorderColor_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0700 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0700 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Badge_BorderColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0800
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to the exception value undefined
     */
    it('ArkUX_Stage_Badge_BorderColor_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0800');
          console.info('ArkUX_Stage_Badge_BorderColor_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0800 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0800 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Badge_BorderColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_0900
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Set the BorderColor property parameter to "rgb(138,43,226)"
     *               and again to the normal value Color.Pink
     */
    it('ArkUX_Stage_Badge_BorderColor_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_0900');
          console.info('ArkUX_Stage_Badge_BorderColor_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_0900 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_0900 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Badge_BorderColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_1000
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Set the BorderColor property parameter to "rgb(138,43,226)"
     *               and again set the BorderColor property parameter to the outlier value undefined
     */
    it('ArkUX_Stage_Badge_BorderColor_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_1000');
          console.info('ArkUX_Stage_Badge_BorderColor_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_1000 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_1000 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Badge_BorderColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_1100
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to the exception value 'bgr(138,43,226)'
     */
    it('ArkUX_Stage_Badge_BorderColor_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_1100');
          console.info('ArkUX_Stage_Badge_BorderColor_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_1100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_1100 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Badge_BorderColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderColor_1200
     * @tc.name      Tests the BorderColor property of the badge component
     * @tc.desc      Sets the BorderColor property parameter to 0x00ff00.
     *               Sets the universal property backgroundColor property value to Color.Pink
     */
    it('ArkUX_Stage_Badge_BorderColor_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderColor_1200');
          console.info('ArkUX_Stage_Badge_BorderColor_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderColor_1200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderColor_1200 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Badge_BorderColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderColor_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0100
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Set the BorderWidth property argument to 5
     */
    it('ArkUX_Stage_Badge_BorderWidth_0100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0100');
          console.info('ArkUX_Stage_Badge_BorderWidth_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0100 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("5.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0200
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Set the BorderWidth property argument to "5"
     */
    it('ArkUX_Stage_Badge_BorderWidth_0200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0200');
          console.info('ArkUX_Stage_Badge_BorderWidth_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0200 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("5.00px");
          console.info('ArkUX_Stage_Badge_BorderWidth_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0300
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Set the BorderWidth property argument to $r("app.string.badge_Size_test")
     */
    it('ArkUX_Stage_Badge_BorderWidth_0300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0300');
          console.info('ArkUX_Stage_Badge_BorderWidth_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0300 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("7.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0400
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Sets the BorderWidth property parameter to the exception value ""
     */
    it('ArkUX_Stage_Badge_BorderWidth_0400', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0400');
          console.info('ArkUX_Stage_Badge_BorderWidth_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0400 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0500
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Sets the BorderWidth property parameter to the exception value null
     */
    it('ArkUX_Stage_Badge_BorderWidth_0500', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0500');
          console.info('ArkUX_Stage_Badge_BorderWidth_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0500 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0500 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0600
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Sets the BorderWidth property parameter to the exception value undefined
     */
    it('ArkUX_Stage_Badge_BorderWidth_0600', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0600');
          console.info('ArkUX_Stage_Badge_BorderWidth_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0600 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0600 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0700
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Set the BorderWidth property parameter to 5,
     *               and set the BorderWidth property parameter to "7fp" again
     */
    it('ArkUX_Stage_Badge_BorderWidth_0700', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0700');
          console.info('ArkUX_Stage_Badge_BorderWidth_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0700 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0700 component style.borderWidth is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("7.00fp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0800
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Set the BorderWidth property parameter to 5
     *               and set the BorderWidth property parameter to undefined again
     */
    it('ArkUX_Stage_Badge_BorderWidth_0800', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0800');
          console.info('ArkUX_Stage_Badge_BorderWidth_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0800 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0800 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("1.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_0900
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Sets the BorderWidth property parameter to the exception value "asdf%^7"
     */
    it('ArkUX_Stage_Badge_BorderWidth_0900', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_0900');
          console.info('ArkUX_Stage_Badge_BorderWidth_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_0900 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_0900 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_1000
     * @tc.name      Tests the BorderWidth property of the badge component
     * @tc.desc      Set the BorderWidth property parameter to "5lpx"
     *               and the common property width property value to the outlier value 7
     */
    it('ArkUX_Stage_Badge_BorderWidth_1000', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1000');
          console.info('ArkUX_Stage_Badge_BorderWidth_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1000 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_1000 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("5.00lpx");
          console.info('ArkUX_Stage_Badge_BorderWidth_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_1100
     * @tc.name      Combined test all new attributes of the Badge component
     * @tc.desc      Set the BorderWidth property argument to 0
     */
    it('ArkUX_Stage_Badge_BorderWidth_1100', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1100');
          console.info('ArkUX_Stage_Badge_BorderWidth_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_1100 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("0.00vp");
          console.info('ArkUX_Stage_Badge_BorderWidth_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_1200
     * @tc.name      Combined test all new attributes of the Badge component
     * @tc.desc      Simultaneous setting BorderWidth(5) fontWeight(600) BorderColor(#FFFD0000)
     */
    it('ArkUX_Stage_Badge_BorderWidth_1200', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1200');
          console.info('ArkUX_Stage_Badge_BorderWidth_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_1200 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("5.00vp");
          expect(style.fontWeight.replace(/[^\d]/g,"")).assertEqual("600");
          expect(style.borderColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Badge_BorderWidth_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Badge_BorderWidth_1300
     * @tc.name      Combined test all new attributes of the Badge component
     * @tc.desc      Do not set new attributes
     */
    it('ArkUX_Stage_Badge_BorderWidth_1300', 0, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_BorderWidth_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Badge_BorderWidth_1300');
          console.info('ArkUX_Stage_Badge_BorderWidth_1300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Badge_BorderWidth_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Badge_BorderWidth_1300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Badge_BorderWidth_1300 component obj.$attrs.style is: " +
          JSON.stringify(obj.$attrs.style));
          let style: ESObject = JSON.parse(obj.$attrs.style);
          expect(style.borderWidth).assertEqual("1.00vp");
          expect(style.fontWeight).assertEqual("FontWeight.Normal");
          expect(style.borderColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_Badge_BorderWidth_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Badge_BorderWidth_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}