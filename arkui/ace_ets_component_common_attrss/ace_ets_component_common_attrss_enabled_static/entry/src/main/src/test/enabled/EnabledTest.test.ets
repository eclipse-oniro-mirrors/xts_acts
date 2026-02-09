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

import Utils, { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { MouseAction, MouseButton } from '@ohos.arkui.component';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function expectEvent(data: BasePageConfig, event: string) {
  let referenceComponent = Utils.getComponentByKey(data.pageConfig.referenceComponentKey);
  waitForCompletion(async ()=>{await Utils.sleep(2000)})
  console.info(JSON.stringify(referenceComponent) + ' verify onHover11.')
  if (isEnabledTrue(data)) {
    console.info('isEnabledTrue == true -> ' + referenceComponent.getElement('$attrs').getString('content'))
    expect(referenceComponent.getElement('$attrs').getString('content')).assertContain(event);
  } else {
    console.info('isEnabledTrue == false -> ' + referenceComponent.getElement('$attrs').getString('content'))
    expect(referenceComponent.getElement('$attrs').getString('content')).assertEqual('');
  }
}

function isEnabledTrue(data: BasePageConfig): boolean {
  return data.testValue.describe.indexOf('SetTrue') >= 0;
}

/**
 * Test of common attribute: enabled
 */
export default function enabledTest() {
  //A list of components that support the enabled attribute, which is required.
  let supportView: string[] = [
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
    'LoadingProgress',
    'Marquee',
    'MenuItem',

    // 'NavRouter',
    'ScrollBar',
    'Row',
    'RelativeContainer',
    'GridItem',
    'TextTimer',
    'Flex',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'Select',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'Counter',
    'Grid',
    'List',
    'ListItem',

    'Refresh',
    'Scroll',
    'Stack',
    'Tabs',
    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',

    'Shape'
    // 77 pass 77
  ]

  let exceptFocusViews: Array<string> = new Array<string>(
    'Blank',
    'DataPanel',
    'Divider',
    'Gauge',
    'LoadingProgress',
    'Progress',
    'Marquee',
    'Navigation',
    'NavRouter',
    'QRCode',
    'ScrollBar',
    'TextClock',
    'TextTimer',
    'Badge',
    'Refresh',
    'RelativeContainer',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'WaterFlow'
  )

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testEnabled',
    pageName: 'EnabledPage',
    pageUrl: 'MainAbility/pages/enabled/EnabledPage',
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [
    {
      describe: 'SetTrueOnClick',
      setValue: true,
      expectValue: true
    },
    {
      describe: 'SetTrueOnFocus',
      exceptView: exceptFocusViews,
      setValue: true,
      expectValue: true
    },
    {
      describe: 'SetTrueOnBlur',
      exceptView: exceptFocusViews,
      setValue: true,
      expectValue: true
    },
    {
      describe: 'SetTrueOnHover',
      setValue: true,
      expectValue: true
    },
    {
      describe: 'SetTrueOnMouse',
      setValue: true,
      expectValue: true
    },
    {
      describe: 'SetFalseOnClick',
      setValue: false,
      expectValue: false
    },
    {
      describe: 'SetFalseOnFocus',
      exceptView: exceptFocusViews,
      setValue: false,
      expectValue: false
    },
    {
      describe: 'SetFalseOnBlur',
      exceptView: exceptFocusViews,
      setValue: false,
      expectValue: false
    },
    {
      describe: 'SetFalseOnHover',
      setValue: false,
      expectValue: false
    }
  ]

  /**
   * Create test suite.
   */
  describe('EnabledTest', () => {
    beforeAll(async () => {
      console.info("enabledTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility");
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      console.info('EnabledTest.test 118', data.testValue.setValue)
      // AppStorage.setOrCreate<boolean>('_enabled', data.testValue.setValue)
      await Utils.sleep(1000);

      let strJson = inspector.getInspectorByKey(pageConfig.componentKey ?? '');
      await Utils.sleep(2000);
      data.viewObj = JSON.parseJsonElement(strJson);
      await Utils.sleep(2000);

      if ('' !=
      Utils.getComponentByKey(data.pageConfig.referenceComponentKey).getElement('$attrs').getString('content')) {
        console.info('[' + data.caseTag + '] reset status.');
        await Utils.sleep(1000);
      }

      if (data.testValue.describe.indexOf('OnClick') >= 0) {
        //Verify onClick
        console.info('[' + data.caseTag + '] verify onClick.');
        let clickResult = Utils.performClick(data.pageConfig.componentKey!);
        await Utils.sleep(2000);
        console.info('[' + data.pageConfig.componentKey + '] data.pageConfig.componentKey.');
        console.info('[' + clickResult + '] clickResult');
        console.log("=================== " + JSON.stringify(data))
        expect(clickResult).assertEqual(true);
        if ('Select' == data.pageConfig.targetView && isEnabledTrue(data)) {
          //After selecting, need to click again to close the dropdown box.
          await Utils.sleep(2000);
          console.log('test before ' + data)
          expectEvent(data, 'onClick');
          console.log('test after ' + data)
          Utils.performClick(data.pageConfig.componentKey!);
          await Utils.sleep(2000);
        } else {
          console.log("=================== " + "onClick")
          await Utils.sleep(1000);
          expectEvent(data, 'onClick');
        }
      } else if (data.testValue.describe.indexOf('OnFocus') >= 0) {
        //Verify onFocus
        console.info('[' + data.caseTag + '] verify onFocus.');
        let focusResult = Utils.requestFocus(data.pageConfig.referenceComponentKey!);
        expect(focusResult).assertEqual(true);
        await Utils.sleep(1000);
        focusResult = Utils.requestFocus(data.pageConfig.componentKey!);
        expect(focusResult).assertEqual(isEnabledTrue(data));
        await Utils.sleep(1000);
        expectEvent(data, 'onFocus');
      } else if (data.testValue.describe.indexOf('OnBlur') >= 0) {
        //Verify onBlur
        console.info('[' + data.caseTag + '] verify onBlur.');
        console.info(JSON.stringify(data.pageConfig) + ' verify onBlur.');
        // AppStorage.setOrCreate<boolean>('_enabled', data.pageConfig.testValue.setValue)
        await Utils.sleep(1000);

        console.log('Test114  ' + Utils.requestFocus(data.pageConfig.referenceComponentKey!))
        expect(Utils.requestFocus(data.pageConfig.referenceComponentKey!)).assertEqual(true);
        await Utils.sleep(1000);

        console.log('Test115  ' + Utils.requestFocus(data.pageConfig.componentKey!))
        console.log('Test115  ' + isEnabledTrue(data))
        expect(Utils.requestFocus(data.pageConfig.componentKey!)).assertEqual(isEnabledTrue(data));
        await Utils.sleep(1000);

        console.log('Test116  ' + Utils.requestFocus(data.pageConfig.referenceComponentKey!))
        expect(Utils.requestFocus(data.pageConfig.referenceComponentKey!)).assertEqual(true);
        await Utils.sleep(1000);

        console.log('Test117  ' + JSON.stringify(data))
        expectEvent(data, 'onBlur');
      } else if (data.testValue.describe.indexOf('OnHover') >= 0) {
        //Verify onHover
        console.info('[' + data.caseTag + '] verify onHover.');
        let hoverResult = Utils.performMouseEvent(data.pageConfig.componentKey!
          , MouseButton.None, MouseAction.Hover);
        console.info('[' + hoverResult + '] verify onHover11.')
        await Utils.sleep(2000);
        expect(hoverResult).assertEqual(true);
        await Utils.sleep(1000);
        console.info('[' + data + '] verify onHover11.')
        expectEvent(data, 'onHover');
      } else if (data.testValue.describe.indexOf('OnMouse') >= 0) {
        //Verify onMouse
        console.info('[' + data.caseTag + '] verify onMouse.');
        let mouseResult = Utils.performMouseEvent(data.pageConfig.componentKey!
          , MouseButton.Left, MouseAction.Press);
        expect(mouseResult).assertEqual(true);
        await Utils.sleep(1000);
        expectEvent(data, 'onMouse');
      }

      //Verify enabled value.
      console.info('[' + data.caseTag + '] Verify enabled value.');
      expect(Utils.getComponentByKey(data.pageConfig.componentKey!).getElement('$attrs').getBoolean('enabled'))
        .assertEqual(data.testValue.expectValue);
    })
  })

}