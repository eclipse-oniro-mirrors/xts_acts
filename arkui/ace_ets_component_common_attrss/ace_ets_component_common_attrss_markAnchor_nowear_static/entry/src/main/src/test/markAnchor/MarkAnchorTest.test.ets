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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, ExpectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, beforeAll, expect,it,Level,afterEach } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,  Position, $r } from '@ohos.arkui.component';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest} from '../Util.test'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function MarkAnchorTest() {
  //A list of components that support the position attribute, which is required.
  let supportView: Array<string> = new Array<string>(
    'Select',
    'SideBarContainer', 'WaterFlow', 'RowSplit', 'ColumnSplit', 'FlowItem'
  )


  //The size of the parent component, when set as a percentage, serves as the calculation basis.
  let parentWidth = 300;
  let parentHeight = 400;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;

  //Page config, this param is required.
  let pageConfig: PageConfig = {
    testName: 'testMarkAnchor',
    pageName: 'MarkAnchorPage',
    pageUrl: 'MainAbility/pages/markAnchor/MarkAnchorPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
  }

  //Test values, looped to create cases, this param is required.
  let testValues: TestValue[] = [{
    describe: 'Number',
    setValue: {
      x: 50, y: 50
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      left: AppStorage.get<UIContext>('uiContext')?.vp2px(50), top: AppStorage.get<UIContext>('uiContext')?.vp2px(50)
    }
  },
    {
    describe: 'StringPx',
    setValue: {
      x: '150px', y: '150px'
    },
    expectValue: {
      x: '150.00px', y: '150.00px',
      left: 150, top: 150
    }
  },
    {
    describe: 'StringPercent',
    setValue: {
      x: '50%', y: '50%'
    },
    expectValue: {
      x: '50.00%', y: '50.00%'
    }
  },
    {
    describe: 'Resource',
    setValue: {
      x: $r('app.float.50vp'), y: $r('app.float.50vp')
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      left: AppStorage.get<UIContext>('uiContext')?.vp2px(50), top: AppStorage.get<UIContext>('uiContext')?.vp2px(50)
    }
  }
  ]

  describe('MarkAnchorTest', () => {
    beforeAll(() => {
      console.info('MarkAnchorTest beforeAll start');
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.markAnchor.nowear.test.static", "EntryAbility")
    });
afterEach(()=>{
  AppStorage.setOrCreate<Position>('_markAnchor', { x: 0, y: 0 });
  await UtilsTest.msSleep(1000)
})
    // Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Restore the target component to its original position
      console.info('[' + data.caseTag + '] restore the target Component to its original position');
      AppStorage.setOrCreate<Position>('_markAnchor', { x: 0, y: 0 });
      await Utils.sleep(1000);
      let testData: BasePageConfig = data
      if(testData.testValue.describe == 'Number'){
        testData = {
          pageConfig: data.pageConfig,
          testValue: {
            describe: data.testValue.describe,
            setValue: data.testValue.setValue,
            exceptView: data.testValue.exceptView,
            expectValue:{
              x: '50.00vp', y: '50.00vp',
              left: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)), top: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))
            }
          },
          caseTag: data.caseTag,
          customParams: data.customParams,
          viewObj: data.viewObj
        }
      }
      if(testData.testValue.describe == 'Resource'){
        testData = {
          pageConfig: data.pageConfig,
          testValue: {
            describe: data.testValue.describe,
            setValue: data.testValue.setValue,
            exceptView: data.testValue.exceptView,
            expectValue:{
              x: '50.00vp', y: '50.00vp',
              left: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)), top: Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))
            }
          },
          caseTag: data.caseTag,
          customParams: data.customParams,
          viewObj: data.viewObj
        }
      }
      console.log('AppStorage.get<UIContext>',AppStorage.get<UIContext>('uiContext')?.vp2px(50))
      //Obtain the region information of the target component.
      console.info('[' + testData.caseTag + '] get Target Component rect before position changed.');
      let initialPosition: RectValue = Utils.getComponentRect(testData.pageConfig.componentKey ?? '');
      console.info('[' + testData.caseTag + '] setValue : ' + JSON.stringify(testData.testValue.setValue));
      console.info('[' + testData.caseTag + '] expectValue : ' + JSON.stringify(testData.testValue.expectValue));
      AppStorage.setOrCreate<Position>('_markAnchor', testData.testValue.setValue);
      await Utils.sleep(1000);

      //Obtain the attribute information of the target component.
      //Confirm that the position attribute value has been set successfully.
      console.info('[' + testData.caseTag + '] check markAnchor value.');
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(testData.pageConfig.componentKey ?? '');
      console.info('check markAnchor value1111' + viewObj.getElement('$attrs').getElement('markAnchor').getString('x') );
      console.info('check markAnchor 222222' + testData.testValue.expectValue.x );
      expect(viewObj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual(testData.testValue.expectValue.x);
      expect(viewObj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual(testData.testValue.expectValue.y);

      //Obtain the region information of the target component.
      console.info('[' + testData.caseTag + '] get targetComponent rect after position changed.');
      let targetRectAfter: RectValue = Utils.getComponentRect(testData.pageConfig.componentKey ?? '');

      console.info('[' + testData.caseTag + '] check actual position.');
      //Calculate shifting using pre and post setting positions
      //verify the actual shifting of the target component.
      if ('StringPercent' == testData.testValue.describe) {
        //When setting the type to percentage, use the width/height of the parent container as the base.
        expect(Math.abs(Number(initialPosition.left - targetRectAfter.left) -
        Number((targetRectAfter.right - targetRectAfter.left) * 0.5)) <= 1).assertTrue();
        expect(Math.abs(Number(initialPosition.top - targetRectAfter.top) -
        Number((targetRectAfter.bottom - targetRectAfter.top) * 0.5)) <= 1).assertTrue();
      } else {
        //When set to the basic type, verify the calculated shifting
        expect(Math.abs(Number(initialPosition.left - targetRectAfter.left) -
        Number(testData.testValue.expectValue.left)) <= 1).assertTrue();
        expect(Math.abs(Number(initialPosition.top - targetRectAfter.top) -
        Number(testData.testValue.expectValue.top)) <= 1).assertTrue();
      }
    })
  })
}