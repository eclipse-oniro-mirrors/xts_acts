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

import Utils from '../../MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

/**
 * Test of common attribute: hitTestBehaviorTest
 */
export default function hitTestBehaviorTest() {

  let supportView = [
  //    'AlphabetIndexer',
  //    'ImageAnimator',
  //    'LoadingProgress',
  //    'Menu',
  //    'Navigation',
  //    'NavRouter',
  //    'Stepper',
  //    'Rating',
  //    'Search',
  //    'Slider',
  //    'Badge',
  //    'Counter',
  //    'GridRow',
  //    'Panel',
  //    'Refresh',
  //    'Tabs',
  //    'MenuItem',
  //    'MenuItemGroup',
  //    'ListItemGroup',
  //    'GridCol',
  //    'GridItem',
  //    'StepperItem',
  //    'FlowItem',
  //    'ListItem',
  //    'TabContent',
    'Blank',
    //    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    //    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'Marquee',
    //    'ScrollBar',
    //    'RowSplit',
    //    'Row',
    //    'RelativeContainer',
    //    'Navigator',
    //    'ColumnSplit',
    //    'TextTimer',
    //    'Flex',
    'Progress',
    'QRCode',
    'Radio',
    //    'Select',
    //    'Text',
    'TextArea',
    //    'TextClock',
    'TextInput',
    //    'TextPicker',
    //    'TimePicker',
    //    'Toggle',
    //    'Column',
    //    'Grid',
    //    'List',
    //    'Scroll',
    //    'SideBarContainer',
    //    'Stack',
    //    'Swiper',
    //    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
  //    'Shape'
  ]

  let containerView = ['RelativeContainer', 'Stack']

  //Page related configuration, this parameter is required.
  let pageConfig = {
    testName: 'testHitTestBehavior',
    pageName: 'HitTestBehaviorPage',
    pageUrl: 'MainAbility/pages/hitTestBehavior/HitTestBehaviorPage',
    referenceTargetComponentKey: 'referenceTargetComponentKey',
    referenceBrotherComponentKey: 'referenceBrotherComponentKey',
    referenceChildComponentKey: 'referenceChildComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues = [{
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
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async data => {
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

  async function executeTouch(data, hitTestBehavior, referenceTargetExpect, referenceBrotherExpect,
                              referenceChildExpect) {

    //Get object of target component.
    let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
    expect(viewObj.$attrs.hitTestBehavior).assertEqual(hitTestBehavior);
    console.info('[' + data.caseTag + ']  ' + viewObj.$attrs.hitTestBehavior);

    //Send touch event.
    let touchResult = Utils.performTouchComponentCenter(data.pageConfig.componentKey, TouchType.Down);
    expect(touchResult).assertEqual(true);
    await Utils.sleep(1000);

    //Determine whether the target component responds to touch test control.
    let referenceTargetComponent = Utils.getComponentByKey(data.pageConfig.referenceTargetComponentKey);
    if (referenceTargetComponent.$attrs.content) {
      expect(referenceTargetComponent.$attrs.content).assertEqual(referenceTargetExpect);
      console.info('[' + data.caseTag + ']  referenceTargetComponent.$attrs.content :'
      + referenceTargetComponent.$attrs.content);
    }

    //Special component,because Blank has not subcomponents,
    //And the parent component can not be stack or relativeContainer
    if (data.pageConfig.targetView == 'Blank') {
      console.info('[' + data.caseTag + ']  targetView is Blank');
      return;
    }

    //Determine if the sibling component responds to touch test control.
    let referenceBrotherComponent = Utils.getComponentByKey(data.pageConfig.referenceBrotherComponentKey);
    expect(referenceBrotherComponent.$attrs.content).assertEqual(referenceBrotherExpect);
    console.info('[' + data.caseTag + ']  referenceBrotherComponent.$attrs.content :'
    + referenceBrotherComponent.$attrs.content);

    if (isContainerView(data)) {
      //If there are subcomponents, determine whether the subcomponents respond to touch test control.
      let referenceChildComponent = Utils.getComponentByKey(data.pageConfig.referenceChildComponentKey);
      expect(referenceChildComponent.$attrs.content).assertEqual(referenceChildExpect);
      console.info('[' + data.caseTag + ']  referenceChildComponent.$attrs.content :'
      + referenceChildComponent.$attrs.content);
    }
  }

  function isContainerView(data): boolean {
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
}