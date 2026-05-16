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
import Utils, { BasePageConfig, PageConfig, TestValue, ZIndex } from '../../../ets/MainAbility/common/Utils';
import { expect, it, Level,describe, Size, TestType,beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import CommonTest from '../common/CommonTest'
import { State, Link, StoragePropRef,AppStorage } from '@ohos.arkui.stateManagement'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function zIndexTest() {
  let supportView = [
    'Button',
  ]


  
  let targetComponentWidth = 200;
  let targetComponentHeight = 200;
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:PageConfig = {
    testName: 'testZIndex',
    pageName: 'zIndexPage',
    pageUrl: 'MainAbility/pages/zIndex/ZIndexPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWidth: targetComponentWidth,
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey',
    parentComponentKey: 'parentComponentKey',
    gutter: gutter,
    columns: columns
  }

  let testValues:TestValue[] = [{
    describe: 'SetUpperLayer',
    setValue: {
      zIndex: 2
    },
    expectValue: {
      zIndex: 2
    }
  }]

  /**
   * Create test suite.
   */
  describe('zIndexTest', () => {
    beforeAll(() => {
      console.info("beforeAll start");

      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data:BasePageConfig) => {
      
      console.info('[' + data.caseTag + '] zIndexTest');
      console.info('[' + data.caseTag + '] check zIndex.' + ` ${data.testValue!.setValue!.zIndex}`);
      console.info('[' + data.testValue!.expectValue!.zIndex + '] expectValue');
      console.info('[' + data.viewObj!.getElement('$attrs').getDouble('zIndex') + '] viewObj.$attrs.zIndex');
      expect(data.viewObj!.getElement('$attrs').getDouble('zIndex')).assertEqual(data.testValue!.expectValue!.zIndex);
    });
  })
}