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
import emitter from '@ohos.events.emitter'
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Message, MessageManager } from '../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import Curves from '@ohos.curves';
import { FinishCallbackType } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../test/Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let abc: number
const interpolate3 = (fraction: number): number => {
  interpolate4(fraction)
  return abc
}
const interpolate4 = (fraction: number) => {
  abc = Number(fraction)
}

export default function animationCurveTest() {
  describe('animationCurveTest', () => {

    beforeAll(() => {
      console.info("playModeReverseTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("playModeReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AnimationCurve",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get playModeReverseTest state pages:" + JSON.stringify(pages));
        if (!("animationCurve" == pages.name)) {
          console.info("get playModeReverseTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    
    /**
     * @tc.number   ArkUX_ohos.curves_customCurve_static_1000
     * @tc.name     ArkUX_ohos.curves_customCurve_static_1000
     * @tc.desc     ArkUX_ohos.curves_customCurve_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_ohos.curves_customCurve_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_ohos.curves_customCurve_static_1000 START');
      let fraction: number
      setTimeout(() => {
        try {
          fraction = Number(Number(Curves.customCurve((fraction: number) => {
            return fraction
          }).interpolate(0.1)).toFixed(4))
          let finalRes: boolean
          if (fraction == 0.1000) {
            finalRes = true;
          } else {
            finalRes = false;
          }
          expect(finalRes).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });
    
    /**
     * @tc.number   ArkUX_ohos.curves_customCurve_static_1100
     * @tc.name     ArkUX_ohos.curves_customCurve_static_1100
     * @tc.desc     ArkUX_ohos.curves_customCurve_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_ohos.curves_customCurve_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_ohos.curves_customCurve_static_1000 START');
      let fraction1: number
      setTimeout((): void => {
        try {
          fraction1 = Number(Number(Curves.customCurve((fraction: number) => {
            return 2 * fraction
          }).interpolate(0.1)).toFixed(4))
          console.info("curves_customCurve_1100", fraction1)
          let finalRes1: boolean
          if (fraction1 == 0.2000) {
            finalRes1 = true;
          } else {
            finalRes1 = false;
          }
          expect(finalRes1).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });
    
    /**
     * @tc.number   ArkUX_ohos.curves_customCurve_static_1200
     * @tc.name     ArkUX_ohos.curves_customCurve_static_1200
     * @tc.desc     ArkUX_ohos.curves_customCurve_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_ohos.curves_customCurve_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_ohos.curves_customCurve_static_1200 START');
      let fraction2: number
      setTimeout(() => {
        try {
          fraction2 = Number(Number(Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0.1)).toFixed(4))
          console.info("curves_customCurve_1200", fraction2)
          let finalRes2: boolean
          if (fraction2 == 0.0100) {
            finalRes2 = true;
          } else {
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });
    
    /**
     * @tc.number   ArkUX_ohos.curves_customCurve_static_1300
     * @tc.name     ArkUX_ohos.curves_customCurve_static_1300
     * @tc.desc     ArkUX_ohos.curves_customCurve_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_ohos.curves_customCurve_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_ohos.curves_customCurve_static_1300 START');
      let fraction3: number
      let fraction4: number
      setTimeout(() => {
        try {
          fraction3 = Number(Number(Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0.1)).toFixed(4))
          fraction4 = Number(Number(Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0.1)).toFixed(4))
          console.info("curves_customCurve_1300", fraction3)
          let finalRes3: boolean
          if (fraction3 == 0.0100 && fraction4 == 0.0100) {
            finalRes3 = true;
          } else {
            finalRes3 = false;
          }
          expect(finalRes3).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });
    
    /**
     * @tc.number   ArkUX_ohos.curves_customCurve_static_1400
     * @tc.name     ArkUX_ohos.curves_customCurve_static_1400
     * @tc.desc     ArkUX_ohos.curves_customCurve_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_ohos.curves_customCurve_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_ohos.curves_customCurve_static_1400 START');
      let fraction5: number
      setTimeout(() => {
        try {
          fraction5 = Number(Number(Curves.customCurve(interpolate3).interpolate(0.1)).toFixed(4))
          console.info('ArkUX_ohos.curves_customCurve_static_14005 ' + fraction5);
          let finalRes5: boolean
          if (fraction5 == 0.1000) {
            finalRes5 = true;
          } else {
            finalRes5 = false;
          }
          expect(finalRes5).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 1000)
    });
  })
}