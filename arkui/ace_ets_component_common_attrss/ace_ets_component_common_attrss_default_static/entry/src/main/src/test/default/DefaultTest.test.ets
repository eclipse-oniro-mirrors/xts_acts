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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, Size } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect , beforeAll } from '../../../../hypium/index';
import { Position, ConstraintSizeOptions, CommonMethod } from '@ohos.arkui.component'
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

export default function defaultTest() {

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

    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',

    // 'RichText',
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
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape'
  )
  //DefaultTest#testDefaultRatingHitTestBehavior
  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;

  let pageConfig: PageConfig = {
    testName: 'testDefault',
    pageName: 'DefaultPage',
    pageUrl: 'MainAbility/pages/default/DefaultPage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'Padding',
    exceptView: ['AlphabetIndexer', 'Button', 'TextArea', 'TextInput', 'Menu', 'RichText'],
    expectValue: {
      padding: '0.00vp'
    }
  }, {
    describe: 'Margin',
    exceptView: ['Checkbox', 'CheckboxGroup', 'Radio', 'Search', 'Toggle', 'RichText', 'RowSplit'],
    expectValue: {
      margin: '0.00vp'
    }
  }, {
    describe: 'ConstraintSize',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      constraintSize: {
        'minWidth': '0.00vp', 'minHeight': '0.00vp', 'maxWidth': 'Infinityvp', 'maxHeight': 'Infinityvp'
      } as ConstraintSizeOptions
    }
  }, {
    describe: 'LayoutWeight',
    exceptView: ['Web'],
    expectValue: {
      layoutWeight: 0
    }
  }, {
    describe: 'MarkAnchor',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      markAnchor: {
        x: '', y: ''
      } as Position
    }
  }, {
    describe: 'Offset',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      offset: {
        x: '', y: ''
      } as Position
    }
  }, {
    describe: 'Visibility',
    exceptView: ['RichText', 'Web', 'TabContent'],
    expectValue: {
      visibility: 'Visibility.Visible'
    }
  }, {
    describe: 'Enabled',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      enabled: true
    }
  }, {
    describe: 'Touchable',
    exceptView: ['RichText', 'Web'],
    expectValue: {
      touchable: true
    }
  },
    {
      describe: 'HitTestBehavior',
      exceptView: ['RichText', 'Web'],
      expectValue: {
        hitTestBehavior: 'HitTestMode.Default'
      }
    }
  ]

  describe('DefaultTest', () => {
    beforeAll(() => {
      console.info("defaultTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      if (data.testValue.describe == 'Padding') {
        // Test padding defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.padding:' + data.viewObj!.getElement('$attrs').getString('padding'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.padding' + data.testValue.expectValue.padding);
        expect(data.viewObj!.getElement('$attrs').getString('padding')).assertEqual(data.testValue.expectValue.padding);
      } else if (data.testValue.describe == 'Margin') {
        // Test margin defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.margin:' + data.viewObj!.getElement('$attrs').getString('margin'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.margin:' + data.testValue.expectValue.margin);
        expect(data.viewObj!.getElement('$attrs').getString('margin')).assertEqual(data.testValue.expectValue.margin);
      } else if (data.testValue.describe == 'ConstraintSize') {
        const viewObjectConstraintSize = JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('constraintSize'))
        const viewObjMinWidth = viewObjectConstraintSize.getString("minWidth")
        const viewObjMinHeight = viewObjectConstraintSize.getString("minHeight")
        const viewObjMaxWidth = viewObjectConstraintSize.getString("maxWidth")
        const viewObjMaxHeight = viewObjectConstraintSize.getString("maxHeight")
        const Width1 = data.testValue.expectValue.constraintSize!.minWidth
        expect(viewObjMinWidth).assertEqual(data.testValue.expectValue.constraintSize!.minWidth);
        expect(viewObjMinHeight).assertEqual(data.testValue.expectValue.constraintSize!.minHeight);
        expect(viewObjMaxWidth).assertEqual(data.testValue.expectValue.constraintSize!.maxWidth);
        expect(viewObjMaxHeight).assertEqual(data.testValue.expectValue.constraintSize!.maxHeight);
      } else if (data.testValue.describe == 'LayoutWeight') {
        // Test layoutWeight defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.layoutWeight:' + data.viewObj!.getElement('$attrs').getDouble('layoutWeight'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.layoutWeight' + data.testValue.expectValue.layoutWeight);
        expect(data.viewObj!.getElement('$attrs').getDouble('layoutWeight')).assertEqual(data.testValue.expectValue.layoutWeight);
      } else if (data.testValue.describe == 'MarkAnchor') {
        // Test markAnchor defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.x:' + data.viewObj!.getElement('$attrs').getElement('markAnchor')!.getString('x'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.markAnchor!.x:' + data.testValue.expectValue.markAnchor!.x);
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.y:' + data.viewObj!.getElement('$attrs').getElement('markAnchor')!.getString('y'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.markAnchor!.y' + data.testValue.expectValue.markAnchor!.y);
        expect(data.viewObj!.getElement('$attrs').getElement('markAnchor')!.getString('x')).assertEqual(data.testValue.expectValue.markAnchor!.x);
        expect(data.viewObj!.getElement('$attrs').getElement('markAnchor')!.getString('y')).assertEqual(data.testValue.expectValue.markAnchor!.y);
      } else if (data.testValue.describe == 'Offset') {
        // Test offset defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.x:' + data.viewObj!.getElement('$attrs').getElement('offset')!.getString('x'));
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.y:' + data.viewObj!.getElement('$attrs').getElement('offset')!.getString('y'));
        expect(data.viewObj!.getElement('$attrs').getElement('offset')!.getString('x')).assertEqual(data.testValue.expectValue.offset!.x);
        expect(data.viewObj!.getElement('$attrs').getElement('offset')!.getString('y')).assertEqual(data.testValue.expectValue.offset!.y);
      } else if (data.testValue.describe == 'Visibility') {
        // Test visibility defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.visibility:' + data.viewObj!.getElement('$attrs').getString('visibility'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.visibility:' + data.testValue.expectValue.visibility);
        expect(data.viewObj!.getElement('$attrs').getString('visibility')).assertEqual(data.testValue.expectValue.visibility);
      } else if (data.testValue.describe == 'Enabled') {
        // Test enabled defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.enabled:' + data.viewObj!.getElement('$attrs').getBoolean('enabled'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.enabled' + data.testValue.expectValue.enabled);
        expect(data.viewObj!.getElement('$attrs').getBoolean('enabled')).assertEqual(data.testValue.expectValue.enabled);
      } else if (data.testValue.describe == 'Touchable') {
        // Test touchable defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.touchable:' + data.viewObj!.getElement('$attrs').getBoolean('touchable'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.touchable' + data.testValue.expectValue.touchable);
        expect(data.viewObj!.getElement('$attrs').getBoolean('touchable')).assertEqual(data.testValue.expectValue.touchable);
      } else if (data.testValue.describe == 'ResponseRegion') {
        // Test responseRegion defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.responseRegion[0]:' +  data.viewObj!.getElement('$attrs').getArray('responseRegion')![0]);
        console.info('[' + data.caseTag + ']data.testValue.expectValue.responseRegion' + JSON.stringify(data.testValue.expectValue.responseRegion));
        expect(data.viewObj!.getElement('$attrs').getArray('responseRegion')![0])
          .assertEqual(JSON.stringify(data.testValue.expectValue.responseRegion));
      } else if (data.testValue.describe == 'HitTestBehavior') {
        // Test hitTestBehavior defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.hitTestBehavior:' +
        data.viewObj!.getElement('$attrs').getString('hitTestBehavior'));
        console.info('[' + data.caseTag + ']data.testValue.expectValue.hitTestBehavior:' +data.testValue.expectValue.hitTestBehavior);
        expect(data.viewObj!.getElement('$attrs').getString('hitTestBehavior')).assertEqual(data.testValue.expectValue.hitTestBehavior);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
          + data.pageConfig.componentKey);
      }
    });
  })
}