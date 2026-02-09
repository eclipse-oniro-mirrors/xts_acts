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

import Utils, { BasePageConfig, PageConfig, TestValues, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function zIndexTest() {
  let supportView = [
    'Select',
    'ColumnSplit',
    'FlowItem',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  ]

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;

  let pageConfig: PageConfig = {
    testName: 'testZIndex',
    pageName: 'ZIndexPage',
    pageUrl: 'MainAbility/pages/zIndex/ZIndexPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    referenceComponentKey: 'referenceComponentKey',
    referenceText: 'referenceText'
  }


  let testValues: TestValues[] = [{
    describe: 'SetUpperLayer',
    setValue: 3,
    exceptView: '',
    expectValue: {
      zIndex: 3
    }
  }]

  describe('ZIndexTest', () => {
    beforeAll(() => {
      console.info("ZIndexTest beforeEach start");
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.zIndex.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      console.info('[' + data.caseTag + ']' + 'zIndex is:' + data.viewObj?.getElement('$attrs').getDouble('zIndex'));
      expect(data.viewObj?.getElement('$attrs').getDouble('zIndex')).assertEqual(data.testValue.expectValue.zIndex);
    });
  })
}