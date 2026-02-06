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
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,TouchType,HitTestMode } from '@ohos.arkui.component';
import { jsonx } from "std/core";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

async function executeTouch(data: BasePageConfig, hitTestBehavior: string, referenceTargetExpect: string, referenceBrotherExpect: string,
  referenceChildExpect: string) {
  //Get object of target component.
  let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
  expect(viewObj.getElement('$attrs').getString('hitTestBehavior')).assertEqual(hitTestBehavior);
  console.info('[' + data.caseTag + ']  ' + viewObj.getElement('$attrs').getString('hitTestBehavior'));
  //Send touch event.
  let touchResult: boolean = Utils.performTouchComponentCenter(data.pageConfig.componentKey!, TouchType.Down);
  expect(touchResult).assertEqual(true);
  await Utils.sleep(1000);
  Utils.performTouchComponentCenter(data.pageConfig.componentKey!, TouchType.Up);
  //Determine whether the target component responds to touch test control.
  let referenceTargetComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.referenceTargetComponentKey);
  if (referenceTargetComponent.getElement('$attrs').getString('content')) {
    expect(referenceTargetComponent.getElement('$attrs').getString('content')).assertEqual(referenceTargetExpect);
    console.info('[' + data.caseTag + ']  referenceTargetComponent.$attrs.content :'
      + referenceTargetComponent.getElement('$attrs').getString('content'));
  }
  //Special component,because Blank has not subcomponents,
  //And the parent component can not be stack or relativeContainer
  if (data.pageConfig.targetView == 'Blank') {
    console.info('[' + data.caseTag + ']  targetView is Blank');
    return;
  }

  //Determine if the sibling component responds to touch test control.
  let referenceBrotherComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.referenceBrotherComponentKey);
  expect(referenceBrotherComponent.getElement('$attrs').getString('content')).assertEqual(referenceBrotherExpect);
  console.info('[' + data.caseTag + ']  referenceBrotherComponent.$attrs.content :'
    + referenceBrotherComponent.getElement('$attrs').getString('content'));

  if (isContainerView(data)) {
    //If there are subcomponents, determine whether the subcomponents respond to touch test control.
    let referenceChildComponent: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.referenceChildComponentKey);
    expect(referenceChildComponent.getElement('$attrs').getString('content')).assertEqual(referenceChildExpect);
    console.info('[' + data.caseTag + ']  referenceChildComponent.$attrs.content :'
      + referenceChildComponent.getElement('$attrs').getString('content'));
  }
}

function isContainerView(data: BasePageConfig): boolean {
  //If the component has no subcomponents, do not validate
  return data.pageConfig.componentKey == 'Badge' || data.pageConfig.componentKey == 'Column'
    || data.pageConfig.componentKey == 'ColumnSplit' || data.pageConfig.componentKey == 'Counter'
    || data.pageConfig.componentKey == 'Flex' || data.pageConfig.componentKey == 'FlowItem'
    || data.pageConfig.componentKey == 'GridCol' || data.pageConfig.componentKey == 'GridRow'
    || data.pageConfig.componentKey == 'Grid' || data.pageConfig.componentKey == 'GridItem'
    || data.pageConfig.componentKey == 'List' || data.pageConfig.componentKey == 'ListItem'
    || data.pageConfig.componentKey == 'ListItemGroup' || data.pageConfig.componentKey == 'Navigator'
    || data.pageConfig.componentKey == 'Panel' || data.pageConfig.componentKey == 'Refresh'
    || data.pageConfig.componentKey == 'RelativeContainer' || data.pageConfig.componentKey == 'Row'
    || data.pageConfig.componentKey == 'RowSplit' || data.pageConfig.componentKey == 'Scroll'
    || data.pageConfig.componentKey == 'SideBarContainer' || data.pageConfig.componentKey == 'Stack'
    || data.pageConfig.componentKey == 'Swiper' || data.pageConfig.componentKey == 'Tabs'
    || data.pageConfig.componentKey == 'TabContent' || data.pageConfig.componentKey == 'WaterFlow'
    || data.pageConfig.componentKey == 'ScrollBar' || data.pageConfig.componentKey == 'Button'
    || data.pageConfig.componentKey == 'Text' || data.pageConfig.componentKey == 'Toggle'
    || data.pageConfig.componentKey == 'Shape';
}

/**
 * Test of common attribute: hitTestBehaviorTest
 */
export default function hitTestBehaviorTest() {

  let supportView: Array<string> = new Array<string>(
    'Blank', //1.1
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'Divider',
    'Gauge',
    'Image',
    'Marquee',
    'Progress',
    'QRCode',
    'Radio',
    'TextArea',
    'TextInput',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
  )

  let containerView: Array<string> = new Array<string>('RelativeContainer', 'Stack')

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testHitTestBehavior',
    pageName: 'HitTestBehaviorPage',
    pageUrl: 'MainAbility/pages/hitTestBehavior/HitTestBehaviorPage',
    referenceTargetComponentKey: 'referenceTargetComponentKey',
    referenceBrotherComponentKey: 'referenceBrotherComponentKey',
    referenceChildComponentKey: 'referenceChildComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetDefault',
    setValue: {
      HitTestMode: HitTestMode.Default
    },
  }, {
    describe: 'SetBlock',
    setValue: {
      HitTestMode: HitTestMode.Block
    }
  }, {
    describe: 'SetTransparent',
    setValue: {
      HitTestMode: HitTestMode.Transparent
    }
  }, {
    describe: 'SetNone',
    setValue: {
      HitTestMode: HitTestMode.None
    }
  }]

  /**
   * Create test suite.
   */
  describe('HitTestBehaviorTest', () => {
    beforeAll(() => {
      console.info("hitTestBehaviorTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Determine whether the component that sets the hitTestBehaviorTest attribute can correctly affect its own,
      //sibling, and child node's touch response according to its enumeration type
      if (data.testValue.describe == 'SetDefault') {
        await executeTouch(data, 'HitTestMode.Default', 'onTargetTouch', '', 'onChildTouch')
      } else if (data.testValue.describe == 'SetBlock') {
        await executeTouch(data, 'HitTestMode.Block', 'onTargetTouch', '', '')
      } else if (data.testValue.describe == 'SetTransparent') {
        await executeTouch(data, 'HitTestMode.Transparent', 'onTargetTouch', 'onBrotherTouch', 'onChildTouch')
      } else if (data.testValue.describe == 'SetNone') {
        await executeTouch(data, 'HitTestMode.None', '', 'onBrotherTouch', 'onChildTouch')
      }
    })
  })

}