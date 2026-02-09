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
import { describe, expect, beforeAll,beforeEach } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function stateStylesTest_01() {
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Blank',
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
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
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
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line'
  ]

  let pageConfig: PageConfig = {
    testName: 'testStateStyles',
    pageName: 'StateStylesPage',
    pageUrl: 'MainAbility/pages/stateStyles/StateStylesPage_01'
  }

  let testValues: TestValue[] = [{
    describe: 'SetDisabled',
    setValue: false,
    expectValue: {
      disabledStyles: 2,
      normalStyles: 1
    }
  }]

  describe('StateStylesTest_01', () => {
    beforeAll(() => {
      console.info("StateStylesTest beforeEach start");
      console.info("startAbility start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      console.info("startAbility end");
    });
    beforeEach(()=>{
    })
    CommonTest.initTest(pageConfig, supportView, testValues,  async (data: BasePageConfig): Promise<void> => {

      console.log('data.pageConfig.componentKey',data.pageConfig.componentKey)
      //Obtain target component information before changes
      let targetBeforeObjKey = inspector.getInspectorByKey(data.pageConfig.componentKey);
      await Utils.sleep(1000);
      let targetBeforeObj = JSON.parseJsonElement(targetBeforeObjKey)
      // //Set value
      console.info('ddccvcvccc',data.testValue.setValue)
      console.info('[' + data.caseTag + ']' + 'targetBeforeObj.$attrs.zIndex is:' + targetBeforeObj.getElement('$attrs').getDouble('zIndex'));
      expect(targetBeforeObj.getElement('$attrs').getDouble('zIndex')).assertEqual(data.testValue.expectValue.disabledStyles);
    });
  })
}