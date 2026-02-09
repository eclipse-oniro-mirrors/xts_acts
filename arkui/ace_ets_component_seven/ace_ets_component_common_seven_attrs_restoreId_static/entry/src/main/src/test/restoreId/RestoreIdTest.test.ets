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
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue, SetValue} from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

/**
 * Test of common attribute: restoreId
 */
export default function restoreIdTest() {
  //A list of components that support padding attributes is required.
  let supportView = [
    'Button',
  ]

  //Page related configuration, this parameter is required.
  let targetComponentWrestoreIdth = 200;
  let targetComponentHeight = 200;
  let parentWrestoreIdth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig:PageConfig = {
    testName: 'testRestoreId',
    pageName: 'RestoreIdPage',
    pageUrl: 'MainAbility/pages/restoreId/RestoreIdPage',
    targetComponentHeight: targetComponentHeight,
    targetComponentWrestoreIdth: targetComponentWrestoreIdth,
    parentHeight: parentHeight,
    parentWrestoreIdth: parentWrestoreIdth,
    referenceComponentrestoreId: 'referenceComponentrestoreId',
    parentComponentrestoreId: 'parentComponentrestoreId',
    gutter: gutter,
    columns: columns
  }

  //The data type to be tested, this parameter is required.
  let testValues:TestValue[]= [{
    describe: 'SetRestoreId',
    setValue: {
     restoreId: 1
    },
    expectValue: {
     restoreId: 1
    }
  }]

  /**
   * Create test suite.
   */
  describe('restoreIdTest', () => {
    beforeAll(() => {
      
      await startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000);
      
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      expect(true).assertTrue();
    });
  })
}