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

import Utils, {
  BasePageConfig,
  PageConfig,
  TestValue,
  RectValue,
  DefaultAlignItems
} from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { ItemAlign, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function flexBasisTest() {



  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
  // 'ImageAnimator',
  // 'LoadingProgress',
  // 'Marquee',
  // 'Menu',
  // 'Navigation',
  // 'NavRouter',
  // 'ScrollBar',
  // 'Row',
  // 'RelativeContainer',
  // 'TextTimer',
  // 'Progress',
  // 'QRCode',
  // 'Radio',
  // 'Rating',
  // 'Search',
  // 'Slider',
  // 'Text',
  // 'TextArea',
  // 'TextClock',
  // 'TextInput',
  // 'TextPicker',
  // 'TimePicker',
  // 'Toggle',
  // 'Badge',
  // 'Column',
  // 'Counter',
  // 'Grid',
  // 'List',
  // 'Refresh',
  // 'Scroll',
  // 'Stack',
  // 'Swiper',
  // 'Tabs',
  // 'Circle',
  // 'Ellipse',
  // 'Line',
  // 'Polyline',
  // 'Polygon',
  // 'Path',
  // 'Rect',
  // 'Shape'
  ]

  let containerView = ['Row', 'Column', 'FlexRow', 'FlexRowReverse', 'FlexColumn', 'FlexColumnReverse']

  let parentWidth = 300;
  let parentHeight = 300;
  let targetWidth = 120;
  let targetHeight = 120;

  let pageConfig: PageConfig = {
    testName: 'testFlexBasis',
    pageName: 'FlexBasisPage',
    pageUrl: 'MainAbility/pages/flex/FlexBasisPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    targetWidth: targetWidth,
    targetHeight: targetHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      flexBasis: '100.00vp'
    },
    expectValue: {
      expectFlexBasis: '100.00vp',
      expectSize: 100
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      flexBasis: '200.00px'
    },
    expectValue: {
      expectFlexBasis: '200.00px',
      expectSize: 200.00
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      flexBasis: '50%'
    },
    expectValue: {
      expectSize: 120
    }
  }]

  describe('FlexBasisTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("FlexBasisTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.001.test.static", "EntryAbility")
    });
    
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues,
      async (data: BasePageConfig): Promise<void> => {
        AppStorage.setOrCreate<string | number>('_flexBasis', data.testValue.setValue.flexBasis)
        let strJson = inspector.getInspectorByKey(pageConfig.componentKey as string ?? '');
        data.viewObj = JSON.parseJsonElement(strJson);
        //Verify the flexBasis is or not be set success
        console.info('[' + data.caseTag + '] check the flexBasis is or not be set success');

        if (data.testValue.describe == 'SetNumber') {
          data.testValue.expectValue.expectSize = UIContext.resolveUIContext()!.vp2px(100.00)

        }
        if (data.testValue.describe == 'SetStringPercent') {
          data.testValue.expectValue.expectSize = UIContext.resolveUIContext()!.vp2px(120)
        }

        if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetStringPx') {
          expect(data.viewObj!.getElement('$attrs').getString('flexBasis')).assertEqual(data.testValue.expectValue.expectFlexBasis);
          console.info('[' + data.caseTag + '] data.viewObj.$attrs.flexBasis' +
          data.viewObj!.getElement('$attrs').getString('flexBasis'));
        }

        //Get target component rect
        console.info('[' + data.caseTag + '] Get target component rect');
        let rect = Utils.getComponentRect((data.pageConfig.componentKey as string) ?? '');

        console.info('[' + data.caseTag + '] check the size of the component in the spindle ' +
          'direction has been changed by flexBasis ');

        //Verify the size is or not be the expect size
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {

          let realWidth = rect.right - rect.left;
          console.info('[' + data.caseTag + '] realWidth : ' + realWidth);
          if (data.pageConfig.componentKey == 'TextInput') {
            expect(Math.floor(Math.abs(realWidth - (data.testValue.expectValue.expectSize))) <= 2).assertTrue();
          } else {
             expect(Math.floor(Math.abs(realWidth - (data.testValue.expectValue.expectSize))) <= 1).assertTrue();
          }
        } else if (data.pageConfig.containerView == 'Column' || data.pageConfig.containerView == 'FlexColumn'
          || data.pageConfig.containerView == 'FlexColumnReverse') {

          let realHeight = rect.bottom - rect.top;
          console.info('[' + data.caseTag + '] realHeight : ' + realHeight);
          expect(Math.floor(Math.abs(realHeight - (data.testValue.expectValue.expectSize))) <= 1).assertTrue();
        }
      })
  })
}