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

import {Color,$r} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,SetValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function layoutWeightFlexTest() {
  let supportView: Array<string> = new Array<string>(
    'Select',
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  )
  let childWidth = 100;
  let childHeight = 100;
  let parentWidth = 400;
  let parentHeight = 600;
  let pageConfig: PageConfig = {
    testName: 'testLayoutWeight',
    pageName: 'LayoutWeightPageFlex',
    pageUrl: 'MainAbility/pages/layoutWeight/LayoutWeightPageFlex',
    targetGroupView: 'targetGroupView',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'InFlex',
    setValue: {
      layoutWeight: 1
    },
    expectValue: {
      layoutWeight: 1,
      width: 200
    }
  }]
  describe('LayoutWeightFlexTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("layoutWeightFlexTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.layoutWeight.nowear.test.static", "EntryAbility")
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      data.testValue.expectValue.width = UIContext.resolveUIContext()!.vp2px(200)
      let rect = Utils.getComponentRect(data.pageConfig.componentKey??'');
      // //Component width and height calculation
      let width = rect.right - rect.left;
      let attrs = data.viewObj
      console.info('[' + data.caseTag + ']' + 'rect.right is:' + JSON.stringify(rect.right));
      console.info('[' + data.caseTag + ']' + 'rect.left is:' + JSON.stringify(rect.left));
      console.info('[' + data.caseTag + ']' + 'width is:' + JSON.stringify(width));
      console.info('[' + data.caseTag + ']' + 'layoutWeight is:' + attrs?.getElement('$attrs').getInteger('layoutWeight'));
      console.info('[' + data.caseTag + ']' + 'expectWidth is:' + data.testValue.expectValue.width);
      expect(attrs?.getElement('$attrs').getInteger('layoutWeight')).assertEqual(data.testValue.expectValue.layoutWeight);
      console.log("========================" + Math.floor(Math.abs(width - (data.testValue.expectValue.width as number))))
      if (data.pageConfig.componentKey == 'TextInput') {
        expect(Math.floor(Math.abs(width - (data.testValue.expectValue.width as number))) <= 2).assertTrue();
      } else {
        expect(Math.floor(Math.abs(width - (data.testValue.expectValue.width as number))) <= 1).assertTrue();
      }
    });
  })
}