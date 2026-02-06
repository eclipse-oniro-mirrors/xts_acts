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
  ExpectValue,
  GrowValue,
  PageConfig,
  TestValue
} from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { $r, AlignRuleOption, Color, HorizontalAlign, Margin, VerticalAlign } from '@ohos.arkui.component';
import { jsonx } from 'std/core';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { UIContext } from '@ohos.arkui.UIContext';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function marginTest() {
  let setInit: Margin = {
    top: 0,
    right: 0,
    bottom: 0,
    left: 0
  }
  let getInit = '0.00vp';
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView = [
  'AlphabetIndexer',
  'Button',
  'Blank',
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
  'NavRouter',
  'Progress',
  'QRCode',
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
  'Circle',
  'Ellipse',
  'Line',
  'Polyline',
  'Polygon',
  'Path',
  'Rect',
  'Shape',
   'Badge',
  'Column',
  'Counter',
  'GridRow',
    'GridCol',
  'Grid',
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
  'TabContent'
  ]



  let pageConfig: PageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPage',
    pageUrl: 'MainAbility/pages/margin/MarginPage',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    buttonComponentKey: 'buttonComponentKey',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetAll',
    setValue: {
      margin: {
        top: 20,
        right: 30,
        bottom: 30,
        left: 20
      }
    },
    expectValue: {
      margin: {
        top: '20.00vp',
        right: '30.00vp',
        bottom: '30.00vp',
        left: '20.00vp'
      },
      top: 20,
      right: 30,
      bottom:30,
      left: 20
    }
  }, {
    describe: 'SetTop',
    setValue: {
      margin: {
        top: 50
      }
    },
    expectValue: {
      margin: {
        top: '50.00vp',
        right: '0.00vp',
        bottom: '0.00vp',
        left: '0.00vp'
      },
      top: 0,
      right: 0,
      bottom: 0,
      left: 0
    }
  }, {
    describe: 'SetRight',
    setValue: {
      margin: {
        right: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp',
        right: '50.00vp',
        bottom: '0.00vp',
        left: '0.00vp'
      },
      top: 0,
      right: 50,
      bottom: 0,
      left:0
    }
  }, {
    describe: 'SetBottom',
    setValue: {
      margin: {
        bottom: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp',
        right: '0.00vp',
        bottom: '50.00vp',
        left: '0.00vp'
      },
      top: 0,
      right: 0,
      bottom: 50,
      left: 0
    }
  }, {
    describe: 'SetLeft',
    setValue: {
      margin: {
        left: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp',
        right: '0.00vp',
        bottom: '0.00vp',
        left: '50.00vp'
      },
      top: 0,
      right: 0,
      bottom: 0,
      left: 50
    }
  }]

  describe('MarginTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("MarginTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });
    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if(data.testValue.describe == "SetAll"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(20)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(30)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(30)
        data.testValue.expectValue.left= UIContext.resolveUIContext()!.vp2px(20)
      }
      if(data.testValue.describe == "SetTop"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.left= UIContext.resolveUIContext()!.vp2px(0)
      }
      if(data.testValue.describe == "SetRight"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.left= UIContext.resolveUIContext()!.vp2px(0)
      }
      if(data.testValue.describe == "SetBottom"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(50)
        data.testValue.expectValue.left= UIContext.resolveUIContext()!.vp2px(0)
      }
      if(data.testValue.describe == "SetLeft"){
        data.testValue.expectValue.top = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.right = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.bottom = UIContext.resolveUIContext()!.vp2px(0)
        data.testValue.expectValue.left= UIContext.resolveUIContext()!.vp2px(50)
      }

      //Initialize margin properties
      console.info('[' + data.caseTag + '] setValue : ' + setInit);
      AppStorage.setOrCreate<Margin>('_margin', setInit)
      await Utils.sleep(1000);
      //Confirm successful setting of margin attribute
      let referenceRectBefore: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(referenceRectBefore.getElement('$attrs').getString('margin')).assertEqual(getInit);
      //Set test values
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AppStorage.setOrCreate<Margin>('_margin', data.testValue.setValue.margin)
      await Utils.sleep(1000);
      let referenceRectAfter: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      //Component margin
      let top = 0.0;
      let left = 0.0;
      let right = 0.0;
      let bottom = 0.0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = referenceRect.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if ((data.pageConfig.componentKey == 'GridCol')
        || (data.pageConfig.componentKey == 'FlowItem')
        || (data.pageConfig.componentKey == 'GridItem')
        || (data.pageConfig.componentKey == 'MenuItem')
        || (data.pageConfig.componentKey == 'MenuItemGroup')) {
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey)
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = referenceRect.left - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      }
      console.info('[' + data.caseTag + ']' + 'top is: ' + top);
      console.info('[' + data.caseTag + ']' + 'left is: ' + left);
      console.info('[' + data.caseTag + ']' + 'right is: ' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is: ' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is: ' +
      referenceRectAfter.getElement('$attrs').getString('margin'));
      //Confirm if the margin is correct

      expect((referenceRectAfter.getElement('$attrs').getString('margin')))
        .assertEqual(JSON.stringify(data.testValue.expectValue.margin));
      console.log("data.testValue.expectValue=============" + JSON.stringify(data.testValue.expectValue))
      console.log("top - data.testValue.expectValue.top" + (top - ((data.testValue.expectValue.top) as number).toInt()))
      expect(Math.abs(top - ((data.testValue.expectValue.top) as number).toInt()) <= 1).assertTrue();
      console.log("right - data.testValue.expectValue.right" +
        (right - ((data.testValue.expectValue.right) as number).toInt()))
      expect(Math.abs(right - ((data.testValue.expectValue.right) as number).toInt()) <= 1).assertTrue();
      console.log("left - data.testValue.expectValue.left" +
        (left - ((data.testValue.expectValue.left) as number).toInt()))
      expect(Math.abs(left - ((data.testValue.expectValue.left) as number).toInt()) <= 1).assertTrue();
      if (data.pageConfig.componentKey == 'GridCol'&&data.testValue.describe === 'SetAll'
        ||data.pageConfig.componentKey == 'GridCol'&&data.testValue.describe === 'SetTop'
      ||data.pageConfig.componentKey == 'GridCol'&&data.testValue.describe === 'SetBottom'){
        console.log("bottom - data.testValue.expectValue.bottom11111" + Math.abs(bottom - ((data.testValue.expectValue.bottom) as number).toInt()))
        console.info('data.testValue.expectValue.bottom222222',data.testValue.expectValue.bottom)
        expect(Math.abs(bottom - ((data.testValue.expectValue.bottom) as number).toInt()) > 1).assertTrue();
      }else{
        console.log("bottom - data.testValue.expectValue.bottom11111" +Math.abs(bottom - ((data.testValue.expectValue.bottom) as number).toInt()))
        console.info('data.testValue.expectValue.bottom222222',data.testValue.expectValue.bottom)
        expect(Math.abs(bottom - ((data.testValue.expectValue.bottom) as number).toInt()) <= 1).assertTrue();
      }

    });
  })
}