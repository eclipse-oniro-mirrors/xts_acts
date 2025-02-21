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
import { describe, beforeAll, it, expect } from "@ohos/hypium"
import display from '@ohos.display';
import CommonFunc from '../MainAbility/common/Common';
import { BusinessError } from '@ohos.base';

function asNum(v: string | number) {
  return v as number;
}


export default function commonJsunit() {
  describe('commonTest', () => {

    let dpiValue: number;

    beforeAll(async (done: Function) => {
      console.info("commonJsunit beforeEach start");
      await display.getDefaultDisplay().then(dsp => {
        console.info('getDefaultDisplay id : ' + JSON.stringify(dsp));
        dpiValue = dsp.densityDPI;
        console.info('getDefaultDisplay dpiValue is : ' + JSON.stringify(dpiValue));
        CommonFunc.sleep(2000);
      }, (err: BusinessError) => {
        console.info('getDefaultDisplay failed, err :' + JSON.stringify(err));
      })
      done()
    });

    it('commonTest_0100', 0, async (done: Function) => {

      display.getDefaultDisplay().then(dsp => {
        console.info('getDefaultDisplay id : ' + JSON.stringify(dsp));
        dpiValue = dsp.densityDPI;
        setTimeout(() => {
          console.info('commonTest_0100 START' + dpiValue);
        }, 2000)
      }, (err: BusinessError) => {
        console.info('getDefaultDisplay failed, err :' + JSON.stringify(err));
      })
      console.info('commonTest_0100 START' + dpiValue);

      let a = 90;
      let ret = a * (dpiValue / 160);
      let b = vp2px(a);
      console.info('commonTest_0100 vp2px result:' + b);
      console.info('commonTest_0100 vp2px result:' + ret);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_0100 END');
      done();
    });

    it('commonTest_0200', 0, async (done: Function) => {
      console.info('commonTest_0200 START' + dpiValue);
      let a = -90;
      let ret = a * (dpiValue / 160);
      let b = vp2px(a);
      console.info('commonTest_0200 vp2px result:' + b);
      console.info('commonTest_0200 vp2px result:' + ret);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_0200 END');
      done();
    });

    it('commonTest_0300', 0, async (done: Function) => {
      console.info('commonTest_0300 START');
      let a = '30';
      let b = vp2px(asNum(a));
      console.info('commonTest_0300 vp2px result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_0300 END');
      done();
    });

    it('commonTest_0400', 0, async (done: Function) => {
      console.info('commonTest_0400 START');
      let a = 80;
      let ret = a / (dpiValue / 160);
      let b = px2vp(a);
      console.info('commonTest_0400 px2vp result:' + b);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_0400 END');
      done();
    });

    it('commonTest_0500', 0, async (done: Function) => {
      console.info('commonTest_0500 START');
      let a = -100000000;
      let ret = a / (dpiValue / 160);
      let b = px2vp(a);
      console.info('commonTest_0500 px2vp result:' + b);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_0500 END');
      done();
    });

    it('commonTest_0600', 0, async (done: Function) => {
      console.info('commonTest_0600 START');
      let a = '80';
      let b = px2vp(asNum(a));
      console.info('commonTest_0600 px2vp result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_0600 END');
      done();
    });

    it('commonTest_0700', 0, async (done: Function) => {
      console.info('commonTest_0700 START');
      let a = 70;
      let ret = a * (dpiValue / 160);
      let b = fp2px(a);
      console.info('commonTest_0700 fp2px result:' + b);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_0700 END');
      done();
    });

    it('commonTest_0800', 0, async (done: Function) => {
      console.info('commonTest_0800 START');
      let a = -70;
      let ret = a * (dpiValue / 160);
      let b = fp2px(a);
      console.info('commonTest_0800 fp2px result:' + b);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_0800 END');
      done();
    });

    it('commonTest_0900', 0, async (done: Function) => {
      console.info('commonTest_0900 START');
      let a = '70';
      let b = fp2px(asNum(a));
      console.info('commonTest_0900 fp2px result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_0900 END');
      done();
    });

    it('commonTest_1000', 0, async (done: Function) => {
      console.info('commonTest_1000 START');
      let a = 60;
      let ret = a / (dpiValue / 160);
      let b = px2fp(a);
      console.info('commonTest_1000 px2fp result:' + b);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_1000 END');
      done();
    });

    it('commonTest_1100', 0, async (done: Function) => {
      console.info('commonTest_1100 START');
      let a = -60;
      let ret = a / (dpiValue / 160);
      let b = px2fp(a);
      console.info('commonTest_1100 px2fp result:' + b);
      expect(Math.abs(b - ret) <= 1).assertTrue();
      console.info('commonTest_1100 END');
      done();
    });

    it('commonTest_1200', 0, async (done: Function) => {
      console.info('commonTest_1200 START');
      let a = '60';
      let b = px2fp(asNum(a));
      console.info('commonTest_1200 px2fp result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_1200 END');
      done();
    });


    it('commonTest_1500', 0, async (done: Function) => {
      console.info('commonTest_1500 START');
      let a = '50';
      let b = lpx2px(asNum(a));
      console.info('commonTest_1500 lpx2px result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_1500 END');
      done();
    });

    it('commonTest_1800', 0, async (done: Function) => {
      console.info('commonTest_1800 START');
      let a = '40';
      let b = px2lpx(asNum(a));
      console.info('commonTest_1800 px2lpx result:' + b);
      expect(b == undefined).assertTrue();
      console.info('commonTest_1800 END');
      done();
    });
  })
}