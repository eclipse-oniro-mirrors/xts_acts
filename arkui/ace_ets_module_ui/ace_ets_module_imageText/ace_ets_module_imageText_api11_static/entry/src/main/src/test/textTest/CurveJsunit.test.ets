'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterEach, beforeEach, describe, expect, it, Level,beforeAll } from "../../../../hypium/index";
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function CurveJsunit() {
  describe('CurveTest', () => {

    beforeAll(() => {
      console.info("CurveJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("CurveJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/curve',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = routerInstance.getState();
        console.info("get CurveJsunit state pages:" + JSON.stringify(pages));
        if (!("curve" == pages.name)) {
          console.info("get CurveJsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("push CurveJsunit page error:" + err);
      }
      console.info("CurveJsunit beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("curve after each called");
    });

    
    /**
     * @tc.number   testCurve_static_001
     * @tc.name     testCurve_static_001
     * @tc.desc     testCurve_static_001
     * @tc.level    Level.LEVEL1
     */
    it('testCurve_static_001', Level.LEVEL1, async (done: ()=>void) => {
      console.info('curve testCurve001 START');
      let result_width: number;
      let result_height: number;
      let control: boolean;

      control = inspector.sendEventByKey('curve', 10, "");
      console.info("curve sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = AppStorage.get<number>('widthSize') as number;
          console.info('curve ***** globalThis  widthSize is ' + result_width);
          result_height = AppStorage.get<number>('heightSize') as number;
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
     * @tc.number   testCurve_static_002
     * @tc.name     testCurve_static_002
     * @tc.desc     testCurve_static_002
     * @tc.level    Level.LEVEL1
     */
    it('testCurve_static_002', Level.LEVEL1, async (done: ()=>void) => {
      console.info('curve testCurve02 START');
      let result_height: number;
      let result_width: number;
      let control: boolean;

      control = inspector.sendEventByKey('curve1', 10, "");
      console.info("curve1 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = AppStorage.get<number>('widthSize1') as number;
          console.info('curve1 ***** globalThis  widthSize1 is ' + result_width);
          result_height = AppStorage.get<number>('heightSize1') as number;
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
     * @tc.number   testCurve_static_003
     * @tc.name     testCurve_static_003
     * @tc.desc     testCurve_static_003
     * @tc.level    Level.LEVEL1
     */
    it('testCurve_static_003', Level.LEVEL1, async (done: ()=>void) => {  //app died
      console.info('curve testCurve_static_003 START');
      let result_height: number;
      let result_width: number;
      let control: boolean;

      control = inspector.sendEventByKey('curve2', 10, "");
      console.info("curve2 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = AppStorage.get<number>('widthSize2') as number;
          console.info('curve2 ***** globalThis  widthSize2 is ' + result_width);
          result_height = AppStorage.get<number>('heightSize2') as number;
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
     * @tc.number   testCurve_static_004
     * @tc.name     testCurve_static_004
     * @tc.desc     testCurve_static_004
     * @tc.level    Level.LEVEL1
     */
    it('testCurve_static_004', Level.LEVEL1, async (done: ()=>void) => {
      console.info('curve testCurve_static_004 START');
      let result_height: number;
      let result_width: number;
      let control: boolean;

      control = inspector.sendEventByKey('curve3', 10, "");
      console.info("curve3 sendEventByKey result is: " + control);
      setTimeout(() => {
        if (control) {
          result_width = AppStorage.get<number>('widthSize3') as number;
          console.info('curve3 ***** globalThis  widthSize3 is ' + result_width);
          result_height = AppStorage.get<number>('heightSize3') as number;
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
