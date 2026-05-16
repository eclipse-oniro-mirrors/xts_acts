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
import Utils , { BasePageConfig, PageConfig, TestValue, RectValue,RectValueExpect }  from '../../../ets/MainAbility/common/Utils';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { $r , Padding, Resource} from '@ohos.arkui.component'
import {
  Color
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest} from '../Util.test'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function paddingTest1() {
  //A list of components that support padding attributes is required.
  let supportView: Array<string> = new Array<string>(
    'Select'
    // 'Web' // 外领域 app died
  )

  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingBase',
    pageName: 'PaddingBasePage',
    pageUrl: 'MainAbility/pages/padding/PaddingBasePage',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [
    {
      describe: 'SetPadding',
      setValue: {
        padding: {
          top: 200,
          right: 100,
          bottom: 100,
          left: 100
        } as Padding
      },
      expectValue: {
        padding: {
          top: '200.00vp', right: '100.00vp', bottom: '100.00vp', left: '100.00vp'
        } as RectValueExpect
      }
    },
    {
    describe: 'SetPaddingTop',
    setValue: {
      padding: {
        top: 200
      } as Padding
    },
    expectValue: {
      padding: {
        top: '200.00vp'
      } as RectValueExpect
    }
  }, {
    describe: 'SetPaddingRight',
    setValue: {
      padding: {
        right: 200
      } as Padding
    },
    expectValue: {
      padding: {
        right: '200.00vp'
      } as RectValueExpect
    }
  }, {
    describe: 'SetPaddingBottom',
    setValue: {
      padding: {
        bottom: 200
      } as Padding
    },
    expectValue: {
      padding: {
        bottom: '200.00vp'
      } as RectValueExpect
    }
  }, {
    describe: 'SetPaddingLeft',
    setValue: {
      padding: {
        left: 200
      } as Padding
    },
    expectValue: {
      padding: {
        left: '200.00vp'
      } as RectValueExpect
    }
  }]

  /**
   * Create test suite.
   */
  describe('PaddingBaseTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.padding.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues,async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      // AttrsManager.change(data.caseTag, {
      //   padding: {
      //     left: 0, right: 0, top: 0, bottom: 0
      //   } as Padding
      // });
      // AppStorage.setOrCreate<Padding>('_padding', { left: 0, right: 0, top: 0, bottom: 0 } as Padding )
      // await Utils.sleep(1000);

      //Modify the target component properties.
      // AttrsManager.change(data.caseTag, data.testValue.setValue);
      // AppStorage.setOrCreate<Padding>('_padding', data.testValue.setValue.padding as Padding )
      // await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let viewObj = Utils.getComponentByKey(data.pageConfig.componentKey);
      console.info('[' + data.caseTag + '] viewObj.getElement($attrs).getElement(padding):' + viewObj.getElement('$attrs').getElement('padding'));
      console.info('[' + data.caseTag + '] data.testValue.expectValue.padding:' + data.testValue.expectValue.padding);
      console.log('[wll]'+data.caseTag+'————'+data.testValue.describe)
      if (data.testValue.describe == 'SetPaddingTop') {
        //Verify the method of setting top separately.
        console.info('[' + data.caseTag + '] JSON.parseJsonElement(viewObj.getElement($attrs).getElement(padding)).top:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('top'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('top')).assertEqual((data.testValue.expectValue.padding as RectValueExpect).top);
      } else if (data.testValue.describe == 'SetPaddingRight') {
        //Verify the method of setting right separately.
        console.info('[' + data.caseTag + '] JSON.parseJsonElement(viewObj.getElement($attrs).getElement(padding)).right:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('right'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('right')).assertEqual((data.testValue.expectValue.padding as RectValueExpect).right);
      } else if (data.testValue.describe == 'SetPaddingBottom') {
        //Verify the method of setting bottom separately.
        console.info('[' + data.caseTag + '] JSON.parseJsonElement(viewObj.getElement($attrs).getElement(padding)).bottom:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('bottom'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('bottom')).assertEqual((data.testValue.expectValue.padding as RectValueExpect).bottom);
      } else if (data.testValue.describe == 'SetPaddingLeft') {
        //Verify the method of setting left separately.
        console.info('[wll]SetPaddingLeft__???')
        console.info('[wll]SetPaddingLeft'+JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')))
        console.info('[wll]SetPaddingLeft'+JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('left'))
        console.info('[wll]SetPaddingLeft'+(data.testValue.expectValue.padding as RectValueExpect).left)
        console.info('[' + data.caseTag + '] JSON.parseJsonElement(viewObj.getElement($attrs).getElement(padding)).left:'
          + JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('left'));
        expect(JSON.parseJsonElement(viewObj.getElement('$attrs').getString('padding')).getString('left')).assertEqual((data.testValue.expectValue.padding as RectValueExpect).left);
      } else if (data.testValue.describe == 'SetPadding') {
        //Method for verifying the setting of padding.
        console.info('[wll]SetPadding'+viewObj.getElement('$attrs').getString('padding'))
        console.info('[wll]SetPadding'+JSON.stringify(data.testValue.expectValue.padding))
        console.info('[' + data.caseTag + '] viewObj.getElement($attrs).getElement(padding):' + viewObj.getElement('$attrs').getString('padding'));
        expect(viewObj.getElement('$attrs').getString('padding')).assertEqual(JSON.stringify(data.testValue.expectValue.padding));
      }
    })
  })
}
