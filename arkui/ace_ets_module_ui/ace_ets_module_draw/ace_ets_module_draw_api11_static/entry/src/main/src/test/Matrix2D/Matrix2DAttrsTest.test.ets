'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Matrix2D } from '@ohos.arkui.component';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Matrix2DAttrsTest() {
  describe('Matrix2DAttrsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("Matrix2DAttrsTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
    });

    afterEach(async () => {
      console.info("Matrix2D after each called");
    });

    /**
     * @tc.number   testMatrix2DAttrs_static_0010
     * @tc.name     testMatrix2DAttrs_static_0010
     * @tc.desc     test Matrix2D Attributes is valid value
     * @tc.level    Level.LEVEL0
     */
    it('testMatrix2DAttrs_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testMatrix2DAttrs_static_0010] START');
      await Utils.sleep(1000);

      let matrix: Matrix2D = new Matrix2D();
      matrix.scaleX = 1
      matrix.scaleY = 1
      matrix.rotateX = -0.5
      matrix.rotateY = 0.5
      matrix.translateX = 10
      matrix.translateY = 10

      expect(matrix.scaleX).assertEqual(1);
      expect(matrix.scaleY).assertEqual(1);
      expect(matrix.rotateX).assertEqual(-0.5);
      expect(matrix.rotateY).assertEqual(0.5);
      expect(matrix.translateX).assertEqual(10);
      expect(matrix.translateY).assertEqual(10);

      console.info('[testMatrix2DAttrs_static_0010] END');
      done();
    });

    /**
     * @tc.number   testMatrix2DAttrs_static_0020
     * @tc.name     testMatrix2DAttrs_static_0020
     * @tc.desc     test Matrix2D Attributes is undefined
     * @tc.level    Level.LEVEL0
     */
    it('testMatrix2DAttrs_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testMatrix2DAttrs_static_0020] START');
      await Utils.sleep(1000);

      let matrix: Matrix2D = new Matrix2D();
      matrix.scaleX = undefined
      matrix.scaleY = undefined
      matrix.rotateX = undefined
      matrix.rotateY = undefined
      matrix.translateX = undefined
      matrix.translateY = undefined

      expect(matrix.scaleX).assertEqual(0);
      expect(matrix.scaleY).assertEqual(0);
      expect(matrix.rotateX).assertEqual(0);
      expect(matrix.rotateY).assertEqual(0);
      expect(matrix.translateX).assertEqual(0);
      expect(matrix.translateY).assertEqual(0);

      console.info('[testMatrix2DAttrs_static_0020] END');
      done();
    });
  })
}
