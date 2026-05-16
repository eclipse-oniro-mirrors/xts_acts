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

import { AlignItems, AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, RectValue, TestValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { beforeAll, describe, expect } from '../../../../hypium/index';
import { AlignRuleOption, HorizontalAlign, ItemAlign, VerticalAlign } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function flexBasisTest() {
  let supportView: Array<string> = new Array<string>(
    'RowSplit',
    'ColumnSplit',
    'Select',
    'SideBarContainer',
    'WaterFlow'
  )

  let containerView: Array<string> =
    new Array<string>(
      'Row',
      'Column',
      'FlexRow',
      'FlexRowReverse',
      'FlexColumn',
      'FlexColumnReverse'
    )

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

  let testValues: TestValue[] = [
    {
      describe: 'SetNumber',
      setValue: {
        flexBasis: 100.00
      },
      expectValue: {
        expectFlexBasis: '100.00vp',
        expectSize: 100.00
      }
    },
    {
      describe: 'SetStringPx',
      setValue: {
        flexBasis: '200.00px'
      },
      expectValue: {
        expectFlexBasis: '200.00px',
        expectSize: 200.00
      }
    },
    {
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
      console.info("flexBasisTest beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.flex.nowear.test.static", "EntryAbility")
    });

    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues,
      async (data: BasePageConfig): Promise<void> => {

        console.info('alignSelfPage', data.testValue.setValue)
        AppStorage.setOrCreate<number | string>('_flexBasis', data.testValue.setValue.flexBasis)
        await Utils.sleep(1000);

        console.log(pageConfig.componentKey + '  test011')
        let strJson = inspector.getInspectorByKey(pageConfig.componentKey as String);
        await Utils.sleep(2000)
        console.log(JSON.stringify(strJson) + 'test789')
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
          expect(data.viewObj!.getElement('$attrs').getString('flexBasis'))
            .assertEqual(data.testValue.expectValue.expectFlexBasis);
          console.info('[' + data.caseTag + '] data.viewObj.$attrs.flexBasis' +
          data.viewObj!.getElement('$attrs').getString('flexBasis'));
        }

        //Get target component rect
        console.info('[' + data.caseTag + '] Get target component rect');
        let rect = Utils.getComponentRect(data.pageConfig.componentKey as string);

        console.info('[' + data.caseTag + '] check the size of the component in the spindle ' +
          'direction has been changed by flexBasis ');

        //Verify the size is or not be the expect size
        if (data.pageConfig.containerView == 'Row' || data.pageConfig.containerView == 'FlexRow'
          || data.pageConfig.containerView == 'FlexRowReverse') {

          let realWidth = rect.right - rect.left;
          console.log('test rect is: ' + JSON.stringify(rect))
          console.info('[' + data.caseTag + '] realWidth : ' + realWidth);
          console.log('test rect is: ' + data.testValue.expectValue.expectSize)

          expect(Math.floor(Math.abs(realWidth - (data.testValue.expectValue.expectSize as Double))) <= 1).assertTrue();
        } else if (data.pageConfig.containerView == 'Column' || data.pageConfig.containerView == 'FlexColumn'
          || data.pageConfig.containerView == 'FlexColumnReverse') {

          let realHeight = rect.bottom - rect.top;
          console.info('[' + data.caseTag + '] realHeight : ' + realHeight);
          expect(Math.floor(Math.abs(realHeight - (data.testValue.expectValue.expectSize as Double))) <= 1)
            .assertTrue();
        }
      })
  })
}