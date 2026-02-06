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
import {Color,$r,Length} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,SetValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, expect,beforeAll,afterEach } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface Attrs{
  $attrs: SetValue
}
/**
 * Test of common attribute: width
 */
export default function widthTest() {

  //A list of components that support width attributes is required.
  let supportView = new Array<string>(
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
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'Slider',
    'Text',
    'TextClock',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'Flex',
    'GridRow',
    'Grid',
    'List',
    'ListItem',
    'Refresh',
    'Row',
    'Stack',
    'Swiper',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'GridItem',
    'RelativeContainer',
  )
  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Red
  let BackGroundColor = Color.Orange

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testWidth',
    pageName: 'WidthPage',
    pageUrl: 'MainAbility/pages/width/WidthPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentBackGroundColor: parentBackGroundColor,
    BackGroundColor: BackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'ExceedParent',
    setValue: {
      width: 400
    },
    expectValue: {
      widthCompare: '400.00vp',
      width: 400, ExceedParent: true
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      width: '50%'
    },
    expectValue: {
      widthCompare: '50.00%',
      width: 150
    }
  }, {
    describe: 'Resource',
    setValue: {
      width: $r('app.float.200vp')
    },
    expectValue: {
      widthCompare: '200.00vp',
      width: 200
    }
  }, {
    describe: 'StringPx',
    setValue: {
      width: '300px'
    },
    expectValue: {
      widthCompare: '300.00px',
      width: 300
    }
  }]

  /**
   * Create test suite.
   */
  describe('WidthTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("UseSizeTypeTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });

    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if(data.testValue.describe == "ExceedParent"){
        data.testValue.expectValue.width = UIContext.resolveUIContext()!.vp2px(400)
      }
      if(data.testValue.describe == "StringPercent"){
        data.testValue.expectValue.width = UIContext.resolveUIContext()!.vp2px(300) * 0.5
      }
      if(data.testValue.describe == "Resource"){
        data.testValue.expectValue.width = UIContext.resolveUIContext()!.vp2px(200)
      }
      // AppStorage.setOrCreate<Length>('_width', data.testValue.setValue.width)
      //Obtain dimensional information for reference components.
      let rect: RectValue = Utils.getComponentRect(data.pageConfig.componentKey??'');

      //Obtain the region information of the parent component.
      let rectParent: RectValue = Utils.getComponentRect(data.pageConfig.parentComponentKey??'');
      let attrs = data.viewObj as jsonx.JsonElement
      console.info('[' + data.caseTag + '] data.testValue.expectValue.width:' + data.testValue.expectValue.width);
      console.info('[' + data.caseTag + '] data.viewObj.rectParent.left:' + rectParent.left);
      console.info('[' + data.caseTag + '] data.viewObj.rectParent.right:' + rectParent.right);
      console.info('[' + data.caseTag + '] data.viewObj.rect.right:' + rect.right + "rect.left:" + rect.left);
      console.info('[' + data.caseTag + '] data.viewObj.rect.right:' + (rectParent.left > rect.left || rectParent.right < rect.right));

      //Verify the width width of the target component.
      let strJsonRectWidth = rect.right - rect.left;
      console.info('[' + data.caseTag + '] strJsonRectWidth is:' + strJsonRectWidth);

      if (data.testValue.describe == 'ExceedParent') {
        //Confirm that the calculated value is consistent with the expected value.
        expect((rectParent.left > rect.left || rectParent.right < rect.right))
          .assertEqual(data.testValue.expectValue.ExceedParent);
      }

      //Confirm that the width attribute values have been successfully set.
      expect(attrs?.getElement("$attrs").getString('width')).assertEqual(data.testValue.expectValue.widthCompare);

      // console.info('[' + data.caseTag + '] strJsonRectWidth strJsonRectWidth:' + data.testValue.expectValue.width + '; strJsonRectWidth:' + strJsonRectWidth);
      // console.info('[' + data.caseTag + '] strJsonRectWidth strJsonRectWidth:' + Math.abs(Number(strJsonRectWidth) - Number(data.testValue.expectValue.width)));
      // console.info('[' + data.caseTag + '] strJsonRectWidth strJsonRectWidth:' + (Math.abs(Number(strJsonRectWidth) - Number(data.testValue.expectValue.width)) <= 1));
      //Confirm that the calculated value is consistent with the expected value.
      expect(Math.abs(strJsonRectWidth - data.testValue.expectValue.width) <= 1).assertTrue();
    })
  })
}