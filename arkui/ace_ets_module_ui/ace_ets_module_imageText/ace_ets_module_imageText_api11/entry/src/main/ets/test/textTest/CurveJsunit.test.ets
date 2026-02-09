/**
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

import router from '@ohos.router';
import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { GlobalContext } from '../../MainAbility/common/GlobalContext';
import CommonFunc from '../../MainAbility/common/Common';

export default function CurveJsunit() {
  describe('CurveTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/curve',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get curve state success " + JSON.stringify(pages));
        if (!("curve" == pages.name)) {
          console.info("get curve state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push curve page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push curve page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("curve after each called");
    });

    /**
     * @tc.name   testCurve001
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testCurve001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCurve001', Level.LEVEL1, async (done: Function) => {
      console.info('curve testCurve001 START');
      let result_width: number;
      let result_height: number;
      let control: boolean;

      control = sendEventByKey('curve', 10, "");
      console.info("curve sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = GlobalContext.getContext().getObject('widthSize') as number;
          console.info('curve ***** globalThis  widthSize is ' + result_width);
          result_height = GlobalContext.getContext().getObject('heightSize') as number;
          console.info('curve ***** globalThis  heightSize is ' + result_height);
        } else {
          console.error('control failed');
        }
        console.info('curve ***** result_height is ' + result_height);
        console.info('curve ***** result_width is ' + result_width);
        let finalRes: boolean;
        if ((Math.round(result_height) == 44) && (Math.round(result_width) == 44)) {
          finalRes = true;
          console.info('curve SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });

    /**
     * @tc.name   testCurve002
     * @tc.number SUB_ACE_BASIC_ETS_API_0020
     * @tc.desc   testCurve002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCurve002', Level.LEVEL1, async (done: Function) => {
      console.info('curve testCurve02 START');
      let result_height: number;
      let result_width: number;
      let control: boolean;

      control = sendEventByKey('curve1', 10, "");
      console.info("curve1 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = GlobalContext.getContext().getObject('widthSize1') as number;
          console.info('curve1 ***** globalThis  widthSize1 is ' + result_width);
          result_height = GlobalContext.getContext().getObject('heightSize1') as number;
          console.info('curve1 ***** globalThis  heightSize1 is ' + result_height);
        } else {
          console.error('control failed');
        }
        console.info('curve1 ***** result_height1 is ' + result_height);
        console.info('curve1 ***** result_width1 is ' + result_width);
        let finalRes: boolean;
        if ((Math.round(result_height) == 97) && (Math.round(result_width) == 97)) {
          finalRes = true;
          console.info('curve1 SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve1 SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });

    /**
     * @tc.name   testCurve003
     * @tc.number SUB_ACE_BASIC_ETS_API_0030
     * @tc.desc   testCurve003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCurve003', Level.LEVEL1, async (done: Function) => {
      console.info('curve testCurve003 START');
      let result_height: number;
      let result_width: number;
      let control: boolean;

      control = sendEventByKey('curve2', 10, "");
      console.info("curve2 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = GlobalContext.getContext().getObject('widthSize2') as number;
          console.info('curve2 ***** globalThis  widthSize2 is ' + result_width);
          result_height = GlobalContext.getContext().getObject('heightSize2') as number;
          console.info('curve2 ***** globalThis  heightSize2 is ' + result_height);
        } else {
          console.error('control failed');
        }
        console.info('curve2 ***** result_height2 is ' + result_height);
        console.info('curve2 ***** result_width2 is ' + result_width);
        let finalRes: boolean;
        if ((Math.round(result_height) == 50) && (Math.round(result_width) == 50)) {
          finalRes = true;
          console.info('curve2 SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve2 SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });

    /**
     * @tc.name   testCurve004
     * @tc.number SUB_ACE_BASIC_ETS_API_0040
     * @tc.desc   testCurve004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCurve004', Level.LEVEL1, async (done: Function) => {
      console.info('curve testCurve004 START');
      let result_height: number;
      let result_width: number;
      let control: boolean;

      control = sendEventByKey('curve3', 10, "");
      console.info("curve3 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = GlobalContext.getContext().getObject('widthSize3') as number;
          console.info('curve3 ***** globalThis  widthSize3 is ' + result_width);
          result_height = GlobalContext.getContext().getObject('heightSize3') as number;
          console.info('curve3 ***** globalThis  heightSize3 is ' + result_height);
        } else {
          console.error('control failed');
        }
        console.info('curve3 ***** result_height3 is ' + result_height);
        console.info('curve3 ***** result_width3 is ' + result_width);
        let finalRes: boolean;
        if ((Math.round(result_height) == 99) && (Math.round(result_width) == 99)) {
          finalRes = true;
          console.info('curve3 SurfaceChangedTest success');
        } else {
          finalRes = false;
          console.error('curve3 SurfaceChangedTest fail');
        }
        expect(finalRes).assertEqual(true);
        done();
      }, 3000)
    });
  })
}
