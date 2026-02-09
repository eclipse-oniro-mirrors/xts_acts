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
import CommonTest from '../common/CommonTest';
import { describe, expect , beforeAll} from '../../../../hypium/index';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function defaultFlexTest() {

  let containerView: Array<string> = new Array<string>('Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse')

  //Component to be tested
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'Navigation',
    'ScrollBar',
    'Row',
    'RelativeContainer',
    'TextTimer',
    'Flex',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'Search',
    'Slider'
  )

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig: PageConfig = {
    testName: 'test',
    pageName: 'DefaultFlexPage',
    pageUrl: 'MainAbility/pages/default/DefaultFlexPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'FlexBasis',
    exceptView: ['Blank'],
    expectValue: {
      flexBasis: 'auto'
    }
  }, {
    describe: 'FlexGrow',
    exceptView: ['Blank'],
    expectValue: {
      flexGrow: 0
    }
  },
    {
      describe: 'AlignSelf',
      expectValue: {
        alignSelf: 'ItemAlign.Auto',
        alignSelfBlank: 'ItemAlign.Stretch'
      }
    }]

  describe('DefaultFlexTest', () => {
    beforeAll(() => {
      console.info("defaultFlexTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.flex1.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if (data.testValue.describe == 'FlexBasis') {
        // Test flexBasis defaults
        console.info('[' + data.caseTag + ']data.viewObj!.$attrs.flexBasis:' + data.viewObj!.getElement('$attrs').getString('flexBasis'));
        expect(data.viewObj!.getElement('$attrs').getString('flexBasis')).assertEqual(data.testValue.expectValue.flexBasis);
      } else if (data.testValue.describe == 'FlexGrow') {
        // Test flexGrow defaults
        console.info('[' + data.caseTag + ']data.viewObj!.$attrs.flexGrow:' + data.viewObj!.getElement('$attrs').getDouble('flexGrow'));
        expect(data.viewObj!.getElement('$attrs').getDouble('flexGrow')).assertEqual(data.testValue.expectValue.flexGrow);
      } else if (data.testValue.describe == 'FlexShrink') {
        // Test flexShrink defaults
        console.info('[' + data.caseTag + ']data.viewObj!.$attrs.flexShrink:' + data.viewObj!.getElement('$attrs').getDouble('flexShrink'));
        if ((data.pageConfig.containerView == 'Row') || (data.pageConfig.containerView == 'Column')) {
          console.info('[' + data.caseTag + ']data.pageConfig.containerView:' + data.pageConfig.containerView);
          expect(data.viewObj!.getElement('$attrs').getDouble('flexShrink')).assertEqual(data.testValue.expectValue.flexShrinkRowColumn);
        } else if ((data.pageConfig.containerView == 'FlexRow') || (data.pageConfig.containerView == 'FlexRowReverse')
          || (data.pageConfig.containerView == 'FlexColumn') || (data.pageConfig.containerView == 'FlexColumnReverse')) {
          console.info('[' + data.caseTag + ']data.pageConfig.containerView:' + data.pageConfig.containerView);
          expect(data.viewObj!.getElement('$attrs').getDouble('flexShrink')).assertEqual(data.testValue.expectValue.flexShrinkFlex);
        }
      } else if (data.testValue.describe == 'AlignSelf') {
        // Test alignSelf defaults
        if (data.pageConfig.componentKey == 'Blank') {
          console.info('[' + data.caseTag + ']data.viewObj!.$attrs.alignSelf:' + data.viewObj!.getElement('$attrs').getString('alignSelf'));
          expect(data.viewObj!.getElement('$attrs').getString('alignSelf')).assertEqual(data.testValue.expectValue.alignSelfBlank);
        } else {
          console.info('[' + data.caseTag + ']data.viewObj!.$attrs.alignSelf:' + data.viewObj!.getElement('$attrs').getString('alignSelf'));
          expect(data.viewObj!.getElement('$attrs').getString('alignSelf')).assertEqual(data.testValue.expectValue.alignSelf);
        }
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
          + data.pageConfig.componentKey);
      }
    });
  })
}