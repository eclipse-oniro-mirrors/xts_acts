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

import common from '@ohos.app.ability.common';
import configurationConstant from '@ohos.app.ability.ConfigurationConstant';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function Configuration() {
  describe("Configuration", () => {

    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : ABILITY_TEST_COLORMODE_0100
     * @tc.name      : testColorMode001
     * @tc.desc      : test filed of colorMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testColorMode001', 0, async (done: Function) => {
      try {
        let colorMode: ESObject = globalThis.colorMode as ESObject;
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testColorMode001 colorMode:` + colorMode);
        if (colorMode == configurationConstant.ColorMode.COLOR_MODE_NOT_SET) {
          expect(context.config.colorMode).assertEqual(configurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        } else if (colorMode == configurationConstant.ColorMode.COLOR_MODE_DARK) {
          expect(context.config.colorMode).assertEqual(configurationConstant.ColorMode.COLOR_MODE_DARK);
          expect(context.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertTrue();
          expect(context.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_LIGHT).assertTrue();
        } else if (colorMode == configurationConstant.ColorMode.COLOR_MODE_LIGHT) {
          expect(context.config.colorMode).assertEqual(configurationConstant.ColorMode.COLOR_MODE_LIGHT);
          expect(context.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertTrue();
          expect(context.config.colorMode != configurationConstant.ColorMode.COLOR_MODE_DARK).assertTrue();
        }
        console.log(`testColorMode001 success`);
        done();
      } catch (err) {
        console.log(`testColorMode001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_DIRECTION_0100
     * @tc.name      : testDirection001
     * @tc.desc      : test filed of direction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDirection001', 0, async (done: Function) => {
      try {
        let direction: ESObject = globalThis.direction as ESObject;
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testDirection001 direction:` + direction);
        if (direction == configurationConstant.Direction.DIRECTION_NOT_SET) {
          expect(context.config.direction).assertEqual(configurationConstant.Direction.DIRECTION_NOT_SET);
        } else if (direction == configurationConstant.Direction.DIRECTION_VERTICAL) {
          expect(context.config.direction).assertEqual(configurationConstant.Direction.DIRECTION_VERTICAL);
          expect(context.config.direction != configurationConstant.Direction.DIRECTION_NOT_SET).assertTrue();
          expect(context.config.direction != configurationConstant.Direction.DIRECTION_HORIZONTAL).assertTrue();
        } else if (direction == configurationConstant.Direction.DIRECTION_HORIZONTAL) {
          expect(context.config.direction).assertEqual(configurationConstant.Direction.DIRECTION_HORIZONTAL);
          expect(context.config.direction != configurationConstant.Direction.DIRECTION_NOT_SET).assertTrue();
          expect(context.config.direction != configurationConstant.Direction.DIRECTION_VERTICAL).assertTrue();
        }
        console.log(`testDirection001 success`);
        done();
      } catch (err) {
        console.log(`testDirection001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })
  })
}
