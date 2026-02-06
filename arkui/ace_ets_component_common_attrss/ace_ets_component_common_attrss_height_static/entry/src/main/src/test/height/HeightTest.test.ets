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

import { $r, Color, Length } from '@ohos.arkui.component'
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
import { startAbility, stopApplication, UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

interface Attrs {
  $attrs: SetValue
}

/**
 * Test of common attribute: height
 */
export default function heightTest() {

  //A list of components that support padding attributes is required.
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'BlankRow',
    'BlankColumn',
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
    'Navigation',
    // 'NavRouter', // Navigation替换
    'Progress',
    'QRCode',
    'Radio',
    //    'ScrollBar',
    'Rating',
    'Search',
    'Slider',
    'Text',
    //    'TextArea',
    'TextClock',
    //    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    //    'Counter',
    'Flex',
    //    'GridRow',
    'Grid',
    'List',
    'ListItem',
    'Refresh',
    'Row',
    //    'Scroll',
    //    'SideBarContainer',
    'Stack',
    'Swiper',
    //    'Tabs',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    //    'GridCol',
    'GridItem',
    'RelativeContainer',
    'Menu',
    'MenuItem',
    //    'MenuItemGroup'
  ]


  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Red
  let BackGroundColor = Color.Orange

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testHeight',
    pageName: 'HeightPage',
    pageUrl: 'MainAbility/pages/height/HeightPage',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    BackGroundColor: BackGroundColor
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [
    {
      describe: 'ExceedParent',
      setValue: {
        height: 550
      },
      expectValue: {
        heightCompare: '550.00vp',
        height:550, ExceedParent: true
      }
    },
    {
      describe: 'StringPercent',
      setValue: {
        height: '50%'
      },
      expectValue: {
        heightCompare: '50.00%',
        height: 300
      }
    },
    {
      describe: 'Resource',
      setValue: {
        height: $r('app.float.200vp')
      },
      expectValue: {
        heightCompare: '200.00vp',
        height: 200
      }
    },
    {
      describe: 'StringPx',
      setValue: {
        height: '300px'
      },
      expectValue: {
        heightCompare: '300.00px',
        height: 300
      }
    }
  ]


  /**
   * Create test suite.
   */
  describe('HeightTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log('test heightTest is start')
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if (data.testValue.describe == 'ExceedParent') {
        data.testValue.expectValue.height = UIContext.resolveUIContext()!.vp2px(550)
      }
      if (data.testValue.describe == 'StringPercent') {
        data.testValue.expectValue.height = UIContext.resolveUIContext()!.vp2px(300) * 0.5
      }
      if (data.testValue.describe == 'Resource') {
        data.testValue.expectValue.height = UIContext.resolveUIContext()!.vp2px(200)
      }

      //Obtain dimensional information for target components.
      console.info(' data.testValue.setValue.height is: ' + data.testValue.setValue.height);
      // AppStorage.setOrCreate<Length>('_height', data.testValue.setValue.height)

      await Utils.sleep(4000);
      let strJson = inspector.getInspectorByKey(pageConfig.componentKey);
      await Utils.sleep(1000);
      data.viewObj = JSON.parseJsonElement(strJson);


      console.info('data.pageConfig.componentKey' + data.pageConfig.componentKey);
      let rect = Utils.getComponentRect(data.pageConfig.componentKey ?? '');
      //Obtain the region information of the parent component.
      console.info('data.pageConfig.parentComponentKey' + data.pageConfig.parentComponentKey);
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey ?? '');
      //Verify the height height of the target component.
      let strJsonRectHeight = rect.bottom - rect.top;
      console.info('[' + data.caseTag + '] data.testValue.expectValue.height:' + data.testValue.expectValue.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.height:' +
      data.viewObj?.getElement('$attrs').getString('height'));

      console.info('[' + data.caseTag + '] data.viewObj.$attrs.width:' +
      data.viewObj?.getElement('$attrs').getString('width'));

      console.info('[' + data.caseTag + '] data.viewObj.$attrs' +
      JSON.stringifyJsonElement(data.viewObj?.getElement('$attrs')!));
      console.info('[' + data.caseTag + '] strJsonRectHeight is: ' + strJsonRectHeight);

      if (data.testValue.describe == 'ExceedParent') {
        //Confirm that the calculated value is consistent with the expected value.
        console.log('test start ExceedParent')
        expect(rectParent.top > rect.top || rectParent.bottom < rect.bottom)
          .assertEqual(data.testValue.expectValue.ExceedParent);
      }

      //Confirm that the height attribute values have been successfully set.
      console.info('expect heightis: ' + data.viewObj?.getElement('$attrs').getString('height'));
      expect(data.viewObj?.getElement('$attrs').getString('height'))
        .assertEqual(data.testValue.expectValue.heightCompare);

      //Confirm that the calculated value is consistent with the expected value.
      expect(Math.abs(strJsonRectHeight - (data.testValue.expectValue.height as number).toInt()) <= 1).assertTrue();
    })
  })
}