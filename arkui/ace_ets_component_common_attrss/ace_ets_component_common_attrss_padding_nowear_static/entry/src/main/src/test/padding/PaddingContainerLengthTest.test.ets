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
import Utils , { BasePageConfig, PageConfig, TestValue, RectValue,RectValueExpect }  from '../../../ets/MainAbility/common/Utils';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { $r , Padding, Resource} from '@ohos.arkui.component'
import {
  Color,
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest} from '../Util.test'
// let uiContext=new UIContext()
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

// class PageConfig {
//   testName: string = '';
//   pageName: string = '';
//   pageUrl: string = '';
//   parentBackGroundColor: Color = Color.White;
//   parentComponentKey: string = '';
//   parentHeight: number = 0;
//   parentWidth: number = 0;
//   referenceComponentKey: string = '';
// }

//
// class TestValues {
//   describe: string = '';
//   setValue: ESObject;
//   expectValue: ESObject;
// }

export default function paddingTestContainer2() {
  //A list of components that support padding attributes is required.
  let supportView:Array<string> = new Array<string>(
    'WaterFlow',
    'ColumnSplit',
    'FlowItem',
    'RowSplit'
  )

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 400;
  let parentHeight = 400;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingContainerLength',
    pageName: 'PaddingContainerPageLength',
    pageUrl: 'MainAbility/pages/padding/PaddingContainerPageLength',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      padding: 10
    },
    expectValue: {
      padding: '10.00vp',
      top: 10,
      right: 10,
      bottom: 10,
      left: 10
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      padding: '100px'
    },
    expectValue: {
      padding: '100.00px',
      top: 100,
      right: 100,
      bottom: 100,
      left: 100
    }
  }, {
    describe: 'SetResource',
    setValue: {
      padding: $r('app.float.10vp'),
    },
    expectValue: {
      padding: '10.00vp',
      top: 10,
      right: 10,
      bottom: 10,
      left: 10
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      padding: '10%',
    },
    expectValue: {
      padding: '10.00%',
      parentWidthAfter: parentWidth * 0.1
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingContainerLengthTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.padding.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the reference component properties.
      // AttrsManager.change(data.caseTag, {
      //   padding: 0
      // });
      // AppStorage.setOrCreate<number|string|Padding|Resource>('_padding', data.testValue.setValue.padding as number|string|Padding|Resource)
      await Utils.sleep(1000);
      let uiContext = AppStorage.get<UIContext>('uiContext')
      if (data.testValue.describe == "SetNumber" || data.testValue.describe =="SetResource"){

        data.testValue.expectValue.top = Number(uiContext!.vp2px(10))
        data.testValue.expectValue.right = Number(uiContext!.vp2px(10))
        data.testValue.expectValue.bottom = Number(uiContext!.vp2px(10))
        data.testValue.expectValue.left = Number(uiContext!.vp2px(10))

      }
      if (data.testValue.describe == "SetStringPercent" ){

        data.testValue.expectValue.parentWidthAfter = Number(uiContext!.vp2px(parentWidth)*0.1)

      }
      //Obtain dimensional information for target components.
      let targetRectBefore = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the target component.
      let targetRectBeforeWidth = targetRectBefore.right - targetRectBefore.left;

      console.info('[' + data.caseTag + '] targetRectBeforeWidth:' + targetRectBeforeWidth);

      //Verify the height size of the reference component.
      let targetRectBeforeHeight = targetRectBefore.bottom - targetRectBefore.top;

      console.info('[' + data.caseTag + '] targetRectBeforeHeight:' + targetRectBeforeHeight);

      //Modify the target component properties.
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let targetRectAfter = Utils.getComponentRect(data.pageConfig.componentKey);

      //Confirm that the size attribute values have been successfully set.
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(viewObj.getElement('$attrs').getString('padding')).assertEqual(data.testValue.expectValue.padding);

      //Verification method for special reference components.
      if (data.pageConfig.componentKey == 'RelativeContainer' || data.pageConfig.componentKey == 'RowSplit'
        || data.pageConfig.componentKey == 'ListItemGroup' || data.pageConfig.componentKey == 'List'
        || data.pageConfig.componentKey == 'ColumnSplit' || data.pageConfig.componentKey == 'Flex'
        || data.pageConfig.componentKey == 'GridCol' || data.pageConfig.componentKey == 'FlowItem'
        || data.pageConfig.componentKey == 'GridRow' || data.pageConfig.componentKey == 'Panel'
        || data.pageConfig.componentKey == 'SideBarContainer' || data.pageConfig.componentKey == 'TabContent'
        || data.pageConfig.componentKey == 'WaterFlow' /*||data.pageConfig.componentKey == 'ListItem'*/
      ) {
        //Obtain the size information of the reference component.
        let referenceRect = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

        //Verification method for special components.
        if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetResource'
          || data.testValue.describe == 'SetStringPx') {
          console.info('[' + data.caseTag + ']referenceRect.top - targetRectAfter.top:'
            + (referenceRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
            + (referenceRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
            + (targetRectAfter.bottom - referenceRect.bottom));
          console.info('[' + data.caseTag + ']targetRectAfter.right - referenceRect.right:'
            + (targetRectAfter.right - referenceRect.right));

          //Panel component need special adapter ,the reason is the top of Panel has a own size
          if (data.pageConfig.componentKey == 'Panel') {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.bottom! + uiContext!.vp2px(8))) <= 1)
              .assertTrue();
          } else {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.top!)) <= 1)
              .assertTrue();
          }
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom!) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right!) <= 1)
            .assertTrue();
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left!) <= 1)
            .assertTrue();

        } else if (data.testValue.describe == 'SetStringPercent') {
          console.info('[' + data.caseTag + ']referenceRect.top - targetRectAfter.top:'
            + (referenceRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
            + (referenceRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
            + (targetRectAfter.bottom - referenceRect.bottom));
          console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
            + (targetRectAfter.right - referenceRect.right));

          //Panel component need special adapter ,the reason is the top of Panel has a own size
          if (data.pageConfig.componentKey == 'Panel') {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.parentWidthAfter! + uiContext!.vp2px(8))) <= 1)
              .assertTrue();
          } else {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - data.testValue.expectValue.parentWidthAfter!) <= 1)
              .assertTrue();
          }
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.parentWidthAfter!) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.parentWidthAfter!) <= 1)
            .assertTrue();
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.parentWidthAfter!) <= 1)
            .assertTrue();
        }
      } else if (data.pageConfig.componentKey == 'Tabs') {
        // let referenceRect = Utils.getComponentRectByObj(JSON.parseJsonElement(JSON.stringify(getInspectorTree()))
        //   .getArray('$children')[0]
        //   .getArray('$children')[0]
        //   .getArray('$children')[1]);
        // let rectTabBar = Utils.getComponentRectByObj(JSON.parseJsonElement(JSON.stringify(getInspectorTree()))
        //   .getArray('$children')[0]
        //   .getArray('$children')[0]
        //   .getArray('$children')[0]);
        // console.info('rectTabBar.bottom - rectTabBar.top:')
        // if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetStringPx'
        //   || data.testValue.describe == 'SetResource') {
        //   console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
        //     + (referenceRect.top - targetRectAfter.top));
        //   console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
        //     + (referenceRect.left - targetRectAfter.left));
        //   console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
        //     + (targetRectAfter.bottom - referenceRect.bottom));
        //   console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
        //     + (targetRectAfter.right - referenceRect.right));
        //   expect(Math.abs(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top) - data.testValue.expectValue.top!) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom!) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right!) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left!) <= 1)
        //     .assertTrue();
        // } else if (data.testValue.describe == 'SetStringPercent') {
        //   console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
        //     + (referenceRect.top - targetRectAfter.top));
        //   console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
        //     + (referenceRect.left - targetRectAfter.left));
        //   console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
        //     + (targetRectAfter.bottom - referenceRect.bottom));
        //   console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
        //     + (targetRectAfter.right - referenceRect.right));
        //
        //   expect(Math.abs(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top) - data.testValue.expectValue.parentWidthAfter!) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.parentWidthAfter!))
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.parentWidthAfter!) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.parentWidthAfter!) <= 1)
        //     .assertTrue();
        // }
      } else {
        //Verify the width size of the target component.
        let targetRectAfterWidth = targetRectAfter.right - targetRectAfter.left;
        console.info('[' + data.caseTag + '] targetRectAfterWidth:' + targetRectAfterWidth);

        //Verify the height size of the target component.
        let targetRectAfterHeight = targetRectAfter.bottom - targetRectAfter.top;

        console.info('[' + data.caseTag + '] targetRectAfterHeight:' + targetRectAfterHeight);
        console.info('[' + data.caseTag + '] targetRectAfterWidth:' + targetRectAfterWidth);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.left:' + data.testValue.expectValue.left);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.right:' + data.testValue.expectValue.right);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.top:' + data.testValue.expectValue.top);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.bottom:' + data.testValue.expectValue.bottom);

        if (data.testValue.describe == 'SetStringPercent') {
          expect(Math.abs(targetRectAfterWidth - targetRectBeforeWidth - ((data.testValue.expectValue.parentWidthAfter!) * 2)) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfterHeight - targetRectBeforeHeight - ((data.testValue.expectValue.parentWidthAfter!) * 2)) <= 1)
            .assertTrue();
        } else {
          //Verify if other methods were successful.
          expect(Math.floor(Math.abs(targetRectAfterWidth - targetRectBeforeWidth - (data.testValue.expectValue.left! + data.testValue.expectValue.right!))) <= 1)
            .assertTrue();
          expect(Math.floor(Math.abs(targetRectAfterHeight - targetRectBeforeHeight - (data.testValue.expectValue.top! + data.testValue.expectValue.bottom!))) <= 1)
            .assertTrue();
        }
      }
    })
  })
}