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
import udmfType from '@ohos.data.uniformTypeDescriptor';
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, {
  BasePageConfig,
  PageConfig,
  TestValue,
  RectValue,
  ExpectValue,
  SetV
} from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, beforeAll, expect } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,  Position, $r } from '@ohos.arkui.component';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';

let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();

export default function AccessibilityTextTest() {
  //A list of components that support the position attribute, which is required.
  let supportView: Array<string> = new Array<string>(
    'Button',
  )

  //Custom params.
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testAccessibilityText',
    pageName: 'accessibilityTextPage',
    pageUrl: 'MainAbility/pages/accessibilityText/AccessibilityTextPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues: TestValue[] = [{
    describe: 'SetAccessibilityText',
    setValue: {
      accessibilityText: 'accessibilityTextTest'
    } ,
    expectValue: {
      accessibilityText: 'accessibilityTextTest'
    }
  }]

  /**
   * Create test suite.
   */
  describe('accessibilityTextTest', () => {
beforeAll(() => {
  console.info("markAnchorTest beforeAll start");
  
  
  await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
  
});
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the target component properties.
      AppStorage.setOrCreate<SetV>('_zIndexButtonModifier',data.testValue.setValue)
      console.error('[' + data.caseTag + '] accessibilityTextTest');
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      console.error('[' + data.caseTag + '] check accessibilityText.' + ` ${data.testValue.setValue.accessibilityText}`);
      expect(true).assertTrue();
    });
  })
}