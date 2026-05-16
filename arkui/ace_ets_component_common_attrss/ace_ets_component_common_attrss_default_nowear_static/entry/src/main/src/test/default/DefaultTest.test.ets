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
  PageConfig,
  RectValue,
  TestValue
} from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { CommonMethod, ConstraintSizeOptions, Position } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function defaultTest() {

  //Component to be tested
  let supportView: Array<string> = new Array<string>(
    // 'Web',
     'ColumnSplit',
     'RowSplit',
     'FlowItem',
     'SideBarContainer',
     'WaterFlow'
  )

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
        'minWidth': '0.00vp',
        'minHeight': '0.00vp',
        'maxWidth': 'Infinityvp',
        'maxHeight': 'Infinityvp'
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
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      if (data.testValue.describe == 'Padding') {
        // Test padding defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getString(padding):' +
        data.viewObj!.getElement('$attrs').getString('padding'));
        expect(data.viewObj!.getElement('$attrs').getString('padding')).assertEqual(data.testValue.expectValue.padding);
      } else if (data.testValue.describe == 'Margin') {
        // Test margin defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getString(margin):' +
        data.viewObj!.getElement('$attrs').getString('margin'));
        expect(data.viewObj!.getElement('$attrs').getString('margin')).assertEqual(data.testValue.expectValue.margin);
      } else if (data.testValue.describe == 'ConstraintSize') {
        // Test constraintSize defaults
        console.info('[' + data.caseTag + ']data.viewObj.size.constraintSize:' +
        data.viewObj!.getElement('$attrs').getString('constraintSize'));
        const viewObjectConstraintSize =
          JSON.parseJsonElement(data.viewObj!.getElement('$attrs').getString('constraintSize'))
        const viewObjMinWidth = viewObjectConstraintSize.getString("minWidth")
        const viewObjMinHeight = viewObjectConstraintSize.getString("minHeight")
        const viewObjMaxWidth = viewObjectConstraintSize.getString("maxWidth")
        const viewObjMaxHeight = viewObjectConstraintSize.getString("maxHeight")
        expect(viewObjMinWidth).assertEqual(data.testValue.expectValue.constraintSize!.minWidth);
        expect(viewObjMinHeight).assertEqual(data.testValue.expectValue.constraintSize!.minHeight);
        expect(viewObjMaxWidth).assertEqual(data.testValue.expectValue.constraintSize!.maxWidth);
        expect(viewObjMaxHeight).assertEqual(data.testValue.expectValue.constraintSize!.maxHeight);
        // expect(data.viewObj!.getElement('$attrs').getString('constraintSize'))
        //   .assertEqual(data.testValue.expectValue.constraintSize);
      } else if (data.testValue.describe == 'LayoutWeight') {
        // Test layoutWeight defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getDouble(layoutWeight):' +
        data.viewObj!.getElement('$attrs').getDouble('layoutWeight'));
        expect(data.viewObj!.getElement('$attrs').getDouble('layoutWeight'))
          .assertEqual(data.testValue.expectValue.layoutWeight);
      } else if (data.testValue.describe == 'MarkAnchor') {
        // Test markAnchor defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.x:' +
        data.viewObj!.getElement('$attrs').getElement('markAnchor').getString('x'));
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.markAnchor.y:' +
        data.viewObj!.getElement('$attrs').getElement('markAnchor').getString('y'));
        expect(data.viewObj!.getElement('$attrs').getElement('markAnchor').getString('x'))
          .assertEqual(data.testValue.expectValue.markAnchor!.x);
        expect(data.viewObj!.getElement('$attrs').getElement('markAnchor').getString('y'))
          .assertEqual(data.testValue.expectValue.markAnchor!.y);
      } else if (data.testValue.describe == 'Offset') {
        // Test offset defaults
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.x:' +
        data.viewObj!.getElement('$attrs').getElement('offset')!.getString('x'));
        console.info('[' + data.caseTag + ']data.viewObj.$attrs.offset.y:' +
        data.viewObj!.getElement('$attrs').getElement('offset')!.getString('y'));
        expect(data.viewObj!.getElement('$attrs').getElement('offset')!.getString('x'))
          .assertEqual(data.testValue.expectValue.offset!.x);
        expect(data.viewObj!.getElement('$attrs').getElement('offset')!.getString('y'))
          .assertEqual(data.testValue.expectValue.offset!.y);
      } else if (data.testValue.describe == 'Visibility') {
        // Test visibility defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getString(visibility):' +
        data.viewObj!.getElement('$attrs').getString('visibility'));
        expect(data.viewObj!.getElement('$attrs').getString('visibility'))
          .assertEqual(data.testValue.expectValue.visibility);
      } else if (data.testValue.describe == 'Enabled') {
        // Test enabled defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getBoolean(enabled):' +
        data.viewObj!.getElement('$attrs').getBoolean('enabled'));
        expect(data.viewObj!.getElement('$attrs').getBoolean('enabled'))
          .assertEqual(data.testValue.expectValue.enabled);
      } else if (data.testValue.describe == 'Touchable') {
        // Test touchable defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getBoolean(touchable):' +
        data.viewObj!.getElement('$attrs').getBoolean('touchable'));
        expect(data.viewObj!.getElement('$attrs').getBoolean('touchable'))
          .assertEqual(data.testValue.expectValue.touchable);
      } else if (data.testValue.describe == 'ResponseRegion') {
        // Test responseRegion defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getArray(responseRegion)[0]:' +
        data.viewObj!.getElement('$attrs').getArray('responseRegion')![0]);
        expect(data.viewObj!.getElement('$attrs').getArray('responseRegion')![0])
          .assertEqual(JSON.stringify(data.testValue.expectValue.responseRegion));
      } else if (data.testValue.describe == 'HitTestBehavior') {
        // Test hitTestBehavior defaults
        console.info('[' + data.caseTag + ']data.viewObj.getElement($attrs).getString(hitTestBehavior):' +
        data.viewObj!.getElement('$attrs').getString('hitTestBehavior'));
        expect(data.viewObj!.getElement('$attrs').getString('hitTestBehavior'))
          .assertEqual(data.testValue.expectValue.hitTestBehavior);
      } else {
        console.info('[' + data.caseTag + ']data.testValue.describe is error:' + data.testValue.describe
          + data.pageConfig.componentKey);
      }
    });
  })
}