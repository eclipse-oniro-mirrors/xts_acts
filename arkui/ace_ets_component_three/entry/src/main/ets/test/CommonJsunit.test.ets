// @ts-nocheck
/**
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import display from '@ohos.display';
import Utils from './Utils';


export default function commonJsunit() {
  describe('commonTest', function () {

    var dpiValue;

    beforeAll(async function (done) {
      console.info("commonJsunit beforeEach start");
      await display.getDefaultDisplay().then(dsp => {
        console.info('getDefaultDisplay id : ' + JSON.stringify(dsp));
        dpiValue = dsp.densityDPI;
        console.info('getDefaultDisplay dpiValue is : ' + JSON.stringify(dpiValue));
        Utils.sleep(2000);
      }, (err) => {
        console.info('getDefaultDisplay failed, err :' + JSON.stringify(err));
      })
      done()
    });

    it('commonTest_0100', 0, async function (done) {

      display.getDefaultDisplay().then(dsp => {
        console.info('getDefaultDisplay id : ' + JSON.stringify(dsp));
        dpiValue = dsp.densityDPI;
        setTimeout(() => {
          console.info('commonTest_0100 START' + dpiValue);
        }, 2000)
      }, (err) => {
        console.info('getDefaultDisplay failed, err :' + JSON.stringify(err));
      })
      console.info('commonTest_0100 START' + dpiValue);

      var a = 90;
      var ret = a * (dpiValue/160);
      var b = vp2px(a);
      console.info('commonTest_0100 vp2px result:' + b);
      console.info('commonTest_0100 vp2px result:' + ret);
      expect(b == ret).assertTrue();
      console.info('commonTest_0100 END');
      done();
    });

    it('commonTest_0200', 0, async function (done) {
      console.info('commonTest_0200 START' + dpiValue);
      var a = -90;
      var ret = a * (dpiValue/160);
      var b = vp2px(a);
      console.info('commonTest_0200 vp2px result:' + b);
      console.info('commonTest_0200 vp2px result:' + ret);
      expect(b == ret).assertTrue();
      console.info('commonTest_0200 END');
      done();
    });

    it('commonTest_0300', 0, async function (done) {
      console.info('commonTest_0300 START');
      var a = '30';
      var b = vp2px(a);
      console.info('commonTest_0300 vp2px result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_0300 END');
      done();
    });

    it('commonTest_0400', 0, async function (done) {
      console.info('commonTest_0400 START');
      var a = 80;
      var ret = a / (dpiValue/160);
      var b = px2vp(a);
      console.info('commonTest_0400 px2vp result:' + b);
      expect(b == ret).assertTrue();
      console.info('commonTest_0400 END');
      done();
    });

    it('commonTest_0500', 0, async function (done) {
      console.info('commonTest_0500 START');
      var a = -800000000;
      var ret = a / (dpiValue/160);
      var b = px2vp(a);
      console.info('commonTest_0500 px2vp result:' + b);
      expect(b == ret).assertTrue();
      console.info('commonTest_0500 END');
      done();
    });

    it('commonTest_0600', 0, async function (done) {
      console.info('commonTest_0600 START');
      var a = '80';
      var b = px2vp(a);
      console.info('commonTest_0600 px2vp result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_0600 END');
      done();
    });

    it('commonTest_0700', 0, async function (done) {
      console.info('commonTest_0700 START');
      var a = 70;
      var ret = a * (dpiValue/160);
      var b = fp2px(a);
      console.info('commonTest_0700 fp2px result:' + b);
      expect(b == ret).assertTrue();
      console.info('commonTest_0700 END');
      done();
    });

    it('commonTest_0800', 0, async function (done) {
      console.info('commonTest_0800 START');
      var a = -70;
      var ret = a * (dpiValue/160);
      var b = fp2px(a);
      console.info('commonTest_0800 fp2px result:' + b);
      expect(b == ret).assertTrue();
      console.info('commonTest_0800 END');
      done();
    });

    it('commonTest_0900', 0, async function (done) {
      console.info('commonTest_0900 START');
      var a = '70';
      var b = fp2px(a);
      console.info('commonTest_0900 fp2px result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_0900 END');
      done();
    });

    it('commonTest_1000', 0, async function (done) {
      console.info('commonTest_1000 START');
      var a = 60;
      var ret = a / (dpiValue/160);
      var b = px2fp(a);
      console.info('commonTest_1000 px2fp result:' + b);
      expect(b == ret).assertTrue();
      console.info('commonTest_1000 END');
      done();
    });

    it('commonTest_1100', 0, async function (done) {
      console.info('commonTest_1100 START');
      var a = -60;
      var ret = a / (dpiValue/160);
      var b = px2fp(a);
      console.info('commonTest_1100 px2fp result:' + b);
      expect(b == ret).assertTrue();
      console.info('commonTest_1100 END');
      done();
    });

    it('commonTest_1200', 0, async function (done) {
      console.info('commonTest_1200 START');
      var a = '60';
      var b = px2fp(a);
      console.info('commonTest_1200 px2fp result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_1200 END');
      done();
    });


    it('commonTest_1500', 0, async function (done) {
      console.info('commonTest_1500 START');
      var a = '50';
      var b = lpx2px(a);
      console.info('commonTest_1500 lpx2px result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_1500 END');
      done();
    });

    it('commonTest_1800', 0, async function (done) {
      console.info('commonTest_1800 START');
      var a = '40';
      var b = px2lpx(a);
      console.info('commonTest_1800 px2lpx result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_1800 END');
      done();
    });
  })
}