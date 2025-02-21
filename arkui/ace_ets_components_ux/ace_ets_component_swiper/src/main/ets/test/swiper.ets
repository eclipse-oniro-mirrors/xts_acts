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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import hilog from '@ohos.hilog';

let emitKey = "emitUserAgent";

export default function swiperTest() {
  describe('ActSwiperTest', function () {

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0100
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      set the selectedItemWidth property parameter to 5
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0100');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0100 component obj2 is: " + JSON.stringify(obj2.selectedItemWidth));
          expect(obj2.selectedItemWidth).assertEqual("5.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0200
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to ""
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0200');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0300
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to "9999vp"
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0300');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("9999.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0400
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to -1
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0400');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0500
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to "abc"
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0500');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0600
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to 0
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0600');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0700
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to "8fp"
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0700');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemWidth_0800
     * @tc.name      Tests the selectedItemWidth property of the swiper component
     * @tc.desc      Set the selectedItemWidth property parameter to "8lpx"
     */
    it('ArkUX_Stage_Swiper_SelectedItemWidth_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemWidth_0800');
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj.$attrs.selectedItemWidth is: " +
          JSON.stringify(obj.$attrs.selectedItemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemWidth_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemWidth).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemWidth_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0100
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to 3
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0100');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0200
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to ""
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0200');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0300
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to "9999fp"
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0300');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("9999.00fp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0400
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to -1
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0400');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0500
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to "abc"
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0500');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0600
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to 0
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0600');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0700
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to "8vp"
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0700');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("8.00vp");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedItemHeight_0800
     * @tc.name      Tests the selectedItemHeight property of the swiper component
     * @tc.desc      Set the selectedItemHeight property parameter to "8lpx"
     */
    it('ArkUX_Stage_Swiper_SelectedItemHeight_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedItemHeight_0800');
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj.$attrs.selectedItemHeight is: " +
          JSON.stringify(obj.$attrs.selectedItemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedItemHeight_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedItemHeight).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedItemHeight_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0100
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to 3
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0100');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0200
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to ""
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0200');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0200 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0300
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to "9999lpx"
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0300');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("9999.00lpx");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0400
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to -1
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0400');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0500
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to "abc"
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0500');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0600
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to "8px"
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0600');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("8.00px");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemWidth_0700
     * @tc.name      Tests the itemWidth property of the swiper component
     * @tc.desc      Set the itemWidth property parameter to "8fp"
     */
    it('ArkUX_Stage_Swiper_ItemWidth_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemWidth_0700');
          console.info('ArkUX_Stage_Swiper_ItemWidth_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj.$attrs.itemWidth is: " +
          JSON.stringify(obj.$attrs.itemWidth));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemWidth_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemWidth).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_ItemWidth_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemWidth_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0100
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to 3
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0100');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("3.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0200
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to ""
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0200');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0300
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to "9999vp"
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0300');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("9999.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0400
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to -1
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0400');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0500
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to "abc"
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0500');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("6.00vp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0600
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to "8fp"
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0600');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("8.00fp");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_ItemHeight_0700
     * @tc.name      Tests the itemHeight property of the swiper component
     * @tc.desc      Set the itemHeight property parameter to "8lpx"
     */
    it('ArkUX_Stage_Swiper_ItemHeight_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_ItemHeight_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_ItemHeight_0700');
          console.info('ArkUX_Stage_Swiper_ItemHeight_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj.$attrs.itemHeight is: " +
          JSON.stringify(obj.$attrs.itemHeight));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_ItemHeight_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.itemHeight).assertEqual("8.00lpx");
          console.info('ArkUX_Stage_Swiper_ItemHeight_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_ItemHeight_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0100
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to 0x00ff00
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0100');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0200
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to "#FFFF0000"
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0200');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0300
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to "rgb(138,43,226)"
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0300');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0400
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0400');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0500
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to ""
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0500');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0600
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to null
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0600');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0700
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to $r("app.color.selected_font_color_test")
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0700');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
        done();
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0800
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to "bgr(138,43,226)"
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0800');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_0900
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to undefined
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_0600');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_1000
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor attribute parameter to "rgb (138,43,226)",
     *               and set the selectedFontColor attribute parameter to the normal value Color.Gray again
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1000');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_1100
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to 0x00ff00,
     *               and set the general property backgroundColor parameter to Color.Pink
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1100');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedFontColor_1200
     * @tc.name      Tests the selectedFontColor property of the swiper component
     * @tc.desc      Set the selectedFontColor property parameter to "rgb (255,0,0)",
     *               and set the selectedFontColor property parameter to the outlier undefined again
     */
    it('ArkUX_Stage_Swiper_SelectedFontColor_1200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedFontColor_1200');
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj.$attrs.selectedFontColor is: " +
          JSON.stringify(obj.$attrs.selectedFontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedFontColor_1200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedFontColor_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0100
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to 0x00ff00
     */
    it('ArkUX_Stage_Swiper_FontColor_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0100');
          console.info('ArkUX_Stage_Swiper_FontColor_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_FontColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0200
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to "#FFFF0000"
     */
    it('ArkUX_Stage_Swiper_FontColor_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0200');
          console.info('ArkUX_Stage_Swiper_FontColor_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_FontColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0300
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to "rgb(138,43,226)"
     */
    it('ArkUX_Stage_Swiper_FontColor_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0300');
          console.info('ArkUX_Stage_Swiper_FontColor_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Swiper_FontColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0400
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_Swiper_FontColor_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0400');
          console.info('ArkUX_Stage_Swiper_FontColor_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Swiper_FontColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0500
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to ""
     */
    it('ArkUX_Stage_Swiper_FontColor_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0500');
          console.info('ArkUX_Stage_Swiper_FontColor_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0600
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to null
     */
    it('ArkUX_Stage_Swiper_FontColor_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0600');
          console.info('ArkUX_Stage_Swiper_FontColor_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0700
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to $r("app.color.font_color_test")
     */
    it('ArkUX_Stage_Swiper_FontColor_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0700');
          console.info('ArkUX_Stage_Swiper_FontColor_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Swiper_FontColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
        done();
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0800
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to "bgr(138,43,226)"
     */
    it('ArkUX_Stage_Swiper_FontColor_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0800');
          console.info('ArkUX_Stage_Swiper_FontColor_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_0900
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to undefined
     */
    it('ArkUX_Stage_Swiper_FontColor_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_0600');
          console.info('ArkUX_Stage_Swiper_FontColor_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_1000
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor attribute parameter to "rgb (138,43,226)",
     *               and set the fontColor attribute parameter to the normal value Color.Gray again
     */
    it('ArkUX_Stage_Swiper_FontColor_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1000');
          console.info('ArkUX_Stage_Swiper_FontColor_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Swiper_FontColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_1100
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to 0x00ff00,
     *               and set the general property backgroundColor parameter to Color.Pink
     */
    it('ArkUX_Stage_Swiper_FontColor_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1100');
          console.info('ArkUX_Stage_Swiper_FontColor_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Swiper_FontColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_FontColor_1200
     * @tc.name      Tests the fontColor property of the swiper component
     * @tc.desc      Set the fontColor property parameter to "rgb (255,0,0)",
     *               and set the fontColor property parameter to the outlier undefined again
     */
    it('ArkUX_Stage_Swiper_FontColor_1200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_FontColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_FontColor_1200');
          console.info('ArkUX_Stage_Swiper_FontColor_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj.$attrs.fontColor is: " +
          JSON.stringify(obj.$attrs.fontColor));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_FontColor_1200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Swiper_FontColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_FontColor_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0100
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:34,weight:"800"}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0100');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("34.00fp");
          expect(obj2.selectedFontWeight).assertEqual("800");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0200
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:"20px",weight:200}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0200');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("20.00px");
          expect(obj2.selectedFontWeight).assertEqual("200");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0300
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:"48%",weight:900}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0300');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("14.00fp");
          expect(obj2.selectedFontWeight).assertEqual("900");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0400
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:"",weight:FontWeight.Bolder}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0400');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("14.00fp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0500
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:-2,weight:1000}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0500');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("14.00fp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0600
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:"abc",weight:null}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0600');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("14.00fp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0700
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:"1000%",weight:""}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0700');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("14.00fp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0800
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:"100vp",weight:"adf@$5"}
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0800');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("100.00vp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_0900
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:10,weight:200},
     *               and set the selectedDigitFont property parameter to {size:"40lpx",weight:500} again
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_0900');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("40.00lpx");
          expect(obj2.selectedFontWeight).assertEqual("500");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_1000
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:10,weight:500},
     *               and set the selectedDigitFont property parameter to the exception value {size:"abc",weight:null} again
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_1000');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("14.00fp");
          expect(obj2.selectedFontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_SelectedDigitFont_1100
     * @tc.name      Tests the selectedDigitFont property of the swiper component
     * @tc.desc      Set the selectedDigitFont property parameter to {size:10,weight:600},
     *               and set the general property size and layoutWeight property value to null
     */
    it('ArkUX_Stage_Swiper_SelectedDigitFont_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_SelectedDigitFont_1100');
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj.$attrs.selectedDigitFont is: " +
          JSON.stringify(obj.$attrs.selectedDigitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_SelectedDigitFont_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.selectedFontSize).assertEqual("10.00fp");
          expect(obj2.selectedFontWeight).assertEqual("600");
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_SelectedDigitFont_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0100
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:34,weight:"800"}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0100');
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("34.00fp");
          expect(obj2.fontWeight).assertEqual("800");
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0200
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"20px",weight:200}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0200');
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("20.00px");
          expect(obj2.fontWeight).assertEqual("200");
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0300
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"48%",weight:900}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0300');
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("900");
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0400
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"",weight:FontWeight.Bolder}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0400');
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0500
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:-2,weight:1000}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0500');
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0600
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"abc",weight:null}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0600');
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0700
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"1000%",weight:""}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0700');
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0800
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"100vp",weight:"adf@$5"}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0800');
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("100.00vp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0900
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:10,weight:200},
     *               and set the digitFont property parameter to {size:"40lpx",weight:500} again
     */
    it('ArkUX_Stage_Swiper_DigitFont_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0900');
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("40.00lpx");
          expect(obj2.fontWeight).assertEqual("500");
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_1000
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:10,weight:500},
     *               and set the digitFont property parameter to the exception value {size:"abc",weight:null} again
     */
    it('ArkUX_Stage_Swiper_DigitFont_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1000');
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_1100
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:10,weight:600},
     *               and set the general property size and layoutWeight property value to null
     */
    it('ArkUX_Stage_Swiper_DigitFont_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1100');
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("10.00fp");
          expect(obj2.fontWeight).assertEqual("600");
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

     /**
     * @tc.number    ArkUX_Stage_Swiper_Indicator_0100
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the Indicator property parameter to top(1)
     */
     it('ArkUX_Stage_Swiper_Indicator_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_Indicator_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0100');
          console.info('ArkUX_Stage_Swiper_Indicator_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(parseFloat(obj2.top)).assertEqual(1);
          console.info("ArkUX_Stage_Swiper_Indicator_0100 component obj2.indicator.top is: " +
          JSON.stringify(obj2.top));
          expect(obj2.top.substr(obj2.top.length-2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

     /**
     * @tc.number    ArkUX_Stage_Swiper_Indicator_0200
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the Indicator property parameter to bottom(1)
     */
     it('ArkUX_Stage_Swiper_Indicator_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_Indicator_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0200');
          console.info('ArkUX_Stage_Swiper_Indicator_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(parseFloat(obj2.bottom)).assertEqual(1);
          expect(obj2.bottom.substr(obj2.bottom.length-2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

     /**
     * @tc.number    ArkUX_Stage_Swiper_Indicator_0300
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the Indicator property parameter to left(1)
     */
     it('ArkUX_Stage_Swiper_Indicator_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_Indicator_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0300');
          console.info('ArkUX_Stage_Swiper_Indicator_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(parseFloat(obj2.left)).assertEqual(1);
          expect(obj2.left.substr(obj2.left.length-2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

     /**
     * @tc.number    ArkUX_Stage_Swiper_Indicator_0400
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the Indicator property parameter to right(1)
     */
     it('ArkUX_Stage_Swiper_Indicator_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_Indicator_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_Indicator_0400');
          console.info('ArkUX_Stage_Swiper_Indicator_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_Indicator_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_Indicator_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_Indicator_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(parseFloat(obj2.right)).assertEqual(1);
          expect(obj2.right.substr(obj2.right.length-2, 2)).assertEqual("vp");
          console.info('ArkUX_Stage_Swiper_Indicator_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_Indicator_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}