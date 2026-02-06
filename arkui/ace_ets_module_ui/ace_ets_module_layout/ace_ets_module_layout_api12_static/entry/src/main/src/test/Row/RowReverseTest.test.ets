'use static';
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RowReverseTest() {
  describe('RowReverseTest', (): void => {
    beforeAll(() => {
      console.info("RowReverseTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RowReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/RowReversePage',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get RowReverseTest state pages:" + JSON.stringify(pages));
        if (!("RowReverseTest" == pages.name)) {
          console.info("get RowReverseTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push RowReverseTest page error:" + err);
      }
      console.info("RowReverseTest beforeEach end");
    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   RowReverseTest_static_0100
     * @tc.name     RowReverseTest_static_0100
     * @tc.desc     RowReverseTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RowReverseTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RowReverseTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let Row_1 = CommonFunc.getComponentRect('RowReverse_Row_1');
      let Row_01 = CommonFunc.getComponentRect('RowReverse_Row_01');
      let Row_02 = CommonFunc.getComponentRect('RowReverse_Row_02');
      console.log('[RowReverseTest_static_0100] Row_01.left - Row_02.right', +(Row_01.left - Row_02.right));
      console.log('[RowReverseTest_static_0100] Row_01.right - Row_1.right', +(Row_01.right - Row_1.right));
      expect(Math.floor(Math.abs(Row_01.left - Row_02.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row_01.right - Row_1.right)) <= 1).assertTrue();

      console.info('[RowReverseTest_static_0100] END');
      done()
    });


    
    /**
     * @tc.number   RowReverseTest_static_0200
     * @tc.name     RowReverseTest_static_0200
     * @tc.desc     RowReverseTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('RowReverseTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RowReverseTest_static_0200] START');
      await CommonFunc.sleep(1000);

      let Row_2 = CommonFunc.getComponentRect('RowReverse_Row_2');
      let Row_03 = CommonFunc.getComponentRect('RowReverse_Row_03');
      let Row_04 = CommonFunc.getComponentRect('RowReverse_Row_04');

      console.log('[RowReverseTest_static_0200] Row_03.left - Row_2.left', +(Row_03.left - Row_2.left));
      console.log('[RowReverseTest_static_0200] Row_03.right - Row_04.left', +(Row_03.right - Row_04.left));
      expect(Math.floor(Math.abs(Row_03.left - Row_2.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Row_03.right - Row_04.left)) <= 1).assertTrue();

      console.info('[RowReverseTest_static_0200] END');
      done()
    });
  })
}