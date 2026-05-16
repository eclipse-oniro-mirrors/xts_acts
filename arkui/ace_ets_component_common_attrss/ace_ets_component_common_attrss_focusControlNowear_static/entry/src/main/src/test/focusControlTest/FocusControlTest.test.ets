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
import { AlignRuleOption, VerticalAlign, HorizontalAlign,  focusControl } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
export default function FocusControlTest() {

  let supportView = [
    'Button',
    'TextInput',
    'TextArea',
    'Search',
    'Text',
    'Image',
    'Grid',
    'List',
    'Checkbox',
    'CheckboxGroup',
    'DatePicker',
    //    'ImageAnimator',
    'Menu',
    'MenuItem',
    //    'MenuItemGroup',
    'Radio',
    'Rating',
    'Select',
    'Slider',
    'TextPicker',
    'TimePicker',
    'Toggle',
    // 'Web',
    'AlphabetIndexer',
    'Column',
    //    'ColumnSplit',
    'Counter',
    'Flex',
    //    'GridCol',
    //    'GridRow',
    'GridItem',
    'ListItem',
    //    'ListItemGroup',
    'Row',
    //    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
  //    'TabContent'
  ]

  
  let pageConfig: PageConfig = {
    testName: 'testFocusControl',
    pageName: 'FocusControlPage',
    pageUrl: 'MainAbility/pages/focusControl/FocusControlPage',
    referenceComponentKey: 'referenceComponentKey',
  }

  let testValues: TestValue[] = [{
    describe: 'SetFocusableTrue',
  }, {
    describe: 'SetFocusableFalse',
    setValue: false
  }, {
    describe: 'SetAbsentComponent',
  }]

  /**
   * Create test suite.
   */

  describe('FocusControlTest', () => {
    beforeAll(() => {
      console.info("FocusControlTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs3.test.static", "EntryAbility")
      
    });
    
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if ('SetFocusableTrue' == data.testValue.describe) {
        let res = focusControl.requestFocus(data.pageConfig.componentKey!);
        expect(res).assertEqual(true);
        console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);
      } else if ('SetFocusableFalse' == data.testValue.describe) {
        let res = focusControl.requestFocus(data.pageConfig.componentKey!);
        expect(res).assertEqual(false);
        console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);
      } else if ('SetAbsentComponent' == data.testValue.describe) {
        let res = focusControl.requestFocus('nullKey');
        expect(res).assertEqual(false);
        console.info('[' + data.caseTag + '] FocusControlCallback is ' + res);
      }
    })
  })
}