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
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
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


export default function defaultFocusValueTest() {

  //Component to be tested
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DatePicker',
    'Image',
    'ImageAnimator',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Radio',
    'Rating',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextInput',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'Column',
    'Counter',
    'Flex',
    'GridCol',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent'
  )

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig:PageConfig = {
    testName: 'test',
    pageName: 'DefaultFocusValuePage',
    pageUrl: 'MainAbility/pages/default/DefaultFocusValuePage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'TabIndex',
    expectValue: {
      tabIndex: 0
    }
  }, {
    describe: 'DefaultFocus',
    expectValue: {
      defaultFocus: false
    }
  }, {
    describe: 'GroupDefault',
    expectValue: {
      groupDefaultFocus: false
    }
  }, {
    describe: 'FocusOnTouch',
    expectValue: {
      focusOnTouch: false
    }
  }]


  describe('DefaultFocusValueTest', () => {
    beforeAll(() => {
      console.info("defaultFocusValueTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.focusValue.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if (data.testValue.describe == 'TabIndex') {
        // Test tabIndex defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.tabIndex:' + data.viewObj!.getElement('$attrs').getInteger('tabIndex'));
        expect(data.viewObj!.getElement('$attrs').getInteger('tabIndex')).assertEqual(data.testValue.expectValue.tabIndex);
      } else if (data.testValue.describe == 'DefaultFocus') {
        // Test defaultFocus defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.defaultFocus:' + data.viewObj!.getElement('$attrs').getBoolean('defaultFocus'));
        expect(data.viewObj!.getElement('$attrs').getBoolean('defaultFocus')).assertEqual(data.testValue.expectValue.defaultFocus);
      } else if (data.testValue.describe == 'GroupDefault') {
        // Test groupDefaultFocus defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.groupDefaultFocus:' +
        data.viewObj!.getElement('$attrs').getBoolean('groupDefaultFocus'));
        expect(data.viewObj!.getElement('$attrs').getBoolean('groupDefaultFocus'))
          .assertEqual(data.testValue.expectValue.groupDefaultFocus);
      } else if (data.testValue.describe == 'FocusOnTouch') {
        // Test focusOnTouch defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.focusOnTouch:' +
        data.viewObj!.getElement('$attrs').getBoolean('focusOnTouch'));
        expect(data.viewObj!.getElement('$attrs').getBoolean('focusOnTouch')).assertEqual(data.testValue.expectValue.focusOnTouch);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
        + data.pageConfig.componentKey);
      }
    });
  })
}