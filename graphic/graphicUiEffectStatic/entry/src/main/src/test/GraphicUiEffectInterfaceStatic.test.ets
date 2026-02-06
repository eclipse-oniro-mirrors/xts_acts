/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import uiEffect from '@ohos.graphics.uiEffect';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function GraphicUiEffectInterfaceStatic() {

  describe("graphicUiEffectInterfaceStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
    })
    /**
     * @tc.name   uiEffectTest_static_0100
     * @tc.number uiEffectTest_static_0100
     * @tc.desc   uiEffect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("uiEffectTest_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      // uiEffect test codes
      hilog.info(domain, tag, '%{public}s', 'uiEffect test START');
      let visualEffect: uiEffect.VisualEffect = uiEffect.createEffect();
      if (visualEffect == undefined) {
        hilog.info(domain, tag, '%{public}s', 'uiEffect createEffect failed.');
        return undefined;
      }
      expect(true).assertTrue();
      hilog.info(domain, tag, '%{public}s', 'uiEffect createEffect successfully.');
      try {
        let brightnessBlender: uiEffect.BrightnessBlender = uiEffect.createBrightnessBlender({
          cubicRate: 0.5,
          quadraticRate: 0.5,
          linearRate: 0.5,
          degree: 0.5,
          saturation: 0.5,
          positiveCoefficient: [2.3, 4.5, 2.0],
          negativeCoefficient: [0.5, 2.0, 0.5],
          fraction: 0.5
        });
        if (brightnessBlender == undefined) {
          hilog.info(domain, tag, '%{public}s', 'uiEffect createBrightnessBlender failed.');
          return undefined;
        }
        expect(true).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'uiEffect createBrightnessBlender successfully.');
        let result: uiEffect.VisualEffect = visualEffect.backgroundColorBlender(brightnessBlender);
        if (result == undefined) {
          hilog.info(domain, tag, '%{public}s', 'uiEffect backgroundColorBlender failed.');
          return undefined;
        }
        hilog.info(domain, tag, '%{public}s', 'uiEffect backgroundColorBlender successfully.');
        hilog.info(domain, tag, '%{public}s', 'uiEffect test END');
        expect(true).assertTrue();
      } catch(err){
        console.info('www data err ' + JSON.stringify(err))
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   uiEffectTest_static_0200
     * @tc.number uiEffectTest_static_0200
     * @tc.desc   uiEffect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("uiEffectTest_static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = " =====uiEffectTest_static_0200==== "
        try {
          let visualEffect: uiEffect.VisualEffect = uiEffect.createEffect()
          // let filter: uiEffect.Filter = uiEffect.createFilter();
          console.log(msg + " Succeed in uiEffect.createFilter " + JSON.stringify(visualEffect))
          expect(true).assertTrue()
          done()
        } catch (err) {
          console.log(msg + " Failed in uiEffect.createFilter " + JSON.stringify(err))
          console.log(msg + " Failed in uiEffect.createFilter " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   uiEffectTest_static_0300
     * @tc.number uiEffectTest_static_0300
     * @tc.desc   uiEffect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("uiEffectTest_static_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = " =====uiEffectTest_static_0300==== "
        try {
          let filter: uiEffect.Filter = uiEffect.createFilter();
          console.log(msg + " Succeed in uiEffect.createFilter ")
          expect(true).assertTrue()
          done()
        } catch (err) {
          console.log(msg + " Failed in uiEffect.createFilter " + JSON.stringify(err))
          console.log(msg + " Failed in uiEffect.createFilter " + err)
          expect().assertFail()
          done()
        }
      })

    /**
     * @tc.name   uiEffectTest_static_0400
     * @tc.number uiEffectTest_static_0400
     * @tc.desc   uiEffect for test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("uiEffectTest_static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = " =====uiEffectTest_static_0400==== "
        try {
          let filter: uiEffect.Filter = uiEffect.createFilter();
          filter.blur(20);
          console.log(msg + " Succeed in uiEffect.createFilter blur ")
          expect(true).assertTrue()
          done()
        } catch (err) {
          console.log(msg + " Failed in uiEffect.createFilter " + JSON.stringify(err))
          console.log(msg + " Failed in uiEffect.createFilter " + err)
          expect().assertFail()
          done()
        }
      })

  })
}