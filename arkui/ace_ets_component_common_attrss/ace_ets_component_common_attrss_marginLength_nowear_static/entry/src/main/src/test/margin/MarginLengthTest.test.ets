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

import { $r, Color } from '@ohos.arkui.component'
import Utils, {
  BasePageConfig,
  CurrentRatio,
  PageConfig,
  RectValue,
  SetValue,
  StrJsonObj,
  TestValue
} from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function marginLengthTest() {
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView: Array<string> = new Array<string>(
    'Select',
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  )
  let pageConfig: PageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPageLength',
    pageUrl: 'MainAbility/pages/margin/MarginPageLength',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      margin: 50,
    },
    expectValue: {
      margin: '50.00vp',
      //uicontext.vp2px()接口不通，暂用数字平替
      top: 50,
      right: 50,
      bottom: 50,
      left: 50
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      margin: '100px',
    },
    expectValue: {
      margin: '100.00px',
      top: 100,
      right: 100,
      bottom: 100,
      left: 100
    }
  }, {
    describe: 'SetResource',
    setValue: {
      margin: $r('app.float.50vp'),
    },
    expectValue: {
      margin: '50.00vp',
      //uicontext.vp2px()接口不通，暂用数字平替
      top: 50,
      right: 50,
      bottom: 50,
      left: 50
    }
  }]

  describe('MarginLengthTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("marginLengthTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.marginLength.nowear.test.static", "EntryAbility");
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      if(data.testValue.describe == "SetNumber"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.left = UIContext.resolveUIContext()!.vp2px(50)
      }
      if(data.testValue.describe == "SetResource"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.left = UIContext.resolveUIContext()!.vp2px(50)
      }

      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey ?? '');
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey ?? '');
      //Component margin
      let top: number = 0;
      let left: number = 0;
      let right: number = 0;
      let bottom: number = 0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let rectReference = Utils.getComponentRect(data.pageConfig.referenceComponentKey ?? '');
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectReference.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.referenceComponentKey ?? '');
        //Component to reference component and parent component margin calculation
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      }
      let attrs = data.viewObj
      console.info('[' + data.caseTag + ']' + 'top is:' + top);
      console.info('[' + data.caseTag + ']' + 'left is:' + left);
      console.info('[' + data.caseTag + ']' + 'right is:' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is:' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is:' + attrs?.getElement('$attrs').getElement('margin'));
      //Confirm if the margin is correct

      expect(attrs?.getElement('$attrs').getString('margin')).assertEqual(data.testValue.expectValue.margin);
      expect(Math.abs(top - (data.testValue.expectValue.top as number)) <= 1).assertTrue();
      expect(Math.abs(right - (data.testValue.expectValue.right as number)) <= 1).assertTrue();
      expect(Math.abs(bottom - (data.testValue.expectValue.bottom as number)) <= 1).assertTrue();
      expect(Math.abs(left - (data.testValue.expectValue.left as number)) <= 1).assertTrue();
    });
  })
}