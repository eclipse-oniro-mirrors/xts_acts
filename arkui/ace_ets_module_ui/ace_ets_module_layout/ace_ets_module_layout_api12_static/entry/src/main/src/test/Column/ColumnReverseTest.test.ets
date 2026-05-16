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

export default function ColumnReverseTest() {
  describe('ColumnReverseTest', (): void => {
    beforeAll(() => {
      console.info("ColumnReverseTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/ColumnReversePage',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get ColumnReverseTest state pages:" + JSON.stringify(pages));
        if (!("ColumnReverseTest" == pages.name)) {
          console.info("get ColumnReverseTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ColumnReverseTest page error:" + err);
      }
      console.info("ColumnReverseTest beforeEach end");
    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   ColumnReverseTest_static_0100
     * @tc.name     ColumnReverseTest_static_0100
     * @tc.desc     ColumnReverseTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ColumnReverseTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ColumnReverseTest_0100] START');
      await CommonFunc.sleep(1000);

      let Column_1 = CommonFunc.getComponentRect('ColumnReverse_Column_1');
      let Column_01 = CommonFunc.getComponentRect('ColumnReverse_Column_01');
      let Column_02 = CommonFunc.getComponentRect('ColumnReverse_Column_02');

      console.log('[ColumnReverseTest_0100] Column_01.top - Column_02.bottom', +(Column_01.top - Column_02.bottom));
      console.log('[ColumnReverseTest_0100] Column_01.bottom - Column_1.bottom', +(Column_01.bottom - Column_1.bottom));
      expect(Math.floor(Math.abs(Column_01.top - Column_02.bottom)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_01.bottom - Column_1.bottom)) <= 1).assertTrue();
      console.info('[ColumnReverseTest_0100] END');
      done()
    });


    
    /**
     * @tc.number   ColumnReverseTest_static_0200
     * @tc.name     ColumnReverseTest_static_0200
     * @tc.desc     ColumnReverseTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ColumnReverseTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ColumnReverseTest_static_0200] START');
      await CommonFunc.sleep(1000);

      let Column_2 = CommonFunc.getComponentRect('ColumnReverse_Column_2');
      let Column_03 = CommonFunc.getComponentRect('ColumnReverse_Column_03');
      let Column_04 = CommonFunc.getComponentRect('ColumnReverse_Column_04');

      console.log('[ColumnReverseTest_static_0200] Column_2.top - Column_03.top', +(Column_2.top - Column_03.top));
      console.log('[ColumnReverseTest_static_0200] Column_03.bottom - Column_04.top',
        +(Column_03.bottom - Column_04.top));
      expect(Math.floor(Math.abs(Column_2.top - Column_03.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(Column_03.bottom - Column_04.top)) <= 1).assertTrue();
      console.info('[ColumnReverseTest_static_0200] END');
      done()
    });
  })
}